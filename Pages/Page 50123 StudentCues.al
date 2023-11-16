page 50123 "Student cues Page"
{
    Caption = ' Student Activities';
    PageType = CardPart;
    SourceTable = "Student Cues";

    layout
    {
        area(Content)
        {
            cuegroup("group1")
            {
                CuegroupLayout = Wide;
                ShowCaption = true;

                field("Student Application list"; Rec."Student Application list")
                {
                    DrillDownPageId = "Student App List";
                }


            }
            cuegroup("Students")
            {
                field("Approved Students"; Rec."Approved Students")
                {
                    DrillDownPageId = "Approved Students List";
                }


            }
            cuegroup("Schools")
            {
                field("Number of Schools"; Rec."Number of Schools")
                {
                    DrillDownPageId = "School List";

                }
                field(Departments; Rec.Departments)
                {
                    Caption = ' Number of Departments';
                    DrillDownPageID = "Department List";
                }




            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;

    end;


}
