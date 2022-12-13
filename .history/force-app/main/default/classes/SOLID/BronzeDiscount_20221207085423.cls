public with sharing class BronzeDiscount implements IDiscount {

    string msg;

  public void BronzeDiscount(){
        this.msg = 'Bronze Class Called';
        system.debug(this.msg);
    }

}
