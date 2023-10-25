page 50102 "Student App Card"
{
    PageType = Card;
    SourceTable = "Student Application Table";
    ApplicationArea = ALl;
    UsageCategory = Administration;
    Caption = 'Student Applictaion Card ';


    layout
    {
        area(Content)
        {
            group("Personal info")
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = All;

                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;

                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = All;

                }
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = All;

                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = All;


                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;

                }
                field("Date Of Birth"; Rec."Date Of Birth")
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
                field("Phone Number"; Rec."Phone Number")
                {
                    ApplicationArea = All;

                }


            }
            group("Permanent Address")
            {

                field("PO BOX"; Rec."PO BOX")
                {
                    ApplicationArea = All;

                }

                field("City/Town"; Rec."City/Town")
                {
                    ApplicationArea = All;

                }

                field(Address; Rec.Address)
                {
                    ApplicationArea = All;

                }

            }
            group("Parent/Guardian Information")
            {
                field(Name; Rec.Name)
                {

                }
                field(PhoneNumber; Rec.PhoneNumber)
                {

                }
                field(Ocupation; Rec.Ocupation)
                {

                }
                field("Mortality Status"; Rec."Mortality Status")
                {

                }


            }
            part(lines; "Students line part")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("Application No.");

            }

            group("Educational Plans")
            {
                field("Course Type"; Rec."Course Type")
                {
                    ApplicationArea = all;

                }
                field("Programme Name"; Rec."Programme Name")
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