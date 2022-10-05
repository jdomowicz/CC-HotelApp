trigger caseTrigger on Case (before insert) {


// This lazy dude wrote code to auto-accept and close all cases!
trigger LazyEmployee on Case (after insert) {
  List<Case> newCases = new List<Case>();
  for (Case a : Trigger.new) {
    a.Status = "Closed";
    a.Owner  = "David Liu";
    newCases.add(a)
  }
  update newCases;
}

}

