page 50105 StudentsRoleCenter
{
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {

        }
    }

    actions
    {
        area(Creation)
        {
            action(ActionBarAction)
            {

            }
        }
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
                action("Approved Applicants")
                {
                    RunObject = page "Students Approved";
                }
            }
        }
        area(Embedding)
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

        }
    }

}
profile Students
{
    Caption = 'Students Application';
    RoleCenter = StudentsRoleCenter;
}
