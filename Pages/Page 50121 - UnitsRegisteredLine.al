page 50121 "Registerd units ListPart"
{
    PageType = ListPart;
    SourceTable = "Registered units";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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
                field(Registered; Rec.Registered)
                {
                    ApplicationArea = All;

                }

            }
        }
    }

}