table 50106 "Department"
{
    DataClassification = CustomerContent;


    fields
    {
        field(1; "Department Code"; Code[20])
        {
            DataClassification = CustomerContent;

        }

        field(2; "Department Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(3; "School Name"; Text[100])
        {
            DataClassification = CustomerContent;
            TableRelation = "Students School";
        }
        field(6; No; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(PK; "Department Name", No, "Department Code")
        {
            Clustered = true;
        }

    }
    fieldgroups
    {
        fieldgroup(DropDown; "Department Name")
        {

        }
        fieldgroup(Brick; "Department Name")
        {

        }
    }
}
