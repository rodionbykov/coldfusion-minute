component {

   this.name = "helloWorldSession";

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

   function onRequest(){
      var message = APPLICATION.message & ' Session started ' & dateTimeFormat(SESSION.started, "short") & ", now it's " & dateTimeFormat(now());
      writeOutput(message);
   }

}