table 50102 "Students line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(7; "No.";  Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(1; "Institution"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Institution Attended';

        }
        field(4; "From"; Integer)
        {
            Caption = 'FROM (YEAR)';

        }
        field(6; "To(Year)"; Integer)
        {
            Caption = 'TO (YEAR)';

        }
        field(8; Grade; Code[2])
        {
            Caption = 'MEAN GRADE';
        }
    }

    keys
    {
        key(pk; "No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}