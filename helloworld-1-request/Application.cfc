component {

   this.name = "helloWorldRequest";

   function onRequest(){
      var message = "Hello World!";
      writeOutput(message);
   }

}