table 50111 "Semester Registration"
{
    DataClassification = ToBeClassified;
    DataPerCompany = true;
    Caption = 'Semester Registration';

    fields
    {
        field(1; "ID" ; Code[20])
        {
            DataClassification = ToBeClassified;
          
        }

        field(2; "Student" ; Code[20])
        {
            DataClassification = ToBeClassified;
            
        }

        field(3; "Semester" ; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Semester Registration".ID;
        }

        field(4; "Units" ; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation= "Students Units Setup"."Unit code"; 
        }
    }
}
