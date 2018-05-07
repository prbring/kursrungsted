pageextension 123456700 ResourceCardExt extends "Resource Card"
{
    layout
    {
        addlast(General)
        {
            field("CSD_Resource Type"; "CSD_Resource Type")
            {

            }

            field("CSD_Quantity Per Day"; "CSD_Quantity Per Day")
            {

            }
        }
        addafter("Personal Data")
        {
            group(Room)
            {
                Caption = 'Room';
                Visible = ShowMaxField;

                field("CSD_Maximum Participants"; "CSD_Maximum Participants")
                {

                }

            }
        }
    }


    var
        [InDataSet]
        ShowMaxField: Boolean;


    trigger OnOpenPage();
    begin
        ShowMaxField := (Type = Type::Machine);
        CurrPage.Update(false);

    end;
}