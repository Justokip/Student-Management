
table 50113 "Student Cues"
{
    DataClassification = CustomerContent;
    DataPerCompany = true;

    fields
    {
        field(1; "Student Application list"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Student Application Table" where("Application No." = filter(<> '')));

        }

        field(2; "Approved Students"; Integer)
        {

            FieldClass = FlowField;
            CalcFormula = count("Student Application Table" where("Adm no." = filter(<> '')));

        }

        field(3; "Number of Schools"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Students School" where("School Name" = filter(<> '')));

        }
        field(5; "Departments"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Department where("Department Name" = filter(<> '')));

        }
        field(6; "program Levels"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Program Level" where("Program level" = filter(<> '')));
        }
        field(7; no; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "no")
        {
            Clustered = true;
        }
    }
}
