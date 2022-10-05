trigger caseTrigger on Case (after insert) {


// This lazy dude wrote code to auto-accept and close all cases!

  List<Case> newCases = new List<Case>();

 Id ownerId = [select id from User where Name = 'David Liu' LIMIT ];

  for (Case a : Trigger.new) {
    a.Status = 'Closed';
    a.Owner.Name  = 'David Liu';
    newCases.add(a);
  }

  update newCases;

}



