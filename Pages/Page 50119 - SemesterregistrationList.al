page 50119 "Student Semester Registration"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Student Semester Registration";
    CardPageId = "Sem Registration Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Adm No."; Rec."Adm No.")
                {
                    ApplicationArea = all;
                    caption = 'Admission Number';
                }

                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = all;
                    Caption = 'Full Name.';
                }
                field(Semester; Rec.Semester)
                {
                    ApplicationArea = all;
                    Caption = 'Semester';

                }
                field(Course; Rec.Course)
                {
                    ApplicationArea = all;
                    Caption = 'Course';
                }
                field("Course Code"; Rec."Course Code")
                {
                    ApplicationArea = all;
                    Caption = 'Course Code';
                }
                field(School; Rec.School)
                {
                    ApplicationArea = all;
                    Caption = 'School';

                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = all;
                    Caption = 'Department';

                }
                field(Status; Rec.Status)
                {
                    Caption = 'Status';
                    ApplicationArea = all;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}