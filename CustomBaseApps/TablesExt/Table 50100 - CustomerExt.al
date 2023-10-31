tableextension 50100 StdCustExtention extends Customer
{

    fields
    {
        field(50012; Gender; Enum Gender)
        {
            DataClassification = ToBeClassified;
        }
        field(5015; Nationality; Code[20])
        {

        }
        field(5016; Age; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(5020; "Application Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5027; "Course Type"; Enum "Course Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Program Level';

        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}