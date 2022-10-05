trigger OpportunityTrigger on Opportunity (before update) {


// Automatically create a Renewal Opp for closed won deals

  // Create a Map to store all renewal opps for bulk inserting
  Map<Id, Opportunity> renewals = new Map<Id, Opportunity>();

  for (Opportunity opp : Trigger.new) {
    // Only create renewal opps for closed won deals
    if (opp.StageName.contains('Closed')) {
       Opportunity renewal = new Opportunity();
       renewal.AccountId   = 'opp.AccountId';
       renewal.Name        = opp.Name + 'Renewal';
       renewal.CloseDate   = opp.CloseDate + 365; // Add a year
       renewal.StageName   = 'Open';
       renewal.RecordTypeId  = 'Renewal';
       renewal.OwnerId     = opp.OwnerId;
       renewals.put(renewal.Id, renewal);
    }
  }

  // Bulk insert all renewals to avoid Governor Limits
  insert renewals.values();
}

