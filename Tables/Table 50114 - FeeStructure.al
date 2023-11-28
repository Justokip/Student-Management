table 50114 "Fee Structure"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Fee Structure Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Fee Structure Code';
            Editable = false;
            trigger OnValidate()
            var
                StudentMgntSetup: Record "Students Setup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Fee Structure Code" <> xRec."Fee Structure Code" then begin
                    StudentMgntSetup.Get();
                    StudentMgntSetup.TestField("Fee Structure Code");
                    NoseriesManagement.TestManual(StudentMgntSetup."Fee Structure Code");
                end;
            end;
        }
        field(10; "Description"; code[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "Academic Year"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Academic Year';
            TableRelation = "Academic Year";
        }
        field(4; "Semester Name"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Semester Name';
            TableRelation = "Semester Registration";
        }
        field(5; "Student Category"; Enum "Student Category")
        {
            Caption = 'Student Category';
            DataClassification = CustomerContent;
        }
        field(9; "No. Series"; Code[50])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
        field(6; "Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount';
        }
        field(7; "Bank Account Number"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Account Type';
        }
        field(8; "Bank Account Name"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Bank Account Name';
        }
        field(31; "Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Account Type';

            trigger OnValidate()
            begin
                if ("Account Type" in ["Account Type"::Customer, "Account Type"::Vendor, "Account Type"::"Fixed Asset",
                                       "Account Type"::"IC Partner", "Account Type"::Employee]) and
                   ("Bal.Account Type" in ["Bal.Account Type"::Customer,"Bal.Account Type"::Vendor, "Bal.Account Type"::"Fixed Asset",
                                            "Bal.Account Type"::"IC Partner", "Bal.Account Type"::Employee])
                then
                    Error(
                      Text000,
                      FieldCaption("Account Type"), FieldCaption("Bal.Account Type"));
            end ;
    
        }
        field(20; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            TableRelation = IF ("Account Type" = CONST("G/L Account")) "G/L Account" WHERE("Account Type" = CONST(Posting),
                                                                                          Blocked = CONST(false))
            ELSE
            IF ("Account Type" = CONST(Customer)) Customer
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
          
        }
        field(13; "Bal.Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Account Type';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if ("Bal.Account Type" in ["Bal.Account Type"::Customer, "Bal.Account Type"::Vendor, "Bal.Account Type"::"Fixed Asset",
                                       "Bal.Account Type"::"IC Partner", "Bal.Account Type"::Employee]) and
                   ("Bal.Account Type" in ["Bal.Account Type"::Customer, "Bal.Account Type"::Vendor, "Bal.Account Type"::"Fixed Asset",
                                            "Bal.Account Type"::"IC Partner", "Bal.Account Type"::Employee])
                then
                    Error(
                      Text000,
                      FieldCaption("Bal.Account Type"), FieldCaption("Bal.Account Type"));
            end;
        }
        field(11; "Balancing Acc. No."; Code[20])
        {
            Caption = 'Acc. No.';
            DataClassification = CustomerContent;
            TableRelation = if ("Bal.Account Type" = const("G/L Account")) "G/L Account" where("Account Type" = const(Posting), Blocked = const(false))
            else

            if ("Bal.Account Type" = const("G/L Account")) "G/L Account"

            else

            if ("Bal.Account Type" = const(Customer)) customer

            else

            if ("Bal.Account Type" = const(vendor)) vendor

            else

            if ("Bal.Account Type" = const("Bank Account")) "Bank Account";

        }
        field(12; "Payment Type"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Payment Type';
        }
        field(15; "Amount Sum"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount Sum';
        }
        field(16; "Fee Type"; Code[20])
        {
            DataClassification = CustomerContent;
        }


    }

    keys
    {
        key(PK; "Fee Structure Code")
        {
            Clustered = true;
        }
    }
    var
        Text000: Label '%1 or %2 must be a G/L Account or Bank Account.', Comment = '%1=Account Type,%2=Balance Account Type';
        StudentMgntSetup: Record "Students Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        StudentMgntSetup.Get();
        if "Fee Structure Code" = ' ' then
            StudentMgntSetup.TestField("Fee Structure Code");
        NoSeriesManagement.InitSeries(StudentMgntSetup."Fee Structure Code", xRec."No. Series", 0D, "Fee Structure Code", "No. Series");

    end;

}