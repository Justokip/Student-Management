table 50108 "Academic Year"
{
    DataClassification = ToBeClassified;
    DataPerCompany = true;
    Caption = 'Academic Year';

    fields
    {
        field(1; "ID" ; Code[20])
        {
            DataClassification = ToBeClassified;
           
        }
        
        field(2; "Course" ; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation= "Course Table"."Course ID";
        }
    }
}
