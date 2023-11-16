page 50122 "Submitted Students"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Student Application Table";
    SourceTableView = sorting("Application No.") order(descending) where("Application Status" = filter(Submitted));
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
                field(Email;Rec.Email)
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
              
                field(Course;Rec.Course)
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