table 123456701 "Seminar Setup"
{
    Caption = 'Seminar Setup';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(10;"Primary Key";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Seminar Nos.";Code[20])
        {
            DataClassification = ToBeClassified;
        }        
        field(30;"Seminar Registration Nos.";Code[20])
        {
            DataClassification = ToBeClassified;
        }        
        field(40;"Posted Seminar Reg. Nos.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK;"Primary Key")
        {
            Clustered = true;
        }
    }
    
    var
        myInt : Integer;

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

}