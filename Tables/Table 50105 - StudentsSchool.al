table 50105 "Students School"
{
    DataClassification = CustomerContent;


    fields
    {
        field(1; "School code"; Code[20])
        {
            DataClassification = CustomerContent;

        }

        field(2; "School Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(3; No; Integer)
        {
            AutoIncrement = true;
        }

    }

    keys
    {
        key(PK; "School Name", "School code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "School Name")
        {

        }
        fieldgroup(Brick; "School Name")
        {

        }
    }
}
