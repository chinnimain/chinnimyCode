public with sharing class TreeViewController {

   public string JsonString {get;set;}
   public string roleOrUserId{get;set;}
   public boolean selectable{get;set;}
   public string value{get;set;}
   
   public TreeViewController(){
      roleOrUserId='00E4100000189IF';
     JsonString = RoleUtil.getTreeJSON('00E4100000189IF');
     selectable=false;
   }
}