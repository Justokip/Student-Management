codeunit 50102 "StdWorkflow Event Handling"
{
    var
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        StudentsAppSendForApprovalEventDescTxt: Label 'Approval  of a Student Application is Requested';
        StudentsAppCancelForApprovalEventDescTxt: Label 'Approval  of a Student Application is Canceled';
        WorkflowManagement: Codeunit "Workflow Management";

        // //student invoice
        // StudentInvoiceSendForApprovalEventDescTxt: Label 'Student Invoice is  send for Approval';
        // StudentInvoiceCancelForApprovalEventDescTxt: Label 'Student invoice is cancelled';
        // StudentInvoiceReleasedText: Label 'Student invoice Is Approved';
        // StudentInvoiceSendForRejectedEventDescTxt: Label 'Student invoice is  rejected';



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure OnAddWorkflowsEventToLibrary()
    begin

        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendStudentsAppForApprovalCode, DATABASE::"Student Application Table",
        StudentsAppSendForApprovalEventDescTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelStudentsAppForApprovalCode, DATABASE::"Student Application Table",
        StudentsAppCancelForApprovalEventDescTxt, 0, FALSE);
        
        // // Student Invoice
        // WorkflowEventHandling.AddEventToLibrary(RunWorkFlowOnSendStudentInvoiceForApprovalCode, Database::"Student Invoice", StudentInvoiceSendForApprovalEventDescTxt, 0, false);
        // WorkflowEventHandling.AddEventToLibrary(RunWorkFlowOnCancelStudentInvoiceApprovalCode, Database::"Student Invoice", StudentInvoiceCancelForApprovalEventDescTxt, 0, false);
        // WorkflowEventHandling.AddEventToLibrary(RunWorkFlowOnReleaseStudentInvoiceCode, Database::"Student Invoice", StudentInvoiceReleasedText, 0, false);
        // WorkflowEventHandling.AddEventToLibrary(RunWorkFlowOnRejectedStudentInvoiceApprovalCode, Database::"Student Invoice", StudentInvoiceSendForRejectedEventDescTxt, 0, false);


    end;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of

            RunWorkflowOnCancelStudentsAppForApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCancelStudentsAppForApprovalCode, RunWorkflowOnSendStudentsAppForApprovalCode);

            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode:

                WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendStudentsAppForApprovalCode);
        end;

        // //student invoice
        // case EventFunctionName of
        //     RunWorkFlowOnCancelStudentInvoiceApprovalCode:
        //         WorkflowEventHandling.AddEventPredecessor(RunWorkFlowOnCancelStudentInvoiceApprovalCode, RunWorkFlowOnSendStudentInvoiceForApprovalCode);

        //     RunWorkFlowOnRejectedStudentInvoiceApprovalCode:
        //         WorkflowEventHandling.AddEventPredecessor(RunWorkFlowOnRejectedStudentInvoiceApprovalCode, RunWorkFlowOnSendStudentInvoiceForApprovalCode);

        //     WorkflowEventHandling.RunWorkFlowOnApproveApprovalRequestCode:
        //         begin
        //             WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkFlowOnApproveApprovalRequestCode, RunWorkFlowOnSendStudentInvoiceForApprovalCode)
        //         end;
        //     WorkflowEventHandling.RunWorkflowOnDelegateApprovalRequestCode:
        //         begin
        //             WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkFlowOnDelegateApprovalRequestCode, RunWorkFlowOnSendStudentInvoiceForApprovalCode)
        //         end;

        // end;
    end;

    procedure RunWorkflowOnSendStudentsAppForApprovalCode(): Code[128]
    begin
        EXIT(UPPERCASE('RunWorkflowOnSendStudentsApplicationForApproval'));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Student Approval Management", 'OnSendStudentsAppForApproval', '', false, false)]
    procedure RunWorkflowOnSendStudentsForApproval(VAR Students: Record "Student Application Table")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendStudentsAppForApprovalCode, Students);
    end;

    procedure RunWorkflowOnCancelStudentsAppForApprovalCode(): Code[128]
    begin
        EXIT(UPPERCASE('RunWorkflowOnCanceltudentsApplicationForApproval'));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Student Approval Management", 'OnCancelStudentsAppApprovalRequest', '', false, false)]
    procedure RunWorkflowOnCancelStudentsApproval(VAR Students: Record "Student Application Table")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCancelStudentsAppForApprovalCode, Students);

    end;


    // //Invoice procedure
    // procedure RunWorkFlowOnSendStudentInvoiceForApprovalCode(): Code[128]

    // begin
    //     exit(UpperCase('RunWorkFlowOnSendStudentInvoiceForApproval'))

    // end;

    // procedure RunWorkFlowOnCancelStudentInvoiceApprovalCode(): Code[128]
    // begin
    //     exit(UpperCase('RunWorkFlowOnCancelStudentInvoiceApproval'));
    // end;

    // procedure RunWorkFlowOnReleaseStudentInvoiceCode(): Code[128]
    // begin
    //     exit(UpperCase('RunWorkFlowOnReleaseStudentInvoiceApproval'));
    // end;

    // procedure RunWorkFlowOnRejectedStudentInvoiceApprovalCode(): Code[128]
    // begin
    //     exit(UpperCase('RunWorkFlowOnRejectedStudentInvoiceApproval'));
    // end;


    // //student invoice
    // [EventSubscriber(ObjectType::Codeunit,Codeunit::"Student Approval Management", 'OnSendStudentInvoiceForApproval', '', true, true)]
    // local procedure RunWorkFlowOnSendStudentInvoiceForApproval(var Applicant1: Record "Student Invoice")
    // begin
    //     WorkFlowManagement.HandleEvent(RunWorkFlowOnSendStudentInvoiceForApprovalCode, Applicant1);
    // end;

    // [EventSubscriber(ObjectType::Codeunit,Codeunit::"Student Approval Management", 'OnCancelStudentInvoiceForApproval', '', true, true)]
    // local procedure RunWorkFlowOnCancelStudentInvoiceForApproval(var Applicant1: Record "Student Invoice")
    // begin
    //     WorkFlowManagement.HandleEvent(RunWorkFlowOnCancelStudentInvoiceApprovalCode, Applicant1);
    // end;

    // trigger OnRun()
    // begin

    // end;

}
























// procedure RunWorkflowOnRejectStudentsApplicationCode(): Code[128]
// begin
//     EXIT(UPPERCASE('RunWorkflowOnAfterRejectStudentsApplication'));
// end;

// [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]
// procedure RunWorkflowOnRejectStudentApplication(VAR ApprovalEntry: Record "Approval Entry")
// var
//     StudentApplicationTable: Record "Student Application Table";
// begin
//     WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectStudentsApplicationCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
//     // StudentApplicationTable.RESET;
//     // StudentApplicationTable.SETRANGE("Application No.", ApprovalEntry."Document No.");
//     // IF StudentApplicationTable.FINDFIRST THEN BEGIN
//     //     StudentApplicationTable."Application Status" := StudentApplicationTable."Application Status"::Rejected;
//     //     StudentApplicationTable.MODIFY();
//     // END;
// end;
// StudentApplicationTable.RESET;
// StudentApplicationTable.SETRANGE("Application No.", Students."Application No.");
// IF StudentApplicationTable.FINDFIRST THEN BEGIN
//     StudentApplicationTable."Application Status" := Students."Application Status"::Submitted;
//     StudentApplicationTable.MODIFY();
// END;