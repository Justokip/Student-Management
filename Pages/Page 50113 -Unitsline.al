page 50113 "Units line part"
{
    PageType = ListPart;
    SourceTable = "Students Units Setup";
    Caption = 'Units';

    layout
    {

        area(Content)
        {

            repeater(Group)
            {

                field("Unit ID";Rec."Unit Code")
                {
                    ApplicationArea = All;
                }
                field("Unit Name";Rec."Unit Name")
                {
                    ApplicationArea = All;
                }
                field(Course;Rec.Course)
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

                trigger OnAction();
                begin

                end;
            }
        }
    }
}