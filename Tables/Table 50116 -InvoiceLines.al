table 50116 "Invoice Lines"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Code[20])
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
            TableRelation = "Student Invoice";
        }
        field(7; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line No.';
        }

        field(2; "Payment Type"; code[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Payment Type';
            TableRelation = "Fee Structure";
        }
        field(6; "Fee Structure Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Fee Structure Code';
            TableRelation = "Fee Structure";
        }
        field(3; "Description"; code[50])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(59; "Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = 'Invoiced Amount';
        }
        field(8; "Bal.Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Bal.Account Type';
            DataClassification = CustomerContent;
        }
        field(9; "Balancing Acc. No."; Code[20])
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

        field(5; "No. Series"; Code[50])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
        field(10; "Transaction Type"; Text[100])
        {
            Caption = 'Transaction Type';
            DataClassification = CustomerContent;

        }
        field(11; "Payment Code"; Text[50])
        {
            Caption = 'Payment Code';
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key(PK; "Entry No.", "Line No.")
        {
            Clustered = true;
        }
    }

}