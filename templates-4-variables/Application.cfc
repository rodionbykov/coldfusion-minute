component {

   this.name = "helloWorldTemplates";

   // this variable means how long application will live on server if not accessed by requests
   this.applicationTimeout = CreateTimeSpan(0, 6, 0, 0);
   
   function onRequestStart(){
      var message = new Message();
      REQUEST.message = message.getGreeting(APPLICATION.message, SESSION.started);
   }

   // onRequest method as argument receives name of the template (filename) to be executed
   // default template depends on your server setup (DirectoryIndex in Apache HTTPD)
   // usually default template is named index.cfm, so `template` argument will be `index.cfm`
   // we can override this behavior and include different template
   // 
   // here we include layout which in turn will include file set by `template` argument
   function onRequest(String template){
      try {
         include "layout.cfm";
      } catch (Any e) {
         // process exception here
      }
   }

}