trigger ContactTrigger on Contact (after update) {



    switch on Trigger.operationType {

    when AFTER_UPDATE{

      ContactTriggerHandler.afterUpdate(Trigger.New, Trigger.OldMap);

    }
  }

}