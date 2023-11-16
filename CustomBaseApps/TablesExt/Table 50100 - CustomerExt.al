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

        field(3009; "Customer Type"; option)
        {
            OptionMembers = Customers,Students;
            OptionCaption = 'Customers, Students';
            DataClassification = CustomerContent;
        }
        field(3010; "Student Category"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "Government Sponsered Student","Self Sponsered Student";
            OptionCaption = 'Government Sponsered Student,Self Sponsered Student';

        }
        field(5018; "Program Level"; code[20])
        {
            DataClassification = ToBeClassified;
        }


        field(5032; "Programme Name"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5033; "Mode of Study"; Option)
        {

            OptionMembers = "Institution-Based","E-learning","Part-Time";
            Caption = 'Institution-Based,E-learning,Part-Time';

        }
        field(5034; "Prefered Intake"; Enum Intakes)
        {
            DataClassification = ToBeClassified;
        }
        field(5035; Course; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Course Name';
        }
        field(5036; School; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5037; Department; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5001; "Adm no."; Code[20])
        {
            DataClassification = ToBeClassified;
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