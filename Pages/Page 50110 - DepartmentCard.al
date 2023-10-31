page 50110 "Department Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Department;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {

                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;

                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;

                }
                // field("Program Level"; Rec."Program Level")
                // {
                //     ApplicationArea = All;

                // }
                // field(Course; Rec.Course)
                // {
                //     ApplicationArea = All;

                // }
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