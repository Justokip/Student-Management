page 50128 "Invoice Subform"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Invoice Lines";
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Fee Structure Code"; Rec."Fee Structure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fee Structure Code field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        Invoice: Record "Fee Structure";
                    begin

                        if Page.RunModal(Page::"Fee Structure List", Invoice) = Action::LookupOK then
                            Rec."Fee Structure Code" := Invoice."Fee Structure Code";
                        Rec."Description" := Invoice.Description;
                        Rec.Amount := Invoice.Amount;

                    end;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';

                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Bal.Account Type"; Rec."Bal.Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bal.Account Type field.';
                }
                field("Balancing Acc. No."; Rec."Balancing Acc. No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Balancing Acc. No. field.';
                }

            }
        }
    }
}