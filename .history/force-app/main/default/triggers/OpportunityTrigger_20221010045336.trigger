trigger OpportunityTrigger on Opportunity (before update,after insert) {

  switch on operationType {
    when AFTER_INSERT{
    }
    when BEFORE_INSERT{

    }
  }


}

