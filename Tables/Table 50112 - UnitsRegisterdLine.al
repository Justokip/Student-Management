table 50112 "Registered units"
{
    DataClassification = ToBeClassified;

    fields
    {

        field(1; "Entry No."; Code[20])
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(6; "Unit Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Students Units Setup"; //where("Course Name" =field("Course Name")); //, Semester = field(Semester));
            trigger OnValidate()
            var
                StudentsUnitsSetup: Record "Students Units Setup";
            begin
                StudentsUnitsSetup.Reset();
                StudentsUnitsSetup.SetCurrentKey("Unit Code");
                StudentsUnitsSetup.SetRange("Unit Code", "Unit Code");
                if StudentsUnitsSetup.FindFirst() then begin
                    "Unit Name" := StudentsUnitsSetup."Unit Name";
                    rec.Modify();

                end;


            end;

        }
        field(2; "Unit Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }


        field(5; "Course Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(7; Semester; code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Semester Registration";
        }
        field(8; Registered; Boolean)
        {
            DataClassification = ToBeClassified;
        }



    }

    keys
    {
        key(Key1; "Unit Code", "Course Name", "Unit Name")
        {
            Clustered = true;
        }
    }
}