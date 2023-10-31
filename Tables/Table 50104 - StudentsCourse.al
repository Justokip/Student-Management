table 50104 "Course Table"
{
    DataClassification = ToBeClassified;
    Caption = 'Course Table';

    fields
    {
        field(1; "Course ID"; Code[20])
        {
            DataClassification = ToBeClassified;

        }

        field(2; "Course Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(3; "School"; code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Students School";
        }

        field(4; Department; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Department;
        }
        field(5; "Academic Year"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Academic Year";
        }
        field(7; Semester; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Semester Registration";
        }
        field(6; units; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Students Units Setup";
        }


    }

    keys
    {
        key(PK; "Course ID")
        {
            Clustered = true;
        }
    }
}
