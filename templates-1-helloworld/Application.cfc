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

}