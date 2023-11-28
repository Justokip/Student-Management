page 50130 "STDN Payment Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "STDN Payments";
    // RefreshOnActivate = true;
    PromotedActionCategories = 'Post,New,Create,Payments';
    // SourceTableView =sorting("Payment No.")  order(descending) where(Status = filter(Open));
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Payment No."; Rec."Payment No.")
                {
                    Caption = 'Payment No.';
                    ApplicationArea = all;
                }
                field("Adm."; Rec."Adm.")
                {
                    ApplicationArea = all;
                    Caption = 'Student Adm No.';
 
                }
                field("Fee Invoice No."; Rec."Fee Invoice No.")
                {
                    Caption = 'Fee Invoice No.';
                    ApplicationArea = all;
                }
 
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = all;
                    Caption = 'Full Name.';
                }
                field(Semester; Rec.Semester)
                {
                    ApplicationArea = all;
                    Caption = 'Semester';
                }
 
 
 
                field("Payment Mode"; Rec."Payment Mode")
                {
                    ApplicationArea = all;
                    Caption = 'Payment Mode';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = all;
                    Caption = 'Paying Bank Account';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = all;
                    Caption = 'Bank Name';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = all;
                    Caption = 'Total Amount';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = all;
                    Caption = 'Posting Date';
                }
 
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = all;
                    Caption = 'Document Date';
                }
                field(Status; Rec.Status)
                {
                    Caption = 'Status';
                    ApplicationArea = all;
 
                }
                field("Accountant ID"; Rec."Accountant ID")
                {
                    Caption = 'Accountant ID';
                    ApplicationArea = all;
                }
            }
            part(Payments; "STDN Payment Lines")
            {
                Caption = 'School Fee';
                ApplicationArea = basic, suite;
                UpdatePropagation = Both;
                SubPageLink = "No." = field("Payment No."),
                            Semester = field(Semester), "Adm." = field("Adm.");
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            group(Payments1)
            {
                action(Payment)
                {
                    Caption = 'Payment';
                    Image = Payment;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = all;
                    trigger OnAction()
                    begin
                        PaymentMngt.PaymentPosting(Rec);
                        CurrPage.Close();
                    end;
                }
            }
        }
    }
    var
        PaymentMngt: Codeunit "Payment Management";
        PayLines: Record "STDN Payment Lines";
}