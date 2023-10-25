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
            }
        }
        area(Embedding)
        {
            action(Hello)
            {

            }
        }
    }

}
profile Students
{
    Caption = 'Students Application';
    RoleCenter = StudentsRoleCenter;
}
