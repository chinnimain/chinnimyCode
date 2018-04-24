public class ParkLocator {
    
    public static String[] country(string countryname){
        
        
        ParkService.ParksImplPort obj = new ParkService.ParksImplPort();
       return obj.byCountry(countryname);
    }

}