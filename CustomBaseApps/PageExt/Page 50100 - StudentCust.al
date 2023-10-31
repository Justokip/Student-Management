pageextension 50100 "Student Cust Ext" extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {

            field(Gender; Rec.Gender)
            {
                ApplicationArea = All;
            }
            field(Nationality; Rec.Nationality)
            {
                ApplicationArea = All;

            }
            field(Age; Rec.Age)
            {
                ApplicationArea = All;
            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}