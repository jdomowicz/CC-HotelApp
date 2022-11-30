trigger OpportunityTrigger on Opportunity (before update,after insert) {

  switch on Trigger.operationType {

    when AFTER_INSERT{

      system.debug(Trigger.New);
      OpportunityTriggerHandler.sendHTTPRequest(Trigger.New);

86989620

    }
    when BEFORE_INSERT{

      OpportunityTriggerHandler.insertRenewals(Trigger.New);
    }
  }

}