trigger ContactTrigger on Contact (before update) {



    switch on Trigger.operationType {

    when BEFORE_UPDATE{

      ContactTriggerHandler.beforeUpdate(Trigger.old, Trigger.newMap);

    }
  }

}