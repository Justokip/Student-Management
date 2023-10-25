page 50100 "Student App List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Student Application Table";
    CardPageId = "Student App Card";
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = All;

                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = All;

                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;

                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = All;

                }
                field("Course Type"; Rec."Course Type")
                {
                    ApplicationArea = All;

                }
                field("Programme Name"; Rec."Programme Name")
                {
                    ApplicationArea = All;

                }
                field("Prefered Intake"; Rec."Prefered Intake")
                {
                    ApplicationArea = All;

                }
                field("Application Status"; Rec."Application Status")
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