page 50120 "Sem Registration Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Student Semester Registration";
    Caption = 'Student Course and Units Registration';
    RefreshOnActivate = true;
    PromotedActionCategories = 'Post,New,Create,Approvals';

    layout
    {
        area(Content)
        {
            group(Detail)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;

                }
                field(Semester; Rec.Semester)
                {
                    ApplicationArea = all;
                    Caption = 'Semester';

                }
                field("Academic Year"; Rec."Academic Year")
                {
                    ApplicationArea = all;
                    Caption = 'Academic Year';
                }

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
                field(Course; Rec.Course)
                {
                    ApplicationArea = all;
                    Caption = 'Course';
                    Editable = false;
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
            part(Units; "Registerd units ListPart")
            {
                Caption = 'Register Units';
                ApplicationArea = All;
                SubPageLink = "Entry No." = field("Adm No."), Semester = field(Semester),
                "Course Name" = field(Course);
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Approval)
            {
                ApplicationArea = All;
                Caption = 'Register Units';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    Units: Record "Students Units Setup";
                begin
                    if Confirm('Send for Registration?') then begin
                        RegStudent.UnitRegistration(Rec);

                        Message(SuccessMsg);
                    end;


                end;
            }
        }
    }

    var
        SuccessMsg: Label 'Your Registration Was Successful';
        OpenErrorMsg: Label 'You have Already Registered';
        RegStudent: Codeunit "Student Transfer";

}