table 50118 "STDN Payment Lines"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            Editable = false;
        }

        field(5; "Fee Type"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Fee Type';
            TableRelation = "Fee Structure" where("Fee Structure Code" = field("Adm."));

            trigger OnValidate()
            var
                InvoiceLines: Record "Fee Structure";
                CurrencyCode: Record Currency;
            begin
                InvoiceLines.Reset();
                InvoiceLines.SetCurrentKey("Fee Structure Code");
                InvoiceLines.SetRange("Fee Type", "Fee Type");

                if InvoiceLines.FindFirst() then begin
                    "Fee Type" := InvoiceLines."Fee Type";
                    "Invoice Amount" := InvoiceLines.Amount;
                    Amount := InvoiceLines.Amount;
                    "Account Type" := "Account Type"::Customer;
                    "Account No." := "Adm.";
                    Description := InvoiceLines.Description;
                    "Document Type" := "Document Type"::Payment;
                    "Applies-to Doc. Type" := "Applies-to Doc. Type"::Invoice;
                end;

            end;
        }
        field(17; "Document Type"; Enum "Gen. Journal Document Type")
        {
            Caption = 'Document Type';
        }
        field(2; "Line No"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line No';
            AutoIncrement = true;
        }
        field(12; Date; DateTime)
        {
            DataClassification = CustomerContent;
            Caption = 'Date';
            Editable = false;
        }
        field(16; Amount; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount';

        }
        field(3; "Invoice Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Invoice Amount';
            Editable = false;
            trigger OnValidate()
            begin

            end;

        }
        field(9; "Account Type"; Enum "Gen. Journal Account Type")
        {

            Caption = 'Account Type';
        }
        field(8; "Account No."; Code[20])
        {
            Caption = 'Student No.';
            TableRelation = IF ("Account Type" = CONST("G/L Account")) "G/L Account" WHERE("Account Type" = CONST(Posting),
                                                                                          Blocked = CONST(false))
            ELSE
            IF ("Account Type" = CONST(Customer)) Customer where("Customer Type" = const(students))
            ELSE
            IF ("Account Type" = CONST(Vendor)) Vendor
            ELSE
            IF ("Account Type" = CONST("Bank Account")) "Bank Account"
            ELSE
            IF ("Account Type" = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Account Type" = CONST("IC Partner")) "IC Partner"
            ELSE
            IF ("Account Type" = CONST(Employee)) Employee;
            Editable = false;


        }
        field(10; "Bal. Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Bal. Account Type';

            trigger OnValidate()
            begin

                if ("Account Type" in ["Account Type"::Customer, "Account Type"::Vendor, "Account Type"::"Fixed Asset",
                                       "Account Type"::"IC Partner", "Account Type"::Employee]) and
                   ("Bal. Account Type" in ["Bal. Account Type"::Customer, "Bal. Account Type"::Vendor, "Bal. Account Type"::"Fixed Asset",
                                            "Bal. Account Type"::"IC Partner", "Bal. Account Type"::Employee])
                then
                    Error(
                      Text000,
                      FieldCaption("Account Type"), FieldCaption("Bal. Account Type"));
            end;
        }
        field(11; "Bal. Account No."; Code[20])
        {
            Caption = 'Bal. Account No.';
            TableRelation = IF ("Bal. Account Type" = CONST("G/L Account")) "G/L Account" WHERE("Account Type" = CONST(Posting),
                                                                                               Blocked = CONST(false))
            ELSE
            IF ("Bal. Account Type" = CONST(Customer)) Customer
            ELSE
            IF ("Bal. Account Type" = CONST(Vendor)) Vendor
            ELSE
            IF ("Bal. Account Type" = CONST("Bank Account")) "Bank Account"
            ELSE
            IF ("Bal. Account Type" = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Bal. Account Type" = CONST("IC Partner")) "IC Partner"
            ELSE
            IF ("Bal. Account Type" = CONST(Employee)) Employee;
        }
        field(7; Description; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(6; Semester; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Semester';
        }
        field(13; "Adm."; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Admission No.';
            Editable = false;
        }
        field(14; "Payment Posted"; Boolean)
        {
            Caption = 'Payment Posted';
            Editable = false;
        }
        field(15; "Applies-to Doc. Type"; Enum "Gen. Journal Document Type")
        {
            Caption = 'Applies-to Doc. Type';
            trigger OnValidate()
            begin
                if "Applies-to Doc. Type" <> xRec."Applies-to Doc. Type" then
                    Validate("Applies-to Doc. No.", '');
            end;
        }
        field(53; "Applies-to Doc. No."; Code[20])
        {
            Caption = 'Applies-to Doc. No.';

            trigger OnLookup()
            var
                GenJnlLine: Record "Gen. Journal Line" temporary;
                GenJnlApply: Codeunit "Gen. Jnl.-Apply";
                ApplyCustEntries: Page "Apply Customer Entries";
                IsHandled: Boolean;
                CustLedgEntry: Record "Cust. Ledger Entry";
                PayLines: Record "STDN Payment Lines";
                payHeader: record "STDN Payments";
                NewSalesHeader: Record "Sales Header";
                NewCalcType: Enum "Customer Apply Calculation Type";
            begin
                IsHandled := false;
                OnBeforeLookupAppliesToDocNo(Rec, CustLedgEntry, IsHandled);
                if IsHandled then
                    exit;

                TestField("Bal. Account No.", '');
                TestField("Applies-to Doc. Type");

                CustLedgEntry.SetCurrentKey("Customer No.", Open, Positive, "Due Date");
                if "Account No." <> '' then
                    CustLedgEntry.SetRange("Customer No.", "Account No.");
                CustLedgEntry.SetRange(Open, true);
                if "Applies-to Doc. No." <> '' then begin
                    CustLedgEntry.SetRange("Document Type", "Applies-to Doc. Type");
                    CustLedgEntry.SetRange("Document No.", "Applies-to Doc. No.");
                    if CustLedgEntry.IsEmpty() then begin
                        CustLedgEntry.SetRange("Document Type");
                        CustLedgEntry.SetRange("Document No.");
                    end;
                end;

                xRec.Amount := Amount;
                xRec."Currency Code" := "Currency Code";
                //payHeader."Posting Date" := Today;
                if "Applies-to Doc. Type" <> "Applies-to Doc. Type"::" " then begin
                    CustLedgEntry.SetRange("Document Type", "Applies-to Doc. Type");
                    if CustLedgEntry.IsEmpty() then
                        CustLedgEntry.SetRange("Document Type");
                end;
                if Amount <> 0 then begin
                    CustLedgEntry.SetRange(Positive, Amount < 0);
                    if CustLedgEntry.IsEmpty() then
                        CustLedgEntry.SetRange(Positive);
                end;

                CustLedgEntry.SetApplyToFilters("Account No.", "Applies-to Doc. Type".AsInteger(), "Applies-to Doc. No.", Amount);
                OnAfterSetApplyToFilters(CustLedgEntry, Rec);

                //
                GenJnlLine.Reset();
                GenJnlLine.DeleteAll();

                GenJnlLine.Init();
                GenJnlLine."Line No." := Rec."Line No";
                GenJnlLine."Posting Date" := Today;
                GenJnlLine."Document Date" := Today;
                GenJnlLine."Document Type" := GenJnlLine."Document Type"::Invoice;
                GenJnlLine."Document No." := Rec."No.";
                GenJnlLine.Description := Rec.Description;
                GenJnlLine."Account Type" := Rec."Account Type"::Customer;
                GenJnlLine."Account No." := Rec."Account No.";
                GenJnlLine.Amount := Rec.Amount;
                GenJnlLine."Bal. Account Type" := Rec."Bal. Account Type";
                GenJnlLine."Bal. Account No." := Rec."Bal. Account No.";
                GenJnlLine."Applies-to Doc. Type" := Rec."Applies-to Doc. Type";
                GenJnlLine.Insert();

                //
                ApplyCustEntries.SetCalcType(NewCalcType::"Gen. Jnl. Line");
                ApplyCustEntries.SetGenJnlLine(GenJnlLine, GenJnlLine.FieldNo("Applies-to ID"));
                ApplyCustEntries.SetTableView(CustLedgEntry);
                ApplyCustEntries.SetRecord(CustLedgEntry);
                ApplyCustEntries.LookupMode(true);
                if ApplyCustEntries.RunModal = ACTION::LookupOK then begin

                    ApplyCustEntries.GetCustLedgEntry(CustLedgEntry);
                    GenJnlApply.CheckAgainstApplnCurrency(
                      "Currency Code", CustLedgEntry."Currency Code", GenJnlLine."Account Type"::Customer, true);
                    "Applies-to Doc. Type" := CustLedgEntry."Document Type";
                    "Applies-to Doc. No." := CustLedgEntry."Document No.";
                    //  PayLines.SetRange("Adm.");
                    OnAfterAppliesToDocNoOnLookup(Rec, CustLedgEntry);
                end;
                Clear(ApplyCustEntries);
            end;

            trigger OnValidate()
            var
                IsHandled: Boolean;

                CustLedgEntry: Record "Cust. Ledger Entry";
            begin
                IsHandled := false;
                OnBeforeValidateAppliesToDocNo(Rec, CustLedgEntry, xRec, IsHandled);
                if IsHandled then
                    exit;

                if "Applies-to Doc. No." <> '' then
                    TestField("Bal. Account No.", '');

                if ("Applies-to Doc. No." <> xRec."Applies-to Doc. No.") and (xRec."Applies-to Doc. No." <> '') and
                   ("Applies-to Doc. No." <> '')
                then begin
                    CustLedgEntry.SetAmountToApply("Applies-to Doc. No.", "Account No.");
                    CustLedgEntry.SetAmountToApply(xRec."Applies-to Doc. No.", "Account No.");
                end else
                    if ("Applies-to Doc. No." <> xRec."Applies-to Doc. No.") and (xRec."Applies-to Doc. No." = '') then
                        CustLedgEntry.SetAmountToApply("Applies-to Doc. No.", "Account No.")
                    else
                        if ("Applies-to Doc. No." <> xRec."Applies-to Doc. No.") and ("Applies-to Doc. No." = '') then
                            CustLedgEntry.SetAmountToApply(xRec."Applies-to Doc. No.", "Account No.");
            end;
        }
        field(32; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }


    }

    keys
    {
        key(Key1; "No.", "Line No", Semester, "Adm.", "Fee Type")
        {
            Clustered = true;
        }
    }
    var
        NoSeriesMng: Codeunit NoSeriesManagement;
        StudentSetup: Record "Students Setup";
        Text000: Label '%1 or %2 must be a G/L Account or Bank Account.', Comment = '%1=Account Type,%2=Balance Account Type';
        GLAccount: Record "G/L Account";

    trigger OnInsert()
    begin
        Date := CreateDateTime(Today, Time);

    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeLookupAppliesToDocNo(var SalesHeader: Record "STDN Payment Lines"; var CustLedgEntry: Record "Cust. Ledger Entry"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSetApplyToFilters(var CustLedgerEntry: Record "Cust. Ledger Entry"; SalesHeader: Record "STDN Payment Lines")
    begin
    end;

    local procedure OnBeforeValidateAppliesToDocNo(var SalesHeader: Record "STDN Payment Lines"; var CustLedgEntry: Record "Cust. Ledger Entry"; xSalesHeader: Record "STDN Payment Lines"; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterAppliesToDocNoOnLookup(var SalesHeader: Record "STDN Payment Lines"; CustLedgerEntry: Record "Cust. Ledger Entry")
    begin
    end;
}