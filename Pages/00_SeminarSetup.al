page 123456700 "Seminar Setup"
{
    PageType = Card;
    SourceTable = "Seminar Setup";
    Caption = 'Seminar Setup';
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                field("Seminar Nos."; "Seminar Nos.") { }
                field("Seminar Registration Nos."; "Seminar Registration Nos.") { }
                field("Posted Seminar Reg. Nos."; "Posted Seminar Reg. Nos.") { }
            }
        }
    }

    trigger OnOpenPage();
    var
        myInt: Integer;
    begin
        if not Get then begin
            Init;
            Insert;
        end;
    end;
}