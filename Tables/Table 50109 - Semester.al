table 50119 "Semester Registration"
{
    DataClassification = ToBeClassified;
    DataPerCompany = true;
    Caption = 'Semester Registration';

    fields
    {
        field(1; "Semester code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Semester Code';

        }
        field(2; "Semester Name"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Semester';
        }

    }
    keys
    {
        key(PK; "Semester Name", "Semester code")

        {
            Clustered = true;

        }

    }
    fieldgroups
    {
        fieldgroup(DropDown; "Semester Name")
        {

        }
        fieldgroup(Brick; "Semester Name")
        {

        }
    }
}

