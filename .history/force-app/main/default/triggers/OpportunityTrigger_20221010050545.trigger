trigger OpportunityTrigger on Opportunity (before update,after insert) {

  switch on Trigger.operationType {

    when AFTER_INSERT{

      system.debug();
      OpportunityTriggerHandler.sendHTTPRequest(Trigger.New);



    }
    when BEFORE_INSERT{

      OpportunityTriggerHandler.insertRenewals(Trigger.New);
    }
  }

}

