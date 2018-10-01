component {

   this.name = "helloWorldApplication";

   // application will be stopped after 6 hours of inactivity
   this.applicationTimeout = CreateTimeSpan(0, 6, 0, 0);

   function onApplicationStart(){
      // we will put variable into APPLICATION scope
      // this variable can be used globally across application
      APPLICATION.message = "Hello World!";
   }

   function onRequest(){
      writeOutput(APPLICATION.message);
   }

}