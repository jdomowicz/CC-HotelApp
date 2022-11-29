trigger ContactTrigger on Contact (before update) {



    switch on Trigger.operationType {

    when BEFORE_UPDATE{

      ContactTriggerHandler.afterUpdate(Trigger.old, Trigger.newMap);

    }
  }

}