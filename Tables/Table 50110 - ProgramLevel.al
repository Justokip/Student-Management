table 50110 "Program Level"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Level no."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Program level"; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(3; Duration; Integer)
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; "Program level")
        {
            Clustered = true;
        }
    }

}