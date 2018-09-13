component {

   this.name = "helloWorldComponents";

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

   function onRequest(template){
      writeOutput(REQUEST.message);
   }

}