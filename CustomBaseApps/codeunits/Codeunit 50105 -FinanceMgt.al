codeunit 50105 "Finance Management"
{
    procedure PostStudentInvoice(Inv: Record "Student Invoice")
    var
        LineNo: Integer;
        JornalBatch: Record "Gen. Journal Batch";
        StudentManagement: Record "Students Setup";
        GeneralJournalLine: Record "Gen. Journal Line";
        GLRegister: Record "G/L Register";
        InvoiceLines: Record "Invoice Lines";
        StudentFeeStructure: Record "Fee Structure";
        CustomerLedger: Record "Cust. Ledger Entry";
        Invoicelns1: Label '%1 has already been posted!';
        Invoicelns2: Label 'Are you sure you want to post %1';
        Invoicelns3: Label 'Invoice has not been approved!Kindly approve before posting';

        mm: Code[100];
    begin
        with Inv do begin
            if not Confirm(Invoicelns2, false, "Invoice Code") then
                exit;
            if Posted then
                //     Error(Invoicelns1, "Invoice Code");
                if "Approval Status" <> "Approval Status"::Approved then
                    //     Error(Invoicelns3);
                    StudentManagement.Get();
            // StudentManagement.TestField("General Journal Batch");
            // StudentManagement.TestField("General Journal Template");
            // StudentManagement.TestField("Invoicing GL Account");

            Inv.TestField("Posting Date");
            Inv.TestField("Application No.");

            JornalBatch.Init();
            JornalBatch."Journal Template Name" := StudentManagement."General Journal Template";
            JornalBatch.Name := "Invoice Code";
            if not JornalBatch.Get(StudentManagement."General Journal Template", "Invoice Code") then
                JornalBatch.Insert;

            InvoiceLines.Reset();
            InvoiceLines.SetRange("Entry No.", "Invoice Code");
            if InvoiceLines.FindSet() then begin
                repeat
                    StudentFeeStructure.Get(InvoiceLines."Fee Structure Code");

                    LineNo := LineNo + 1000;
                    GeneralJournalLine.Init();
                    GeneralJournalLine."Journal Template Name" := JornalBatch."Journal Template Name";
                    GeneralJournalLine."Journal Batch Name" := JornalBatch.Name;
                    GeneralJournalLine."Line No." := LineNo;

                    //credit
                    GeneralJournalLine."Bal. Account Type" := StudentFeeStructure."Bal.Account Type";
                    GeneralJournalLine."Account No." := StudentFeeStructure."Balancing Acc. No.";
                    GeneralJournalLine."Posting Date" := "Posting Date";
                    GeneralJournalLine."Document No." := InvoiceLines."Entry No.";
                    GeneralJournalLine.Amount := InvoiceLines.Amount;
                    GeneralJournalLine.Description := StrSubstNo('%1 for invoice reference No. %2', InvoiceLines."Entry No.");
                    Message(Format(Amount));
                    mm := StudentFeeStructure."Balancing Acc. No.";
                    Message(Format(mm));
                    //dedit
                    GeneralJournalLine."Bal. Account Type" := GeneralJournalLine."Bal. Account Type"::Customer;
                    GeneralJournalLine."Bal. Account No." := "Application No.";
                    GeneralJournalLine.Amount := -Round(InvoiceLines.Amount);
                    GeneralJournalLine.Validate(Amount);
                    Message(Format(Amount));

                    if GeneralJournalLine.Amount <> 0 then
                        GeneralJournalLine.Insert;
                until InvoiceLines.Next() = 0;
            end;
        end;
        GeneralJournalLine.Reset();
        GeneralJournalLine.SetRange("Journal Template Name", StudentManagement."General journal Template");
        GeneralJournalLine.SetRange("Journal Batch Name", Inv."Invoice Code");

        GLRegister.Reset();
        GLRegister.SetRange("Journal Batch Name", Inv."Invoice Code");
        if GLRegister.Find('-') then begin
            Inv.Posted := true;
            Inv.Modify();

            //insert document number as invoice upon posting and customer type as student
            CustomerLedger.Reset();
            CustomerLedger.SetRange("Document No.", Inv."Invoice Code");
            if CustomerLedger.FindSet() then begin
                CustomerLedger."Document Type" := CustomerLedger."Document Type"::Invoice;
                //CustomerLedger."Customer Type" :=CustomerLedger."Customer Type"::Student;
                CustomerLedger.Modify();
            end;
        end;
    end;







}