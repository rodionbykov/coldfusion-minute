component {

   this.name = "helloWorldErrors";

   // application will be stopped after 6 hours of inactivity
   this.applicationTimeout = CreateTimeSpan(0, 6, 0, 0);

   // allow storing user sessions
   this.sessionManagement = true;
   // session data will be forgotten after 30 minutes of inactivity
   this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0);

   function onApplicationStart(){
      // we will put variable into APPLICATION scope
      // this variable can be used globally across application
      APPLICATION.message = "Hello World!";
   }

   function onSessionStart(){
      // variables specific to requests, originating from one (same) browser      
      SESSION.started = now(); // current date-time
   }

   function onRequestStart(){
      var err = 42 / 0; // let's create some singularity
      var message = new Message();
      REQUEST.message = message.getGreeting(APPLICATION.message, SESSION.started);      
   }

   function onRequest(){
      writeOutput(REQUEST.message);
   }

   // this is global exception handler
   // if exception was not caught earlier, it will land here
   function onError(Struct exception, String eventName){
      dump(exception);
      dump(eventName); // will be empty if exception happened in CFML template
   }

}