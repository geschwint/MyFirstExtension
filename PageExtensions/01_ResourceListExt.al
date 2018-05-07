pageextension 123456701 ResourceListExt extends "Resource List"
{
    layout
    {
        modify(Type)
        {
            Visible = ShowType;
        }
        // Add changes to page layout here
        addafter(Type)
        {
            field("CSD_Resource Type"; "CSD_Resource Type") { }
            field("CSD_Maximum Participants"; "CSD_Maximum Participants")
            {
                Visible = ShowMaxField;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }


    trigger OnOpenPage();
    begin
        FilterGroup(3);
        ShowType := (GetFilter(Type) = '');
        ShowMaxField := (GetFilter(Type) = format(Type::Machine));
        FilterGroup(0);
    end;

    var
    [InDataSet]
    ShowMaxField : Boolean;
    [InDataSet]
    ShowType : Boolean;
}