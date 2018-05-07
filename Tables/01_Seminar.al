table 123456701 Seminar
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;"No.";Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            trigger OnValidate();
            begin
                if "No." <> xRec."No." then begin
                    SeminarSetup.Get;
                    NoSeriesMgmt.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2;Name;Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
            trigger OnValidate();
            begin
                if ("Search Name" = '') or ("Search Name" = UpperCase(Name)) then
                    "Search Name" := Name;
            end;
        }
        field(3;"Seminar Duration";Decimal)
        {
            Caption = 'Seminar Duration';
            DecimalPlaces = 0:1;
            DataClassification = ToBeClassified;
        }
        field(4;"Minimum Participants";Integer)
        {
            Caption = 'Minimum Participants';
            DataClassification = ToBeClassified;
        }
        field(5;"Maximum Participants";Integer)
        {
            Caption = 'Maximum Participants';
            DataClassification = ToBeClassified;
        }
        field(6;"Search Name";Code[50])
        {
            Caption = 'Search Name';
            DataClassification = ToBeClassified;
        }
        field(7;Blocked;Boolean)
        {
            Caption = 'Blocked';
            DataClassification = ToBeClassified;
        }
        field(8;"Last Date Modified";Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(9;"Comment";Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(10;"Seminar Price";Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 1;
            DataClassification = ToBeClassified;
        }
        field(11;"Gen. Prod. Posting Group";Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
            DataClassification = ToBeClassified;
            trigger OnValidate();
            begin
                if xrec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group" then begin
                    if GenProductPostingGroup.ValidateVatProdPostingGroup(GenProductPostingGroup,"Gen. Prod. Posting Group") then
                        Validate("VAT Prod. Posting Group",GenProductPostingGroup."Def. VAT Prod. Posting Group");
                end;
            end;
        }
        field(12;"VAT Prod. Posting Group";Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
            DataClassification = ToBeClassified;
        }
        field(13;"No. Series";Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK;"No.")
        {
            Clustered = true;
        }
    }
    
    
    var
        myInt : Integer;

    trigger OnInsert();
    begin
        if "No." = '' then begin
            SeminarSetup.Get;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgmt.InitSeries(SeminarSetup."Seminar Nos.",xRec."No. Series",0D,"No.","No. Series");
        end;
    end;

    trigger OnModify();
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
        "Last Date Modified" := Today;
    end;

    procedure AssistEdit() : Boolean;
    begin
        with Seminar do begin
            seminar := Rec;
            SeminarSetup.Get;
            SeminarSetup.TestField("Seminar Nos.");
            if NoSeriesMgmt.SelectSeries(SeminarSetup."Seminar Nos.",xrec."No. Series","No. Series") then begin
                NoSeriesMgmt.SetSeries("No.");
                Rec := Seminar;
                exit(true);
            end;
        end;
    end;
    var
        SeminarSetup : Record "Seminar Setup";
        // SeminarCommentLine : Record ...
        Seminar : Record Seminar;
        GenProductPostingGroup : Record "Gen. Product Posting Group";
        NoSeriesMgmt : Codeunit NoSeriesManagement;
}