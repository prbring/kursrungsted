
pageextension 123456701 ResourceListExt extends "Resource List"
{
    layout
    {
        modify(Type)
        {
            Visible = ShowType;
        }
        addafter(Type)
        {
            field("Resource Type"; "CSD_Resource Type")
            {
            }
            field("Maximum Participants"; "CSD_Maximum Participants")
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
        rec.FilterGroup(3);
        ShowType := (GetFilter(Type) = '');
        ShowMaxField := (GetFilter(Type) = format(Type::machine));
        rec.FilterGroup(0);
    end;

    var
        [InDataSet]
        ShowType: Boolean;
        [InDataSet]
        ShowMaxField: Boolean;
}
