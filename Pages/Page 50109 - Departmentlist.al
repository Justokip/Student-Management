page 50109 "Department List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Department;


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;

                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;

                }
                field("School Name"; Rec."School Name")
                {
                    ApplicationArea = All;

                }
                //   field("Program Level";Rec."Program Level")
                // {
                //     ApplicationArea = All;

                // }
                //   field(Course;Rec.Course)
                // {
                //     ApplicationArea = All;

                // }
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