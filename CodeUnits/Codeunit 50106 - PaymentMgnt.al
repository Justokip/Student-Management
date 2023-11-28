codeunit 50106 "Payment Management"
{
    procedure PostedStudInv(Inv: Record "Student Invoice")
    var
        LineNo: Integer;
        JnlBatch: Record "Gen. Journal Batch";
        StudMgt: Record "Students Setup";
        GenJnlLine: Record "Gen. Journal Line";
        GlRegister: Record "G/L Register";
        //InvLines: Record "Student Invoice";
        invline: Record "Invoice Lines";
        StudFeeStr: Record "Fee Structure";
        CustLdgr: Record "Cust. Ledger Entry";
        Invoicelns1: Label '%1 has already been posted!';
        Invoicelns2: Label 'Are you sure you want to post %1';
        Invoicelns4: Label ' Invoice %1 has already been posted';
    begin
        with Inv do begin
            if not Confirm(Invoicelns2, false, "Invoice Code") then
                exit;
            if Posted then
                Error(Invoicelns4, "Invoice Code");
            StudMgt.Get();
            StudMgt.TestField("General Journal Batch");
            StudMgt.TestField("General Journal Template");
            Inv.TestField("Posting Date");

            //Inv.TestField(Balance);
            Inv.TestField("Application No.");
            JnlBatch.Init();
            JnlBatch."Journal Template Name" := StudMgt."General Journal Template";
            JnlBatch.Name := "Invoice Code";
            if not JnlBatch.Get(StudMgt."General Journal Template", "Invoice Code") then
                JnlBatch.Insert();
            InvLine.Reset();
            InvLine.SetRange("Entry No.", "Invoice Code");
            if InvLine.FindSet() then begin
                repeat
                    StudFeeStr.Get(invline."Fee Structure Code");
                    LineNo += 1000;
                    GenJnlLine.Init();
                    GenJnlLine."Journal Template Name" := JnlBatch."Journal Template Name";
                    GenJnlLine."Journal Batch Name" := JnlBatch.Name;
                    GenJnlLine."Line No." := LineNo;
                    // credit
                    GenJnlLine."Account Type" := StudFeeStr."Account Type";
                    GenJnlLine."Account No." := StudFeeStr."Account No.";
                    GenJnlLine."Posting Date" := Inv."Posting Date";
                    GenJnlLine."Document No." := InvLine."Entry No." + '' + Format(LineNo);
                    GenJnlLine."Document Type" := GenJnlLine."Document Type"::Invoice;
                    GenJnlLine.Description := StrSubstNo('%1 For Invoice Reference No. %2', invline."Transaction Type", InvLine."Entry No.");
                    // Debit
                    GenJnlLine."Bal. Account Type" := GenJnlLine."Bal. Account Type"::Customer;
                    GenJnlLine."Bal. Account No." := "Application No.";
                    GenJnlLine.Amount := -Round(InvLine.Amount);
                    GenJnlLine.Validate(Amount);

                    if GenJnlLine.Amount <> 0 then
                        GenJnlLine.Insert;
                until InvLine.Next() = 0;

            end;

        end;

        GenJnlLine.Reset;
        GenJnlLine.SetRange("Journal Template Name", StudMgt."General Journal Template");
        GenJnlLine.SetRange("Journal Batch Name", Inv."Invoice Code");
        Codeunit.Run(Codeunit::"Gen. Jnl.-Post Batch", GenJnlLine);
        GlRegister.Reset;
        GlRegister.SetRange("Journal Batch Name", Inv."Invoice Code");
        if GlRegister.Find('-') then begin
            Inv.Posted := true;
            Inv.Modify();
            // Insert Document Number As Invoice Upon posting And Customer Type As Student
            CustLdgr.Reset();
            CustLdgr.SetRange("Document No.", Inv."Invoice Code");
            if CustLdgr.FindSet() then begin
                CustLdgr."Document Type" := CustLdgr."Document Type"::Invoice;
                //CustLdgr."Customer Type" := CustLdgr."Customer Type"::Student;
                CustLdgr.Modify();
            end;

        end;
    end;

    procedure PaymentPosting(var PaymentRec: Record "STDN Payments")
    var
        Studsetup: Record "Students Setup";
        Customer: Record Customer;
        JournalBatch: Record "Gen. Journal Batch";
        DocumentNo: Code[20];
        NoSeries: Codeunit NoSeriesManagement;
        LinNo: Integer;
        GJLine: Record "Gen. Journal Line";
        PayLines: Record "STDN Payment Lines";
        PayText1: Label 'Are you sure you want to post Payment No. %1 ?';
        PayText2: Label 'The Payment %1 has Already been Posted!';
        Massage1: Label 'The Payment %1 has been Posted Successfully!';
        GenJournalPost: Codeunit "Gen. Jnl.-Post Batch";
        CustomerLedger: Record "Cust. Ledger Entry";

    begin

        Studsetup.Get();
        Studsetup.TestField("General Journal Batch");
        Studsetup.TestField("General Journal Template");

        PaymentRec.TestField("Paying Bank Account");
        PaymentRec.TestField("Document Date");
        PaymentRec.TestField("Payment Mode");


        if PaymentRec.Posted then
            Error(PayText2, PaymentRec."Payment No.");

        if Not Confirm(PayText1, false, PaymentRec."Payment No.") then
            exit;

        GJLine.Reset();
        GJLine.SetRange("Journal Template Name", Studsetup."General Journal Template");
        GJLine.SetRange("Journal Batch Name", Studsetup."General Journal Batch");
        GJLine.DeleteAll();

        JournalBatch.Get(Studsetup."General Journal Template", Studsetup."General Journal Batch");
        if JournalBatch."No. Series" <> '' then
            DocumentNo := NoSeries.GetNextNo(JournalBatch."No. Series", 0D, true)
        else
            DocumentNo := PaymentRec."Payment No.";

        PayLines.Reset();
        PayLines.SetCurrentKey("No.", "Line No", Semester, "Adm.", "Fee Type");
        PayLines.SetRange("No.", PaymentRec."Payment No.");//Check which field you will use
        PayLines.SetFilter("Account No.", '<>%1', '');
        if PayLines.FindFirst() then
            repeat
                if PayLines."Account Type" = PayLines."Account Type"::Customer then
                    Customer.get(PayLines."Account No.");

                GJLine.Init();
                GJLine."Journal Template Name" := Studsetup."General Journal Template";
                GJLine."Journal Batch Name" := Studsetup."General Journal Batch";
                GJLine."Line No." := PayLines."Line No";
                GJLine."Document No." := DocumentNo;
                GJLine."Document Type" := GJLine."Document Type"::Payment;

                GJLine.Validate("Account Type", PayLines."Account Type");
                GJLine.Validate("Account No.", PayLines."Account No.");
                GJLine.Description := StrSubstNo('%1 for Payment Reference No. %2', PaymentRec."Adm.", PaymentRec."Payment No.");
                GJLine.Validate(Amount, -PayLines.Amount);
                GJLine.Validate("Bal. Account Type", GJLine."Bal. Account Type"::"Bank Account");
                GJLine.Validate("Bal. Account No.", PaymentRec."Paying Bank Account");
                GJLine."Posting Date" := PaymentRec."Posting Date";
                GJLine."Document Date" := PaymentRec."Document Date";
                GJLine."External Document No." := PaymentRec."Adm.";
                GJLine.Validate("Applies-to Doc. Type", PayLines."Applies-to Doc. Type");
                GJLine.Validate("Applies-to Doc. No.", PayLines."Applies-to Doc. No.");

                GJLine.Insert();

            until PayLines.Next() = 0;

        GJLine.Reset();
        GJLine.SetRange("Journal Template Name", Studsetup."General Journal Template");
        GJLine.SetRange("Journal Batch Name", Studsetup."General Journal Batch");
        if not GJLine.IsEmpty then
            Codeunit.Run(Codeunit::"Gen. Jnl.-Post Batch", GJLine);


        CustomerLedger.Reset();
        CustomerLedger.SetRange("Document No.", DocumentNo);
        if CustomerLedger.FindLast() then begin
            PayLines.Reset();
            PayLines.SetRange("No.", PaymentRec."Payment No.");
            PayLines.SetRange("Payment Posted", False);
            if PayLines.FindFirst() then begin
                repeat
                    PayLines."Payment Posted" := true;
                    PayLines.Modify(true);
                until PayLines.Next() = 0;
            end;
            PaymentRec.Posted := true;
            PaymentRec.Status := PaymentRec.Status::Registered;
        end;
        Message(Massage1, PaymentRec."Payment No.");
    end;

}