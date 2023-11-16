page 50116 "Academic Years"
{
    Caption = 'Academic Years';
    PageType = List;
    SourceTable = "Academic Year";
    UsageCategory = Lists;
    ApplicationArea = All;


    layout
    {
        area(content)
        {
            repeater(General)
            {
              
                field("Academic Year"; Rec."Academic Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Academic Year field.';
                }
                  field("Start Date";Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Academic Code field.';
                }
                  field("End Date";Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Academic Code field.';
                }
            }
        }
    }
}
