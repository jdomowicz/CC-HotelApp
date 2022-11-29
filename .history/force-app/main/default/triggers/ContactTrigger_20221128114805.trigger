trigger ContactTrigger on Contact (after update) {



    switch on Trigger.operationType {

    when AFTER_UPDATE{

      system.debug(Trigger.New);
      OpportunityTriggerHandler.sendHTTPRequest(Trigger.New);

    }
  }

}