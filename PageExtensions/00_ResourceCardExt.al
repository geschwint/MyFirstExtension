pageextension 123456700 ResourceCardExt extends "Resource Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(General)
        {
            field("CSD_Resource Type";"CSD_Resource Type"){}
            field("CSD_Quantity Per Day";"CSD_Quantity Per Day"){}

        }
        addafter("Personal Data")
        {
            group(Room)
            {
                field("CSD_Maximum Participants";"CSD_Maximum Participants")
                {
                    Visible = ShowMaxField;
                }
            }
        }
    }

    actions
    {
    }
    
    var
        [InDataSet]
        ShowMaxField : Boolean;

        trigger OnOpenPage();
        begin
            ShowMaxField := (Type = Type::Machine);    
            currpage.Update(false);        
        end;
}