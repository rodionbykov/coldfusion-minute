component {

   this.name = "helloWorldTemplates";
   this.applicationTimeout = CreateTimeSpan(0, 6, 0, 0);
   this.sessionManagement = true;
   this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0);

   function onApplicationStart(){
      APPLICATION.message = "Hello World!";
   }

   function onSessionStart(){
      SESSION.started = now();
   }
   
   function onRequestStart(){
      var message = new Message();
      REQUEST.message = message.getGreeting(APPLICATION.message, SESSION.started);
   }

   // onRequest method receives name of the template to be executed
   // default template depends on your server setup (DirectoryIndex in Apache HTTPD)
   // usually default template is named index.cfm
   // we can override this behavior and include different template
   function onRequest(String template){
      try {
         include "layout.cfm";
      } catch (Any e) {
         // process exception here
      }
   }

}