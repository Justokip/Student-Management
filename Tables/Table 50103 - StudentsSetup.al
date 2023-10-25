table 50103 "Students Setup"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;primarykey; Integer)
        {
            DataClassification = ToBeClassified;
            
        }
        field(2;"No.Series"; Code[20])
        {
            TableRelation="No. Series";
            Caption='StudentApp No.Series';

        }
    }
    
    keys
    {
        key(pk; primarykey)
        {
            Clustered = true;
        }
    }
    
}