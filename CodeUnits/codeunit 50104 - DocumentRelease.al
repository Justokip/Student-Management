codeunit 50104 "Student Transfer"
{


    procedure StudentApproved(var StudentsRec: Record "Student Application Table")
    var
        CustomerRec: Record Customer;
        StudentSetupp: Record "Students Setup";
        NoSeriesMng: Codeunit NoSeriesManagement;
    begin
        StudentSetupp.Get();
        if StudentsRec."Application Status" = StudentsRec."Application Status"::Submitted then begin
            if (StudentsRec."Adm no." = '') then begin
                StudentsRec."Adm no." := NoSeriesMng.GetNextNo(StudentSetupp."No.Seriess", 0D, true);
                StudentsRec."Customer Type" := StudentsRec."Customer Type"::Students;
                StudentsRec.Modify();
            end;
            CustomerRec.INIT;
            CustomerRec.TransferFields(StudentsRec, true);
            CustomerRec.Insert();

        end;
    end;

    procedure UnitRegistration(Var SemRegistration: Record "Student Semester Registration")
    var
        Units: Record "Registered units";
        SuccessMsg: Label 'Your Registration Was Successful';
        OpenErrorMsg: Label 'You have Already Registered';

    begin
        if not (SemRegistration.Status = SemRegistration.Status::Open) then
            Error(OpenErrorMsg);
        if Units.Semester <> SemRegistration.Semester then
            exit;
        Units.Reset();
        //Units.SetRange("Course Code", SemRegistration."Course Code");
        Units.SetRange("Course Name", SemRegistration.Course);
        Units.SetRange(Semester, SemRegistration.Semester);
        // Units.SetRange("Unit Entry", SemRegistration."Adm.");
        Units.SetRange("Entry No.", SemRegistration."Adm No.");


        if Units.FindSet() then
            repeat
                Units.Registered := true;
                Units.Modify();
            until Units.Next() = 0;
        SemRegistration.Status := SemRegistration.Status::Registerd;
        SemRegistration.Modify();

    end;
}
