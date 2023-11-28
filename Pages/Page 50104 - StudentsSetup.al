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
                field("Payment NO."; Rec."Payment NO.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the payment no. field.';
                }
                field("Fee Structure Code"; Rec."Fee Structure Code")
                {

                }

            }
            group(invoicing)
            {
                field("General Journal Batch"; Rec."General Journal Batch")
                {
                    ApplicationArea = All;
                }
                field("General Journal Template"; Rec."General Journal Template")
                {
                    ApplicationArea = All;
                }

                field("Invoicing GL Account"; Rec."Invoicing GL Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoicing GL Account field.';
                }

            }
            group("Posting Groups")
            {
                field("Gen.Bus Posting Group"; Rec."Gen.Bus Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gen.Bus Posting Group field.';
                }
                field("VAT.Bus Posting Group"; Rec."VAT.Bus Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT.Bus Posting Group field.';
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Posting Group field.';
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