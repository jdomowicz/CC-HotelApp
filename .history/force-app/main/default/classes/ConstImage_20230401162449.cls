public with sharing class ConstImage {

    public static final ConstImage INSTANCE = new ConstImage();

    public final String API_NAME = StaticResource.sObjectType.getDescribe().getName();

    public final imageSource IMAGE_SOURCE = new imageSource();


    private class imageSource{

        String ImageUrl = URL.getSalesforceBaseUrl().toExternalForm() + PageReference.forResource('rooms_photos').getUrl().substringBefore('?');

    }

}