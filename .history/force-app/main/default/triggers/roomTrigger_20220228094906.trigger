trigger roomTrigger on Room__c (before insert, after update) {

    switch on Trigger.operationType {

        WHEN BEFORE_INSERT {

            roomTriggerHandler.beforeInsert(Trigger.New);

    }
        WHEN AFTER_UPDATE,AFTER {

            roomTriggerHandler.afterUpdate(Trigger.New,Trigger.oldMap);

    }

}
}
