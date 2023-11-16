page 50106 "Approved Students List"

{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    PromotedActionCategories = 'New,Process,Report,New Document,Approve,Request Approval,Prices & Discounts,Navigate,Customer';
    RefreshOnActivate = true;
    SourceTable = Customer;
    CardPageId = "Approved Students Card";


    SourceTableView = where("Customer Type" = filter(Students));
    // AboutTitle = 'About customer details';
    // AboutText = 'With the Customer Card you manage information about a customer and specify the terms of business, such as payment terms, prices and discounts. From here you can also drill down on past and ongoing sales activity.';
    //SourceTableView = sorting("Application No.") order(descending) where("Application Status" = filter(Submitted));
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'Adm No.';
                    Importance = Standard;
                    ToolTip = 'Specifies the number of the customer.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the customer''s name. This name will appear on all sales documents for the customer.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update(true);
                    end;
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Age field.';
                }
                field(Course; Rec.Course)
                {
                    ApplicationArea = All;
                    Caption = 'Course Name';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    Caption = 'Course Name';
                }


                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the payment amount that the customer owes for completed sales. This value is also known as the customer''s balance.';

                }
                field("Balance Due (LCY)"; Rec."Balance Due (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies payments from the customer that are overdue per today''s date.';
                }

                field("Payments (LCY)"; Rec."Payments (LCY)")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the sum of payments received from the customer.';
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