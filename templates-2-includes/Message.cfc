component {

   public function getGreeting(String greeting, Date started){

      return  ARGUMENTS.greeting & ' Session started ' & dateTimeFormat(ARGUMENTS.started, "short") & ", now it's " & dateTimeFormat(now()); 
   }

}