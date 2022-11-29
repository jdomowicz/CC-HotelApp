public interface IContactDiscount {

    // This method calculate discount for different type of Customer Status
    list<contact> calculateDiscount(list<contact> contactId);

}
