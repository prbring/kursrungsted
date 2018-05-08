codeunit 123456739 EventSubscriptions
// CSD1.00 - 2018-01-01 - D. E. Veloper
// Chapter 7 - Lab 2-1
{
    [EventSubscriber(ObjectType::Codeunit, 212, 'OnBeforeResLedgEntryInsert', '', true, true)]
    local procedure PostResJnlLineOnBeforeResLedgEntryInsert(var ResLedgerEntry: Record "Res. Ledger Entry"; ResJournalLine: Record "Res. Journal Line");
    var
        c: Codeunit "Res. Jnl.-Post Line";
    begin
        ResLedgerEntry."CSD_Seminar No." := ResJournalLine."CSD_Seminar No.";
        ResLedgerEntry."CSD_Seminar Registration No." := ResJournalLine."CSD_Seminar Registration No.";
    end;


    [EventSubscriber(ObjectType::Page, 344, 'OnAfterNavigateFindRecords', '', true, true)]
    local procedure MyProcedure(var DocumentEntry: Record "Document Entry"; DocNoFilter: Text; PostingDateFilter: Text);
    var
        SeminarLedgerEntry: record "Seminar Ledger Entry";
        PostedSeminarRegHeader: record "Posted Seminar Reg. Header";
        DocNoOfRecords: Integer;
        NextEntryNo: Integer;
    begin
        if PostedSeminarRegHeader.ReadPermission then begin
            PostedSeminarRegHeader.Reset;
            PostedSeminarRegHeader.SetFilter("No.", DocNoFilter);
            PostedSeminarRegHeader.SetFilter("Posting Date", PostingDateFilter);
            DocNoOfRecords := PostedSeminarRegHeader.Count;
            With DocumentEntry do
            begin
                if DocNoOfRecords = 0 then
                    exit;
                if FindLast then
                    NextEntryNo := "Entry No." + 1
                else
                    NextEntryNo := 1;
                Init;
                "Entry No." := NextEntryNo;
                "Table ID" := Database::"Posted Seminar Reg. Header";
                "Document Type" := 0;
                "Table Name" := COPYSTR(PostedSeminarRegHeader.TableCaption, 1, MAXSTRLEN("Table Name"));
                "No. of Records" := DocNoOfRecords;
                Insert;
                //SelectLatestVersion;
            end;
        end;

        if SeminarLedgerEntry.ReadPermission then begin
            SeminarLedgerEntry.Reset;
            SeminarLedgerEntry.SetFilter("Document No.", DocNoFilter);
            SeminarLedgerEntry.SetFilter("Posting Date", PostingDateFilter);
            DocNoOfRecords := SeminarLedgerEntry.Count;
            With DocumentEntry do
            begin
                if DocNoOfRecords = 0 then
                    exit;
                if FindLast then
                    NextEntryNo := "Entry No." + 1
                else
                    NextEntryNo := 1;
                Init;
                "Entry No." := NextEntryNo;
                "Table ID" := Database::"Posted Seminar Reg. Header";
                "Document Type" := 0;
                "Table Name" := COPYSTR(SeminarLedgerEntry.TableCaption, 1, MAXSTRLEN("Table Name"));
                "No. of Records" := DocNoOfRecords;
                Insert;
                //SelectLatestVersion;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, 344, 'OnAfterNavigateShowRecords', '', true, true)]
    local procedure ExtendNavigateOnAfterNavigateShowRecords(TableID: Integer; DocNoFilter: Text; PostingDateFilter: Text; ItemTrackingSearch: Boolean);
    var
        SeminarLedgerEntry: record "Seminar Ledger Entry";
        PostedSeminarRegHeader: record "Posted Seminar Reg. Header";

    begin
        case TableID of
          Database::"Posted Seminar Reg. Header" :
            Page.Run(0, PostedSeminarRegHeader);
        Database::"Seminar Ledger Entry" :
            Page.Run(0, SeminarLedgerEntry);
        end;
    end;
}



// Locate the 39_EventSubscriptions.al file in the codeunits folder
// 2) Create a EventSubscriber for FindRecords using the Integration Event
// OnAfterNavigateFindRecords in the Navigate page (344) using teven and
// selecting the teventsub snippet
// 3) Replace ObjectType with Page
// 4) Replace ObjectId with 344
// 5) Delete 'OnSomeEvent' and click Ctrl+[Space] Select
// OnAfterNavigateFindRecords
// 6) Before pressing [Enter], make a note of the parameters for the event
// Press [Enter] to select
// 8) Replace 'ElementName' with ‘’
// 9) Replace SkipOnMissingLicense with true
// 10) Replace SkipOnMissingPermission with true
// 11) Create a local procedure ExtendNavigateOnAfterNavigateFindRecords using the tpro snippet
// 12) Add the parameters to the procedure
// DocumentEntry : Record “Document Entry”
// DocNoFilter : Text
// PostingDateFilter : Text
// 13) Create local variables:
// SeminarLedgerEntry : record “Seminar Ledger Entry”
// PostedSeminarRegHeader : record “Posted Seminar Reg. Header”
// 14) Add code to the procedure to enable Navigate to find records from the Posted Seminar Reg. Header table
// 15) Add the similar code to the procedure to enable Navigate to find records from the Seminar Ledger Entry table by copying the previous code, replacing the PostedSeminarRegHeader variable with SeminarLedgerEntry and replacing the SetFilter(“No.” with SetFilter(“Document No.”.
// 16) Create an event subscription for ShowRecords using the Integration Event OnAfterNavigateShowRecords. Make a note of the needed parameters:
// 17) Create a local procedure ExtendNavigateOnAfterNavigateShowRecords on the Navigate page (344) using the same procedure as above.
// 18) Add code to the procedure to enable Navigate to show records from both the Seminar Ledger Entries and the Posted Seminar Reg. Header tables
