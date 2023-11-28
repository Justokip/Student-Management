table 50117 "STDN Payments"
{
    DataClassification = CustomerContent;
    Caption = 'Student Payment';


    fields
    {
        field(1; "Payment No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Payment No.';
            Editable = false;

        }
        field(11; "Adm."; code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Admission No.';

            trigger OnLookup()

            begin
                if Page.RunModal(Page::"Students Invoices", RegInvoice) = Action::LookupOK then begin
                    "Full Name" := RegInvoice."Student Name";
                    Semester := RegInvoice."Semester Name";
                    "Adm." := RegInvoice."Application No.";
                    "Fee Invoice No." := RegInvoice."Invoice Code";
                    "Posting Date" := Today;
                    "Document Date" := Today;
                    Rec.Modify();
                    exit
                end;
            end;
        }
        field(14; "Fee Invoice No."; Code[20])
        {
            Caption = 'Fee Invoice No.';
            DataClassification = CustomerContent;
            TableRelation = "Student Invoice";

        }

        field(2; "Document Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Document Date';
            NotBlank = true;
            Editable = false;

        }
        field(3; "Date Modified"; DateTime)
        {
            DataClassification = CustomerContent;
            Editable = false;
            Caption = 'Date Modified';


        }
        field(4; "Accountant ID"; code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Accountant ID';
            Editable = false;

        }
        field(5; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Posting Date';
            NotBlank = true;
        }
        field(6; "Total Amount"; Decimal)
        {
            Caption = 'Total Due';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("STDN Payment Lines".Amount where("Adm." = field("Adm.")));
        }
        field(7; Posted; Boolean)
        {
            Caption = 'Posted';
            Editable = false;
        }
        field(8; "Payment Mode"; Code[20])
        {
            TableRelation = "Payment Method";
            Caption = 'Payment Mode';
            NotBlank = true;
        }
        field(9; "Paying Bank Account"; Code[20])
        {
            TableRelation = "Bank Account";
            NotBlank = true;
            trigger OnValidate()
            begin
                if BankName.Get("Paying Bank Account") then begin
                    "Bank Name" := BankName.Name;
                end;
            end;
        }
        field(15; "Bank Name"; Text[100])
        {
            CalcFormula = Lookup("Bank Account".Name WHERE("No." = FIELD("Paying Bank Account")));
            Caption = 'Bank Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; Status; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
            OptionMembers = Open,Registered;
            OptionCaption = 'Open, Registered';
            Editable = false;


        }

        field(12; "Full Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Full Name.';
            Editable = false;
        }
        field(13; Semester; Code[20])
        {
            Caption = 'Semester';
            DataClassification = CustomerContent;
            //Editable = false;


        }

    }

    keys
    {
        key(Key1; "Payment No.")
        {
            Clustered = true;
        }
    }

    var
        UserSetup: Record "User Setup";
        RegInvoice: Record "Student Invoice";
        NoSeriesMng: Codeunit NoSeriesManagement;
        StudentSetup: Record "Students Setup";
        PaymentLines: Record "STDN Payment Lines";
        BankName: Record "Bank Account";
        PaymentMethod: Record "Payment Method";

    trigger OnInsert()
    begin

        StudentSetup.Get();
        if (Rec."Payment No." = '') then begin
            NoSeriesMng.TestManual(StudentSetup."Payment No.");
            NoSeriesMng.InitSeries(StudentSetup."Payment No.", xRec."Payment No.", 0D, Rec."Payment No.", StudentSetup."Payment No.");
            "Date Modified" := CreateDateTime(Today, Time);
            "Posting Date" := Today;
            "Document Date" := Today;


        end;
        UserSetup.Get(UserId);
        "Accountant ID" := UserSetup."User ID";
    end;

    trigger OnModify()
    var

    begin
        "Date Modified" := CreateDateTime(Today, Time);
        Rec.Modify();
    end;


}