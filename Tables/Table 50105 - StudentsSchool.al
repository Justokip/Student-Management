table 50105 "Students School"
{
    DataClassification = CustomerContent;


    fields
    {
        field(1; "School code"; Code[20])
        {
            DataClassification = CustomerContent;
            // DataClassificationProperty = YearID;
            // DataClassificationMethod = IdNumber;
        }

        field(2; "School Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }

        field(3; "Department"; code[50])
        {
            DataClassification = CustomerContent;
        }

       
    }

    keys
    {
        key(PK;"School code")
        {
            Clustered = true;
        }
    }
}
