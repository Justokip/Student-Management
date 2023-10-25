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

        }
        field(4; "First Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Trigger OnValidate()
            begin
                "Full Name" := "First Name" + '' + "Middle Name" + '' + Surname;
            end;
        }
        field(6; "Middle Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Trigger OnValidate()
            begin
                "Full Name" := "First Name" + ' ' + "Middle Name" + ' ' + "Surname";


            end;
        }
        field(8; Surname; Text[30])
        {
            DataClassification = ToBeClassified;
            Trigger OnValidate()
            begin
                "Full Name" := "First Name" + ' ' + "Middle Name" + ' ' + "Surname";

            end;
        }
        field(10; "Full Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;


        }
        field(12; Gender; Enum Gender)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Date Of Birth"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()

            begin
                calcage := Date2DMY(WorkDate(), 3) - Date2DMY("Date Of Birth", 3);
                Age := calcage;
                rec.Modify();

            end;
        }
        field(15; Nationality; Code[20])
        {

        }
        field(16; Age; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;

        }

        field(17; Address; Text[70])
        {

        }
        field(18; "Phone Number"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(19; Email; Text[75])
        {

        }
        field(20; "Application Date"; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(22; "Application Status"; Enum "Application Status")
        {
            DataClassification = ToBeClassified;
        }
        field(24; "PO BOX"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "City/Town"; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        //guardian
        field(28; Name; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Parent Name';
        }
        field(29; "PhoneNumber"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Phone Number';
        }
        field(30; Ocupation; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Ocupation ';
        }
        field(31; "Mortality Status"; Enum "Parents status")
        {

        }//
         //Educations plans
        field(27; "Course Type"; Enum "Course Type")
        {
            DataClassification = ToBeClassified;

        }
        field(32; "Programme Name"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Mode of Study"; Option)
        {
            OptionMembers = "Institution-Based E-learning Part-Time";
        
        }
        field(34; "Prefered Intake"; Enum Intakes)
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