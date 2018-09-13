component {

   this.name = "helloWorldSession";

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

   function onRequest(){
      var message = APPLICATION.message & ' Session started ' & dateTimeFormat(SESSION.started, "short") & ", now it's " & dateTimeFormat(now());
      writeOutput(message);
   }

}