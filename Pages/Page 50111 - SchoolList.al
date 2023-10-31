page 50111 "School List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Students School";
    CardPageId = "School card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("School code"; Rec."School code")
                {
                    ApplicationArea = All;

                }
                field("School Name"; Rec."School Name")
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