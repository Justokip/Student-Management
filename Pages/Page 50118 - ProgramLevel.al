page 50118 "Program Level Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Program Level";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Level no."; Rec."Level no.")
                {
                    ApplicationArea = All;

                }
                field("Program level"; Rec."Program level")
                {
                    ApplicationArea = All;

                }
                field(Duration;Rec.Duration)
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }


}