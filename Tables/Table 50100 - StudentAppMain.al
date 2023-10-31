table 50100 "Student Application Table"
{
    DataClassification = ToBeClassified;
    DataPerCompany = true;




    fields
    {
        field(1; "Application No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            // TableRelation = Customer;

        }
        field(5004; "First Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Trigger OnValidate()
            begin
                "Full Name" := "First Name" + '' + "Middle Name" + '' + Surname;
            end;
        }
        field(5006; "Middle Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Trigger OnValidate()
            begin
                "Full Name" := "First Name" + ' ' + "Middle Name" + ' ' + "Surname";


            end;
        }
        field(5008; Surname; Text[30])
        {
            DataClassification = ToBeClassified;
            Trigger OnValidate()
            begin
                "Full Name" := "First Name" + ' ' + "Middle Name" + ' ' + "Surname";

            end;
        }
        field(2; "Full Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;


        }
        field(50012; Gender; Enum Gender)
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "Date Of Birth"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                StudentSetupRec: Record "Students Setup";
                MinAge: Integer;
                MaxAge: Integer;
                myInt: Integer;

            begin
                if "Date Of Birth" <> 0D then begin
                    // Retrieve the minimum and maximum age from the "Student Management Setup" table
                    if StudentSetupRec.Get() then begin
                        MinAge := StudentSetupRec."Minimum Age";
                        MaxAge := StudentSetupRec."Maximum Age";
                        //calculate Age
                        calcage := Date2DMY(WorkDate(), 3) - Date2DMY("Date Of Birth", 3);
                        Age := calcage;
                        rec.Modify();

                        // Check if the age is within the specified range
                        if (calcage < MinAge) or (calcage > MaxAge) then begin
                            Error('Applicant age does not meet the requirements.');
                        end;

                    end;


                end;
            end;
        }
        field(5015; Nationality; Code[20])
        {

        }
        field(5016; Age; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }

        field(5; Address; Text[100])
        {

        }
        field(9; "Phone Number"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(102; Email; Text[80])
        {

        }
        field(5020; "Application Date"; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(5022; "Application Status"; Enum "Application Status")
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5024; "PO BOX"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "City/Town"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";
        }

        //guardian
        field(5028; Name; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Parent Name';
        }
        field(5029; "PhoneNumber"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Phone Number';
        }
        field(5030; Ocupation; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Ocupation ';
        }
        field(5031; "Mortality Status"; Enum "Parents status")
        {

        }//
         //Educations plans
        field(5027; "Course Type"; Enum "Course Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Program Level';

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

    }

    keys
    {
        key(Pk; "Application No.")
        {
            Clustered = true;
        }
    }
    var
        calcage: Integer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        StAppNoSeries: Record "Students Setup";

    trigger OnInsert()
    begin
        if "Application No." = '' then begin
            StAppNoSeries.Get();
            NoSeriesMgt.InitSeries(StAppNoSeries."No.Series", StAppNoSeries."No.Series", WorkDate(), "Application No.", StAppNoSeries."No.Series");
        end;

    end;

}