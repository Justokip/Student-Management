page 50108 "Course Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Course Table";

    layout
    {
        area(Content)
        {
            group(Registration)
            {
                field("Course ID"; Rec."Course ID")
                {
                    ApplicationArea = All;

                }

                field("Course Name"; Rec."Course Name")
                {
                    ApplicationArea = All;

                }
                field(School; Rec.School)
                {
                    ApplicationArea = All;

                }
                field(Department;Rec.Department)
                {
                    ApplicationArea = All;

                }
                field("Academic Year";Rec."Academic Year")
                {
                    ApplicationArea = All;

                }

                field(Semester;Rec.Semester)
                {
                    ApplicationArea = All;


                }
             
            }
            part(UNITS;"Units line part")
            {
                Caption='UNITS';
                SubPageLink="Unit code"= field("Course ID");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}