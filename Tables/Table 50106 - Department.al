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

        // field(3; "Program Level"; Enum "Course Type")
        // {
        //     DataClassification = ToBeClassified;
        // }

        // field(4; "Course"; Code[70])
        // {
        //     DataClassification = ToBeClassified;
        // }
    }

    keys
    {
        key(PK;"Department Code")
        {
            Clustered = true;
        }
      
    }
}
