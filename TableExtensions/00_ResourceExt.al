tableextension 123456700 ResourceExt extends Resource
{
    fields
    {

        modify("Profit %")
        {
            trigger OnAfterValidate()
            begin
                rec.TestField("Unit Cost");
            end;
        }
        field(123456701;"CSD_Resource Type";Option)
        {
            OptionMembers = "Internal","External";
            OptionCaption = 'Internal,External';
            DataClassification = ToBeClassified;
        }

        field(123456702;"CSD_Maximum Participants";Integer)
        {
            Caption = 'Maximum participants';
            DataClassification = ToBeClassified;
        }

        field(123456703;"CSD_Quantity Per Day";Decimal)
        {
            Caption = 'Quantity Per Day';
            DataClassification = ToBeClassified;
        }
    }
    

}