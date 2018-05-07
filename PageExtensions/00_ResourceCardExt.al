pageextension 123456700 ResourceCardExt extends "Resource Card"
{
    layout
    {
        addlast(General)
        {
            field("CSD_Resource Type";"CSD_Resource Type")
            {

            }
        }
        addafter("Personal Data")
        {
            group(Room)
            {
                Visible = ShowMaxField;
                field("CSD_Maximum Participants";"CSD_Maximum Participants")
                {

                }

                field("CSD_Quantity Per Day";"CSD_Quantity Per Day")
                {

                }

            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    
    var
       [InDataSet]
        ShowMaxField : Boolean;


    trigger OnOpenPage();
    begin
        ShowMaxField := (Type=Type::Machine);
        CurrPage.Update(false);
        
    end;
}