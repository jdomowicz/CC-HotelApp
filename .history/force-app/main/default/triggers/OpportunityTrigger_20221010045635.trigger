trigger OpportunityTrigger on Opportunity (before update,after insert) {

  switch on Trigger.operationType {

    when AFTER_INSERT{

      OpportunityTriggerHandler.sendHTTPRequest(Trigger.New);

    }
    when BEFORE_INSERT{

    }
  }

}

