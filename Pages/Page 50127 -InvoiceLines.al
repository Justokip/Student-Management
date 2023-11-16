page 50127 "Invoice Lines"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Invoice Lines";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {

                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.';
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
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the transaction type field';
                }
                field("Payment Code"; Rec."Payment Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the payment code field';
                }

            }
        }
    }
}