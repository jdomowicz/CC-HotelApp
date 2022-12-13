public with sharing class BronzeDiscount implements IDiscount {

    string msg;

    BronzeDiscount(){
        this.msg = 'Bronze Class Called';
        system.debug(this.msg);
    }

}
