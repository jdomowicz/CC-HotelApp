trigger ContactTrigger on Contact (after update) {



    switch on Trigger.operationType {

    when AFTER_UPDATE{

      OpportunityTriggerHandler.sendHTTPRequest(Trigger.New, Trigger.Old);

    }
  }

}