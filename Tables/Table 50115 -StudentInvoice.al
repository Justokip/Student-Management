table 50115 "Student Invoice"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Invoice Code"; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Invoice Code';
            Editable = false;
            trigger OnValidate()
            var
                StudentMgntSetup: Record "Students Setup";
                NoseriesManagement: Codeunit NoSeriesManagement;
            begin
                if "Invoice Code" <> xRec."Invoice Code" then begin
                    StudentMgntSetup.Get();
                    StudentMgntSetup.TestField("Invoice Code");
                    NoseriesManagement.TestManual(StudentMgntSetup."Invoice Code");
                end;
            end;

        }
        field(14; "Session Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Session Code';
            TableRelation = "Student Semester Registration";
        }

        field(2; "Application No."; Code[20])
        {
            Caption = 'Admision No.';
            DataClassification = CustomerContent;
            Editable = false;
            TableRelation = Customer where("Customer Type" = filter(students));
        }
        field(3; "Student Name"; code[50])
        {
            Caption = 'Student Name';
            Editable = false;
            DataClassification = CustomerContent;

        }
        field(4; "Course Name"; Text[50])
        {
            Caption = 'Course';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(5; "Academic Year"; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Academic Year';
            Editable = false;
        }
        field(6; "Semester Name"; Code[20])
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = 'Semester Name';
        }
        field(7; "Invoice Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Invoice Date';
        }
        field(59; "Amount"; Decimal)
        {
            Caption = 'Invoiced Amount';
            FieldClass = FlowField;
            CalcFormula = sum("Invoice Lines".Amount where("Entry No." = field("Invoice Code")));
        }
        field(9; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(12; "Due Date"; Date)
        {
            Caption = 'Due Date';
            DataClassification = CustomerContent;
        }
        field(10; "No. Series"; Code[50])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
        field(11; "Approval Status"; Enum "ApprovalStatus")
        {
            DataClassification = CustomerContent;
            Caption = 'Approval Status';
            Editable = false;

        }
        field(13; "Posted"; Boolean)
        {
            Caption = 'Posted';
            Enabled = true;
            DataClassification = CustomerContent;
            Editable = false;
        }



    }

    keys
    {
        key(PK; "Invoice Code")
        {
            Clustered = true;


        }
    }
    var

        StudentMgntSetup: Record "Students Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        StudentMgntSetup.Get();
        if "Invoice Code" = ' ' then
            StudentMgntSetup.TestField("Invoice Code");
        NoSeriesManagement.InitSeries(StudentMgntSetup."Invoice Code", xRec."No. Series", 0D, "Invoice Code", "No. Series");

    end;
}
