public class RoleUtil {

    /********************* Properties used by getRootNodeOfUserTree function - starts **********************/
    // map to hold roles with Id as the key
    private static Map <Id, UserRole> roleUsersMap;

    // map to hold child roles with parentRoleId as the key
    private static Map <Id, List<UserRole>> parentChildRoleMap;

    
    Static Set<Id> groupSet = new Set<Id>();
    // List holds all subordinates
    private static List<User> allSubordinates {get; set;}
    
    static Set<ID>Higherrole = new Set<ID>();
    
   static  map<Id,UserRole> withNull = new map<Id,UserRole>();
    
    private static boolean rootNode;
        
    // Global JSON generator
    private static JSONGenerator gen {get; set;}

    /********************* Properties used by getRootNodeOfUserTree function - ends **********************/
    
    
    /********************* Properties used by getSObjectTypeById function - starts ********************* */
    // map to hold global describe data
    private static Map<String,Schema.SObjectType> gd;
    
    // map to store objects and their prefixes
    private static Map<String, String> keyPrefixMap;

    // to hold set of all sObject prefixes
    private static Set<String> keyPrefixSet;
    private static RoleNodeWrapper roleNodeWraperBaseObj;
    /********************* Properties used by getSObjectTypeById function - ends **********************/
    
    /* // initialize helper data */ 
    static {
        // initialize helper data for getSObjectTypeById function
        init1();
        
        // initialize helper data for getRootNodeOfUserTree function
        init2();
        
        init3();
    }
    
    
    private static void init3(){
        
          roleNodeWraperBaseObj = new RoleNodeWrapper();
          roleNodeWraperBaseObj.myRoleName  = 'MUFG';
          roleNodeWraperBaseObj.hasChildren = true;
          roleNodeWraperBaseObj.isLeafNode = false;
          roleNodeWraperBaseObj.myRoleId = UserInfo.getOrganizationId();
          higherRoleEval(UserInfo.getUserRoleId());
          sharedUsers();
          groupUsers();
          userswithRoles();
        
    }
    /* // init1 starts <to initialise helper data> */
    private static void init1() {
        // get all objects from the org
        gd = Schema.getGlobalDescribe();
        
        // to store objects and their prefixes
        keyPrefixMap = new Map<String, String>{};
        
        //get the object prefix in IDs
        keyPrefixSet = gd.keySet();
        
        // fill up the prefixes map
        for(String sObj : keyPrefixSet) {
            Schema.DescribeSObjectResult r =  gd.get(sObj).getDescribe();
            String tempName = r.getName();
            String tempPrefix = r.getKeyPrefix();
            keyPrefixMap.put(tempPrefix, tempName);
        }
    }
    /* // init1 ends */

    /* // init2 starts <to initialise helper data> */
    private static void init2() {
        
        // Create a blank list
        allSubordinates = new List<User>();
        
        rootNode=false;
        
        // Get role to users mapping in a map with key as role id
        roleUsersMap = new Map<Id, UserRole>([select Id, Name, parentRoleId, (select id, name from users) from UserRole order by parentRoleId]);
        
        // populate parent role - child roles map
        parentChildRoleMap = new Map <Id, List<UserRole>>();        
        for (UserRole r : roleUsersMap.values()) {
            if(r.ParentRoleId==null){
        withNull.put(r.Id,r);
        
    }
            List<UserRole> tempList;
            if (!parentChildRoleMap.containsKey(r.parentRoleId)){
                tempList = new List<UserRole>();
                tempList.Add(r);
                parentChildRoleMap.put(r.parentRoleId, tempList);
            }
            else {
                tempList = (List<UserRole>)parentChildRoleMap.get(r.parentRoleId);
                tempList.add(r);
                parentChildRoleMap.put(r.parentRoleId, tempList);
            }
        }
    } 
    
    static void higherRoleEval(Id p_role){
        
        higherRole.add(p_role);
        
        
        userRole o_UserRoleRec = roleUsersMap.get(p_role);
        if(o_UserRoleRec!=null && o_UserRoleRec.parentRoleId!=null){
        //roleUsersMap.add(userRole.parentRoleId);
        higherRoleEval(o_UserRoleRec.parentRoleId);
        
        }
        
        
    }
    /* // init2 ends */
    
    
    //
    Static Set<Id> UserSet = new Set<Id>();
    static void sharedUsers(){
         String strg = ApexPages.currentPage().getParameters().get('id');
        for(OpportunityShare v_OppSh : [SELECT UserorGroupId from OpportunityShare where OpportunityId =:strg]){
            
            if(v_OppSh.UserorGroupId.getSObjectType().getDescribe().getName()=='Group'){
                 
                       groupSet.add(v_OppSh.UserorGroupId);
                
            }
            else
            {
                
                       UserSet.add(v_OppSh.UserorGroupId);
            }

            
            
        }
        
        
    }
    
    static Map<Id,List<User>> sharedUsersMap = new Map<Id,List<User>>();
    
    static void groupUsers(){
    
     System.debug('groupSet+++'+groupSet);
        
               if(!groupSet.isEmpty()){
                   
                   List<GroupMember> groupMemberList = [SELECT UserorGroupId from GroupMember where GroupId in :groupSet];
                   
                   groupSet.clear();
                     for(GroupMember v_Group : groupMemberList){
            
            if(v_Group.UserorGroupId.getSObjectType().getDescribe().getName()=='Group'){
                 
                       groupSet.add(v_Group.UserorGroupId);
                
            }
            else
            {
                
                       UserSet.add(v_Group.UserorGroupId);
            }
                   
               }
           groupUsers();
        
     }
    
    }
    
    
    //
    
    static void userswithRoles(){
        
            for(User v_UserObj : [SELECT Id, Name,UserRoleId from User Where Id in : UserSet]){
                
                if(sharedUsersMap.containskey(v_UserObj.UserRoleId)){
                    
                        List<User> userList=sharedUsersMap.remove(v_UserObj.UserRoleId);
                        userList.add(v_UserObj);
                        sharedUsersMap.put(v_UserObj.UserRoleId,userList);
                }
                else{
                    List<User> userList = new List<User>();
                        userList.add(v_UserObj);
                        sharedUsersMap.put(v_UserObj.UserRoleId,userList);
                    
                    
                }
                
                
            }
        
    }

    /* // public method to get the starting node of the RoleTree along with user list */
    public static RoleNodeWrapper getRootNodeOfUserTree (Id userOrRoleId) {
        return createNode(userOrRoleId);
    }
    
    /* // createNode starts */
    
    
    private static RoleNodeWrapper createNode(Id objId) {
        RoleNodeWrapper n = new RoleNodeWrapper();
        Id roleId;
        
        if(!rootNode){
            
            
            
        }
        
        if (isRole(objId)) {
            roleId = objId;
            System.debug(higherRole+'+++++++'+roleUsersMap.get(roleId).Users);
            if ((higherRole.contains(roleId)&&!roleUsersMap.get(roleId).Users.isEmpty())) {
                n.myUsers = roleUsersMap.get(roleId).Users;
                allSubordinates.addAll(n.myUsers);
                n.hasUsers = true;
            }else               
                if ((sharedUsersMap.get(roleId)!=null)) {
                n.myUsers = sharedUsersMap.get(roleId);
                allSubordinates.addAll(n.myUsers);
                n.hasUsers = true;
            }
            }
        
        else {
            List<User> tempUsrList = new List<User>();
            User tempUser = [Select Id, Name, UserRoleId from User where Id =: objId];
            tempUsrList.add(tempUser);
            n.myUsers = tempUsrList;
            roleId = tempUser.UserRoleId;
        }
        n.myRoleId = roleId;
        n.myRoleName = roleUsersMap.get(roleId).Name;
        n.myParentRoleId = roleUsersMap.get(roleId).ParentRoleId;

        if (parentChildRoleMap.containsKey(roleId)){
            n.hasChildren = true;
            n.isLeafNode = false;
            List<RoleNodeWrapper> lst = new List<RoleNodeWrapper>();
            for (UserRole r : parentChildRoleMap.get(roleId)) {
                lst.add(createNode(r.Id));
            }           
            n.myChildNodes = lst;
        }
        else {
            n.isLeafNode = true;
            n.hasChildren = false;
        }
        return n;
    }
    
    public static List<User> getAllSubordinates(Id userId){
        createNode(userId);
        return allSubordinates;
    }
    
    public static String getTreeJSON(Id userOrRoleId) {
        gen = JSON.createGenerator(true);
        List<RoleNodeWrapper> lst = new List<RoleNodeWrapper>();
        
        for(Id roleID: withNull.keySet()){
            lst.add(createNode(roleID));
            
        }
        
        roleNodeWraperBaseObj.myChildNodes = lst;
        
        RoleNodeWrapper node =roleNodeWraperBaseObj;
        System.debug(node);
        UserCountatRoleLevel(node,node);
        System.debug('++++++++'+node);
        gen.writeStartArray();
        
            convertNodeToJSON(node);
        gen.writeEndArray();
        return gen.getAsString();
    }
    
    private static void convertNodeToJSON(RoleNodeWrapper objRNW){
        gen.writeStartObject();
            gen.writeStringField('title', objRNW.myRoleName);
            gen.writeStringField('key', objRNW.myRoleId);
            gen.writeBooleanField('unselectable', false);
            gen.writeBooleanField('expand', true);
            gen.writeBooleanField('isFolder', true);
            if (objRNW.hasUsers || objRNW.hasChildren)
            {
                gen.writeFieldName('children');
                gen.writeStartArray();
                    if (objRNW.hasUsers)
                    {
                        for (User u : objRNW.myUsers)
                        {
                            gen.writeStartObject();
                                gen.writeStringField('title', u.Name);
                                gen.writeStringField('key', u.Id);
                            gen.WriteEndObject();
                        }
                    }
                    if (objRNW.hasChildren)
                    {
                        for (RoleNodeWrapper r : objRNW.myChildNodes)
                        {
                            convertNodeToJSON(r);
                        }
                    }
                gen.writeEndArray();
            }
        gen.writeEndObject();
    }
    
    private static void UserCountatRoleLevel(RoleNodeWrapper objRNW, RoleNodeWrapper p_objRNW){
       
            if (objRNW.hasUsers || objRNW.hasChildren)
            {
               //// gen.writeFieldName('children');
                gen.writeStartArray();
                    if (objRNW.hasUsers)
                    {
                        
                          p_objRNW.userCount=p_objRNW.userCount+objRNW.myUsers.size();
                       
                    }
                    if (objRNW.hasChildren)
                    {
                        for (RoleNodeWrapper r : objRNW.myChildNodes)
                        {
                            UserCountatRoleLevel(r,objRNW);
                        }
                    }
               // gen.writeEndArray();
            }
        //gen.writeEndObject();
    }
    
    /* // general utility function to get the SObjectType of the Id passed as the argument, to be used in conjunction with */ 
    public static String getSObjectTypeById(Id objectId) {
        String tPrefix = objectId;
        tPrefix = tPrefix.subString(0,3);
        
        //get the object type now
        String objectType = keyPrefixMap.get(tPrefix);
        return objectType;
    }
    /* // utility function getSObjectTypeById ends */
    
    /* // check the object type of objId using the utility function getSObjectTypeById and return 'true' if it's of Role type */
    public static Boolean isRole (Id objId) {
        if (getSObjectTypeById(objId) == String.valueOf(UserRole.sObjectType)) {
            return true;
        }
        else if (getSObjectTypeById(objId) == String.valueOf(User.sObjectType)) {
            return false;
        } 
        return false;
    }
    /* // isRole ends */
    
    public class RoleNodeWrapper {
    
        // Role info properties - begin
        public String myRoleName {get; set;}
        
        public Id myRoleId {get; set;}
        
        public String myParentRoleId {get; set;}
        // Role info properties - end
        
        
        // Node children identifier properties - begin
        public Boolean hasChildren {get; set;}
        
        public Boolean isLeafNode {get; set;}
        
        public Boolean hasUsers {get; set;}
        // Node children identifier properties - end
        
        public  integer userCount{get;set;}
        // Node children properties - begin
        public List<User> myUsers {get; set;}
    
        public List<RoleNodeWrapper> myChildNodes {get; set;}
        // Node children properties - end   
        
        public RoleNodeWrapper(){
            hasUsers = false;
            hasChildren = false;
            userCount=0;
            
        }
    }
 }