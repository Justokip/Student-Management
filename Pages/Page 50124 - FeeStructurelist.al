page 50124 "Fee Structure List"
{
    Caption = 'Fee Structure';
    PageType = List;
    SourceTable = "Fee Structure";
    ApplicationArea = All;
    UsageCategory = Lists;
    //CardPageId = "Fee Structure";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Fee Structure Code"; Rec."Fee Structure Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fee Structure Code field.';
                }
                field("Fee Type"; Rec."Fee Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fee Structure Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fee Structure Code field.';
                }
                field("Academic Year"; Rec."Academic Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Academic Year field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        FeeStructure: Record "Academic Year";
                    begin

                        if Page.RunModal(Page::"Academic Years", FeeStructure) = Action::LookupOK then
                            Rec."Academic Year" := FeeStructure."Academic Year";
                    end;
                }
                field("Semester"; Rec."Semester Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Semester Name field.';
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        FeeStructure: Record "Semester Registration";
                    begin

                        if Page.RunModal(Page::Semesters, FeeStructure) = Action::LookupOK then
                            Rec."Semester Name" := FeeStructure."Semester Name";
                    end;
                }
                field("Student Category"; Rec."Student Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Student Category field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the account Type';

                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Number';
                }

            }
        }
    }
}
