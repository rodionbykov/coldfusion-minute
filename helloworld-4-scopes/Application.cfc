component {

   this.name = "helloWorldScopes";

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
      REQUEST.message = APPLICATION.message & ' Session started ' & dateTimeFormat(SESSION.started, "short") & ", now it's " & dateTimeFormat(now());
   }

   function onRequest(){
      writeOutput(REQUEST.message);
      
      writeDump(var=SERVER, label="Server scope, readonly");
      writeDump(var=CGI, label="CGI scope, readonly");
      writeDump(var=APPLICATION, label="Application-wide variables");
      writeDump(var=SESSION, label="Session variables persistent to single visitor");
      writeDump(var=COOKIE, label="Variables coming from request cookies");
      writeDump(var=URL, label="Query parameters from URL");
      writeDump(var=FORM, label="Form data");
      writeDump(var=REQUEST, label="Global data available across request");
      writeDump(var=ARGUMENTS, label="Variables passed as function arguments");
      writeDump(var=LOCAL, label="Local function variables");
   }

}