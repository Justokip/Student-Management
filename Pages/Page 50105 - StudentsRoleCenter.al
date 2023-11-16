page 50105 StudentsRoleCenter
{
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(headline; "Headline RC Administrator")
            {
                ApplicationArea = Basic, suite;
            }
            part(stude; "Student cues Page")
            {
                ApplicationArea = all;
                Caption = 'Management';
            }
        }
    }

    actions
    {

        area(Processing)
        {
            action("Students Setup")
            {
                RunObject = page "Students Setup";
            }
        }
        area(Sections)
        {
            group("Student Application")
            {
                action("Students Application List")
                {
                    RunObject = Page "Student App List";
                }
                action("Approved/Submitted Student List")
                {
                    RunObject = Page "Submitted Students";
                }

            }
            group(Registration)
            {
                action("Students List")
                {
                    RunObject = page "Approved Students List";
                }

                action("Semester Registration")
                {
                    RunObject = Page "Student Semester Registration";
                }


            }
            group("Student Setups")
            {
                action("Student Setup")
                {
                    RunObject = Page "Students Setup";
                }
                action("Fee Structure")
                {
                    RunObject = Page "Fee Structure List";
                }


            }
            group(Administration)
            {

                action(Course)
                {
                    RunObject = Page "Course Page";
                }
                action(Schools)
                {
                    RunObject = Page "School List";
                }
                action(Department)
                {
                    RunObject = Page "Department List";
                }
                action("Program Level")
                {
                    RunObject = Page "Program Level Page";
                }
                action("Academic year")
                {
                    RunObject = Page "Academic Years";
                }
                action(Semeter)
                {
                    RunObject = Page Semesters;
                }

            }
            group(Finance)
            {
                action("Student Invoice")
                {
                    RunObject = page "Students Invoices";
                }

            }
            group(Reports)
            {
                action("Fee Structure Report")
                {
                    RunObject = report "Fee Structure Report";
                }

            }
        }
        area(Embedding)
        {

        }
    }

}
profile Students
{
    Caption = 'Students Application';
    RoleCenter = StudentsRoleCenter;
}
