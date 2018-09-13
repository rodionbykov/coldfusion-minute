component {

   this.name = "helloWorldTemplates";

   // application will be stopped after 6 hours of inactivity
   this.applicationTimeout = CreateTimeSpan(0, 6, 0, 0);

   // allow sessions
   this.sessionManagement = true;
   // session data will be forgotten after 30 minutes of inactivity
   this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0);

   function onApplicationStart(){
      APPLICATION.message = "Hello World!";
   }

   function onSessionStart() {
      SESSION.started = now();
   }

   function onRequestStart() {
      var message = new Message();
      REQUEST.message = message.getGreeting(APPLICATION.message, SESSION.started);
   }

   // by default, onRequest includes requested *.cfm template
   // we can safely remove onRequest and template still will be included
   // default template depends on your server setup
   // usually it is named index.cfm
   /*
   function onRequest(String template){
      try {
         include ARGUMENTS.template;
      } catch (any e) {
         //handle the exception
      }
   }
   */

}