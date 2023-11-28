table 50103 "Students Setup"
{
    DataClassification = ToBeClassified;



    fields
    {
        field(1; primarykey; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "No.Series"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'StudentApp No.Series';

        }
        field(3; "Minimum Age"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(4; "Maximum Age"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "No.Seriess"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Admission No.Series';

        }
        field(6; "Entry No."; Code[20])
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(7; "Reg No."; Code[20])
        {

            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(14; "Fee Structure Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Fee Structure Code';
            TableRelation = "No. Series";
        }
        field(15; "Invoice Code"; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Invoice Code';
            TableRelation = "No. Series";
        }
        field(16; "Payment NO."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Receipt No.';
            TableRelation = "No. Series";
        }

        field(21; "Gen.Bus Posting Group"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Gen.Bus Posting Group';
            TableRelation = "Gen. Business Posting Group";
        }
        field(22; "VAT.Bus Posting Group"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'VAT.Bus Posting Group';
            TableRelation = "VAT Business Posting Group";
        }
        field(23; "Customer Posting Group"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer Posting Group';
            TableRelation = "Customer Posting Group";
        }
        field(18; "General Journal Template"; Code[100])
        {
            Caption = 'General Journal Template';
            DataClassification = CustomerContent;
            TableRelation = "Gen. Journal Template";
        }
        field(19; "General Journal Batch"; Code[100])
        {
            Caption = 'General Journal Batch';
            DataClassification = CustomerContent;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("General Journal Template"));
        }
        field(20; "Invoicing GL Account"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Invoicing GL Account';
            TableRelation = "G/L Account";
        }
    }

    keys
    {
        key(pk; primarykey)
        {
            Clustered = true;
        }
    }



}