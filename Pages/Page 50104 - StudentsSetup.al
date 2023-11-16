page 50104 "Students Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Students Setup";
    CaptionML = ENU = 'Student Setup', DEU = 'Schüler-Setup';
    InsertAllowed = false;
    DeleteAllowed = false;
    Editable = true;


    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Minimum Age"; Rec."Minimum Age")
                {

                }

                field("Maximum Age"; Rec."Maximum Age")
                {
                }
            }
            group("No. Series")
            {
                field("No.Series"; Rec."No.Series")
                {
                    ApplicationArea = All;

                }
                field("No.Seriess"; Rec."No.Seriess")
                {
                    ApplicationArea = All;


                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;


                }
                field("Reg No."; Rec."Reg No.")
                {
                    ApplicationArea = All;


                }
                field("Invoice Code"; Rec."Invoice Code")
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