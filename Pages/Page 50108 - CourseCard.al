page 50108 "Course Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Course Table";

    layout
    {
        area(Content)
        {
            group(Registration)
            {
                field("Course ID"; Rec."Course ID")
                {
                    ApplicationArea = All;

                }

                field("Course Name"; Rec."Course Name")
                {
                    ApplicationArea = All;

                }
                field(School; Rec.School)
                {
                    ApplicationArea = All;
                    TableRelation = "Students School";
                    // trigger OnLookup(var Text: Text): Boolean
                    // var
                    //     Course: Record "Students School";
                    // begin
                    //     if Page.RunModal(Page::"School List", Course) = Action::LookupOK then
                    //         Rec."School" := Course."School Name";


                    // end;

                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    // trigger OnLookup(var Text: Text): Boolean
                    // var
                    //     Course: Record Department;
                    // begin
                    //     if Page.RunModal(Page::"Department List", Course) = Action::LookupOK then
                    //         Rec."Department" := Course."Department Name";


                    // end;

                }
                field("Program Level"; Rec."Program Level")
                {
                    ApplicationArea = All;


                }
                field("Academic Year"; Rec."Academic Year")
                {
                    ApplicationArea = All;

                }

            }
            part(UNITS; "Units line part")
            {
                Caption = 'UNITS';
                SubPageLink ="Course Name" = field("Course Name"), "Entry No." = field("Course ID");
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

}