trigger ContactTrigger on Contact (after insert,after update,after delete,after undelete) {


    switch on Trigger.operationType {

        when AFTER_INSERT {
            ContactTriggerHandler.afterInsertHandler(trigger.new);
        }
        when AFTER_UPDATE {

            ContactTriggerHandler.afterUpdateHandler(trigger.new, trigger.newMap);

        }

        when AFTER_DELETE {

             ContactTriggerHandler.afterDelete(trigger.old);

        }

        when AFTER_UNDELETE {

             ContactTriggerHandler.afterDelete(trigger.new);

        }

    }

}