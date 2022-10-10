trigger OpportunityTrigger on Opportunity (before update,after insert) {

  switch on Trigger.operationType {

    when AFTER_INSERT{

      OpportunityTriggerHandler.sendHTTPRequest();
  
    }
    when BEFORE_INSERT{

    }
  }

}

