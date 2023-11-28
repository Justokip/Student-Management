page 50126 "Student Invoice"
{
    Caption = 'Student Invoice';
    PageType = Card;
    SourceTable = "Student Invoice";
    PromotedActionCategories = 'New,Create,process,Navigate,Post,Invoivce,Send for Approvals, Cancel for Approvals';
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Invoice Code"; Rec."Invoice Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice Code field.';
                }
                field("Session Code"; Rec."Session Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the session Code field.';

                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student No. field.';
                    // trigger OnLookup(var Text: Text): Boolean
                    // var
                    //     Invoice: Record Customer;
                    // begin
                    //     if Page.RunModal(Page::"Approved Students List", Invoice) = Action::LookupOK then
                    //         Rec."Application No." := Invoice."No.";
                    //     Rec."Student Name" := Invoice.Name;
                    //     Rec."Course Name" := Invoice.Course;
                    // end;

                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student Name field.';
                }
                field("Course Name"; Rec."Course Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Course field.';
                }
                field("Academic Year"; Rec."Academic Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Academic Year field.';
                }
                field("Semester Name"; Rec."Semester Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Semester Name field.';
                }
                field("Invoice Date"; Rec."Invoice Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice Date field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approval status.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies posted status.';
                }

            }

            part(lines; "Invoice Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Entry No." = field("Invoice Code");
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group(Approvals)
            {
                Caption = 'Actions';
                action(Post)
                {

                    ApplicationArea = All;
                    Caption = 'Posting';
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Opens Student Invoice';


                    trigger OnAction()
                    begin
                        //Rec.Posted := true
                        PaymentManagement.PostedStudInv(Rec);
                    end;
                }

                action(Invoice)
                {
                    ApplicationArea = All;
                    Caption = 'Invoice';
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    Image = Customer;
                    ToolTip = 'Invoice student';


                    trigger OnAction()
                    begin
                        PaymentManagement.PostedStudInv(Rec);

                    end;
                }

            }
        }
    }

    var
        PaymentManagement: Codeunit "Payment Management";

}
