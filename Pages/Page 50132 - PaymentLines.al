page 50132 "STDN Payment Lines"
{
    PageType = ListPart;
    UsageCategory = Lists;
    SourceTable = "STDN Payment Lines";
    Caption = 'Payment Details';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Fee Type"; Rec."Fee Type")
                {
                    ApplicationArea = All;
                    Caption = 'Type';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }


                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    Caption = 'Amount';

                }
                field("Invoice Amount"; Rec."Invoice Amount")
                {
                    ApplicationArea = all;
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    ApplicationArea = all;
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                    ApplicationArea = all;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                    Caption = 'Date';
                }
                field("Payment Posted"; Rec."Payment Posted")
                {
                    ApplicationArea = all;
                }
            }

        }
    }

}
