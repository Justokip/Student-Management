page 50112 "School card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Students School";

    layout
    {
        area(Content)
        {
            group(GroupName)
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