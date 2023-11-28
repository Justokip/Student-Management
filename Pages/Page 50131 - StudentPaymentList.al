page 50131 "STDN Payment List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "STDN Payments";
    CardPageId = "STDN Payment Card";
    // RefreshOnActivate = true;
    PromotedActionCategories = 'Post,New,Create,Payments';
    SourceTableView = sorting("Payment No.") order(descending) where(Status = filter(Open));
    layout
    {
        area(Content)
        {
            repeater(General)
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
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = all;
                    Caption = 'Full Name.';
                }
                field("Fee Invoice No."; Rec."Fee Invoice No.")
                {
                    Caption = 'Fee Invoice No.';
                    ApplicationArea = all;
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
                field("Date Modified"; Rec."Date Modified")
                {
                    ApplicationArea = all;
                    Caption = 'Date Modified';
 
                }
                field("Payment Mode"; Rec."Payment Mode")
                {
                    ApplicationArea = all;
                    Caption = 'Payment Mode';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = all;
                    Caption = 'Fee Balance';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = all;
                    Caption = 'Posted';
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
        }
    }
 
}