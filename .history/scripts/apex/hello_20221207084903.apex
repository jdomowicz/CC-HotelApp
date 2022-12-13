



Discount__mdt discount = [select Class_to_Instanciete__c,Customer_Tier__c,Discount__c from Discount__mdt where Customer_Tier__c = 'Bronze'];

system.debug(discount.Class_to_Instanciete__c.class);


Type classType = BronzeDiscount.class;
system.debug(classType);
