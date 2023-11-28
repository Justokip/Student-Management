page 50113 "Units line part"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Students Units Setup";
    Caption = 'Units';

    layout
    {

        area(Content)
        {

            repeater(Group)
            {

                field("Unit Code"; Rec."Unit Code")
                {
                    ApplicationArea = All;
                }
                field("Unit Name"; Rec."Unit Name")
                {
                    ApplicationArea = All;

                }
                field("Course Name"; Rec."Course Name")
                {
                    ApplicationArea = All;

                }
                field(Semester; Rec.Semester)
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}