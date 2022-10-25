trigger ContactTrigger on Contact (after insert,after update,after delete,after undelete) {


    switch on Trigger.operationType {

        when  AFTER_INSERT {

            ContactTriggerHandler

        }
        when AFTER_UPDATE {

        }
    }

}