public class AnimalLocator {
    
    
    public static String getAnimalNameById(integer id) {
        Http http = new Http();
        String returnval;
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string 
            System.debug(response.getBody());
            normal animalobj = (normal)Json.deserialize(response.getBody(),normal.class);
            System.debug(animalobj);
            returnval= animalobj.animal.name;
        }
        return returnval;
    }
    public class normal{
        
        animal animal;
    }
    public class animal{
        
        integer id;
        String name;
        String eats;
        String says;
        
    }
}