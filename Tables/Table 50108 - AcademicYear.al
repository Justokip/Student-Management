table 50108 "Academic Year"
{
    DataClassification = ToBeClassified;
    DataPerCompany = true;
    Caption = 'Academic Year';

    fields
    {
      
        field(2; "Academic Year"; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Academic Year';

        }
        field(3;"Start Date";Date)
        {
            DataClassification = CustomerContent;

        }
         field(4;"End Date";Date)
        {
            DataClassification = CustomerContent;

        }

    }
    keys
    {
        key(PK; "Academic Year")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Academic Year")
        {

        }
        fieldgroup(Brick; "Academic Year")
        {

        }
    }
}
