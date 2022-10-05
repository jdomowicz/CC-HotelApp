trigger caseTrigger on Case (after insert) {


// This lazy dude wrote code to auto-accept and close all cases!

  List<Case> newCases = new List<Case>();

  Id ownerId = [select Id from User WHERE Name = 'David Liu' LIMIT 1].Id;

  for (Case a : Trigger.new) {
    a.Status = 'Closed';
    a.OwnerId  = ownerId;
    newCases.add(a);
  }

  update newCases;

}



