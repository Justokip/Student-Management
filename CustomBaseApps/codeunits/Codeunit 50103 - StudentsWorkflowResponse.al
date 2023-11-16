codeunit 50103 StudentWorkFlowEventResponse
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpenDocument', '', true, true)]
    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        Student: Record "Student Application Table";
    begin
        case RecRef.Number OF
            Database::"Student Application Table":
                begin
                    RecRef.SetTable(Student);
                    Student."Application Status" := Student."Application Status"::Open;
                    Student.Modify;
                    Handled := true;

                end;

        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', true, true)]
    local procedure OnSendStudentsAppForApproval(RecRef: RecordRef; var Handled: Boolean)
    var
        Student: Record "Student Application Table";
        StudentSetupp: Record "Students Setup";
        NoSeriesMng: Codeunit NoSeriesManagement;
        ErrorStup: Label 'Could not find number series field in the setup';
    begin
        case RecRef.Number OF
            Database::"Student Application Table":

                begin
                    RecRef.SetTable(Student);
                    Student."Application Status" := Student."Application Status"::Submitted;
                    Student.Modify;
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnSetStatusToPendingApproval', '', true, true)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var IsHandled: Boolean; var Variant: Variant)
    var
        Student: Record "Student Application Table";
    begin
        case RecRef.Number OF
            Database::"Student Application Table":
                begin
                    RecRef.SetTable(Student);
                    Student."Application Status" := Student."Application Status"::"In Review";
                    Student.Modify;
                    isHandled := true;
                end;
        end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', true, true)]
    local procedure OnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Student: Record "Student Application Table";
        RecRef: RecordRef;
        StudentSetupp: Record "Students Setup";
        NoSeriesMng: Codeunit NoSeriesManagement;
        ErrorStup: Label 'Could not find number series field in the setup';
        CustomerRec: Record Customer;
        StudentTransfer: Codeunit "Student Transfer";
    begin
        RecRef.Get(ApprovalEntry."Record ID to Approve");
        case RecRef.Number of
            Database::"Student Application Table":
                begin
                    RecRef.SetTable(Student);
                    if not ApprovalsMgmt.HasOpenOrPendingApprovalEntries(ApprovalEntry."Record ID to Approve") then begin
                        Student."Application Status" := Student."Application Status"::Submitted;
                        StudentTransfer.StudentApproved(Student);

                        StudentSetupp.Get();
                        StudentSetupp.TestField("No.Seriess");
                        Student.Modify;
                        // Handled := true;
                    end;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', true, true)]
    local procedure OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        WorkflowEventHandlingCust: Codeunit "StdWorkflow Event Handling";
    begin
        case ResponseFunctionName of
            WorkflowResponseHandling.SetStatusToPendingApprovalCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                WorkflowEventHandlingCust.RunWorkflowOnSendStudentsAppForApprovalCode);
            WorkflowResponseHandling.SendApprovalRequestForApprovalCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                WorkflowEventHandlingCust.RunWorkflowOnSendStudentsAppForApprovalCode);
            WorkflowResponseHandling.CancelAllApprovalRequestsCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                WorkflowEventHandlingCust.RunWorkflowOnCancelStudentsAppForApprovalCode);
            WorkflowResponseHandling.OpenDocumentCode:
                WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode,
                WorkflowEventHandlingCust.RunWorkflowOnCancelStudentsAppForApprovalCode);

        end;
    end;


}












// //added on reject approvaol
// [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', true, true)]
// local procedure OnRejectApprovalRequest(var ApprovalEntry: Record "Approval Entry")
// var
//     RecRef: RecordRef;
//     Student: Record "STDN Student";
//     ApprovalMgmnt: Codeunit "Approvals Mgmt.";
// begin
//     RecRef.Get(ApprovalEntry."Record ID to Approve");
//     case RecRef.Number of
//         Database::"STDN Student":
//             begin
//                 RecRef.SetTable(Student);
//                 Student."Approval Status" := Student."Approval Status"::Open;

//             end;

//     end;
// end;


