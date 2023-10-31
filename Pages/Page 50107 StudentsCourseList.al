page 50107 "Course Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Course Table";
    CardPageId="Course Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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

                field(Department; Rec.Department)
                {
                    ApplicationArea = All;


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