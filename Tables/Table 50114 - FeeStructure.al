table 50114 "Fee Structure"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Fee Structure Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Fee Structure Code';
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
        field(13; "Bal.Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Bal.Account Type';
            DataClassification = CustomerContent;
        }
        field(11; "Balancing Acc. No."; Code[20])
        {
            Caption = 'Balancing Acc. No.';
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

        field(12; "Payment Type"; code[30])
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

}