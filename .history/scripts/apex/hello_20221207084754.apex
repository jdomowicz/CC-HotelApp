



Discount__mdt discount = [select Class_to_Instanciete__c,Customer_Tier__c,Discount__c from Discount__mdt where Customer_Tier__c = 'Bronze'];

system.debug(discount.Class_to_Instanciete__c);


Type classType = discount.Class_to_Instanciete__c.class;
system.debug(classType);
