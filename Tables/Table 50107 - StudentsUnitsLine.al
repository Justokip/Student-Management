table 50107 "Students Units Setup"
{
    DataClassification = ToBeClassified;
    Caption = 'Students Units Setup';

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


    }

    keys
    {
        key(PK; "Entry No.", "Course Name", "Unit Code", "Unit Name")
        {
            Clustered = true;
        }
    }
    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        StudentsSetup: Record "Students Setup";

    trigger OnInsert()
    begin
        if "Entry No." = '' then begin
            StudentsSetup.Get();
            NoSeriesManagement.InitSeries(StudentsSetup."Entry No.", StudentsSetup."Entry No.", WorkDate(), "Entry No.", StudentsSetup."Entry No.");

        end;

    end;
}

