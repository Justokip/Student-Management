table 50107 "Students Units Setup"
{
    DataClassification = ToBeClassified;
    Caption = 'Students Units Setup';

    fields
    {
        field(1; "Unit Code"; Code[20])
        {
            DataClassification = ToBeClassified;

        }

        field(2; "Unit Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
           field(4; "Course" ; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Course Table"."Course ID";
        }

     
    }

    keys
    {
        key(PK; "Unit Code")
        {
            Clustered = true;
        }
    }
}

