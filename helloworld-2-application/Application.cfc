component {

   this.name = "helloWorldApplication";

   // application will be stopped after 6 hours of inactivity
   this.applicationTimeout = CreateTimeSpan(0, 6, 0, 0);

   function onApplicationStart(){
      APPLICATION.message = "Hello World!";
   }

   function onRequest(){
      writeOutput(APPLICATION.message);
   }

}