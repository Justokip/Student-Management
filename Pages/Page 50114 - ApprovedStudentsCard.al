page 50114 "Approved Students Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;
    InsertAllowed = false;
    DeleteAllowed = false;
    //
    layout
    {
        area(Content)
        {
            group("Personal info")
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'Adm No.';

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;


                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;

                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = All;

                }
                field(Nationality; Rec.Nationality)
                {
                    ApplicationArea = All;

                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;

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
            group("Permanent Address")
            {

                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;

                }

                field(City; Rec.City)
                {
                    ApplicationArea = All;

                }

                field(Address; Rec.Address)
                {
                    ApplicationArea = All;

                }

            }
            // group("Parent/Guardian Information")
            // {



            // }
            part(lines; "Students line part")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("Adm no.");

            }

            group("Educational Plans")
            {
                field("Student Categoty"; Rec."Student Category")
                {
                    ApplicationArea = all;

                }
                field(Course; Rec.Course)
                {
                    ApplicationArea = all;

                }
                field(School; Rec.School)
                {
                    ApplicationArea = all;

                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = all;

                }
                field("Mode of Study"; Rec."Mode of Study")
                {
                    ApplicationArea = all;

                }
                field("Prefered Intake"; Rec."Prefered Intake")
                {
                    ApplicationArea = all;

                }





            }
            group(Invoicing)
            {
                Caption = 'Posting Details';
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the customer''s trade type to link transactions made for this customer with the appropriate general ledger account according to the general posting setup.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the customer''s VAT specification to link transactions made for this customer to.';
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the customer''s market type to link business transactions to.';
                }
            }
            group(Payments)
            {
                Caption = 'Payments';
                AboutTitle = 'Manage the customer’s payment';
                AboutText = 'Specify the customer’s default payment terms and settings for how payments from the customer is processed.';


                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies a code that indicates the payment terms that you require of the customer.';
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies how the customer usually submits payment, such as bank transfer or check.';
                }

                field("Preferred Bank Account Code"; Rec."Preferred Bank Account Code")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Additional;
                    ToolTip = 'Specifies the customer''s bank account that will be used by default when you process refunds to the customer and direct debit collections.';
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