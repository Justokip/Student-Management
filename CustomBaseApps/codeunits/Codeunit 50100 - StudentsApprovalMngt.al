codeunit 50100 "Student Approval Management"
{
    var
        WorkflowManagement: Codeunit "Workflow Management";
        NoWorkflowEnabledErr: Label 'No approval workflow for this record type is enabled.';
        WorkflowEventHandling: Codeunit "StdWorkflow Event Handling";

    procedure CheckStudentsApprovalWorkflowEnabled(var Students: Record "Student Application Table"): Boolean
    begin
        if not IsStudentsAppWorkflowEnabled(Students) then
            Error(NoWorkflowEnabledErr);
        exit(true);
    end;

    procedure IsStudentsAppWorkflowEnabled(var Students: Record "Student Application Table"): Boolean
    begin
        if Students."Application Status" <> Students."Application Status"::Open then
            exit(false);

        exit(WorkflowManagement.CanExecuteWorkflow(Students, WorkflowEventHandling.RunWorkflowOnSendStudentsAppForApprovalCode))
    end;

    [IntegrationEvent(false, false)]
    procedure OnSendStudentsAppForApproval(VAR Students: Record "Student Application Table")
    begin

    end;

    [IntegrationEvent(false, false)]
    procedure OnCancelStudentsAppApprovalRequest(VAR Students: Record "Student Application Table")
    begin

    end;


    // //student invoice
    // procedure CheckStudentInvoiceApprovalsWorkFlowEnable(var Applicant1: Record "Student Invoice"): Boolean
    // begin
    //     IF NOT IsStudentInvoiceApprovalsWorkFlowEnable(Applicant1) then
    //         Error(NoWorkFlowEnabledErr);
    //     exit(true);
    // end;

    // procedure IsStudentInvoiceApprovalsWorkFlowEnable(var Applicant1: Record "Student Invoice"): Boolean
    // begin
    //     EXIT(WorkFlowManagement.CanExecuteWorkflow(Applicant1, WorkflowEventHandling.RunWorkFlowOnSendStudentInvoiceForApprovalCode()));
    // end;

    // [IntegrationEvent(false, false)]
    // procedure OnSendStudentInvoiceForApproval(Var Applicant1: Record "Student Invoice")
    // begin

    // end;

    // [IntegrationEvent(false, false)]
    // procedure OnCancelStudentInvoiceForApproval(var Applicant1: Record "Student Invoice")
    // begin

    // end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', true, true)]
    local procedure OnPopulateApprovalEntryArgument(VAR RecRef: RecordRef; VAR ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepInstance: Record "Workflow Step Instance")
    var
        StudentApplnTable: Record "Student Application Table";
    begin
        CASE RecRef.NUMBER OF
            DATABASE::"Student Application Table":
                BEGIN
                    RecRef.SETTABLE(StudentApplnTable);
                    ApprovalEntryArgument."Document No." := StudentApplnTable."Application No.";

                END;

        end;
    end;

    trigger OnRun()
    begin

    end;

}