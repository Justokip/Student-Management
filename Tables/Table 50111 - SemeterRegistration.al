table 50111 "Student Semester Registration"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Entry No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(3; Semester; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Semester Registration";
        }
        field(1; "Adm No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer where("Customer Type" = field("Customer Type"));
            trigger OnValidate()
            var
                StudentApplnTable: Record "Student Application Table";
            begin
                StudentApplnTable.Reset();
                StudentApplnTable.SetCurrentKey("Adm no.");
                StudentApplnTable.SetRange("Adm no.", "Adm No.");
                if StudentApplnTable.FindFirst() then begin
                    "Full Name" := StudentApplnTable."Full Name";
                    Course := StudentApplnTable.Course;
                    School := StudentApplnTable.School;
                    Department := StudentApplnTable.Department;

                end;
            end;

        }
        field(2; "Full Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50; "Academic Year"; code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Academic Year";
            Caption = 'Academic Year';
        }

        field(9; "Course Code"; Code[50])
        {
            DataClassification = ToBeClassified;


        }
        field(5; Course; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Course Name';

        }
        field(6; School; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(7; Department; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(3009; "Customer Type"; option)
        {
            OptionMembers = Customers,Students;
            OptionCaption = 'Customers, Students';
            DataClassification = CustomerContent;
        }
        field(8; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Registerd;
            Caption = 'Open,Registered';
            Editable = false;
        }

    }

    keys
    {
        key(Key1; "Adm No.")
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
            NoSeriesManagement.InitSeries(StudentsSetup."Reg No.", StudentsSetup."Reg No.", WorkDate(), "Entry No.", StudentsSetup."Reg No.");
        end;
        "Customer Type" := "Customer Type"::Students;
    end;

}