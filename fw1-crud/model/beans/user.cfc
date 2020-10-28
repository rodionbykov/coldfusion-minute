<cfcomponent accessors="true">

  <cfproperty name="id" />
  <cfproperty name="login" />
  <cfproperty name="firstname" />
  <cfproperty name="lastname" />
  <cfproperty name="description" />
  <cfproperty name="level" />

  <cffunction  name="init">
    <cfset variables.id = 0 />
    <cfset variables.login = "" />
    <cfset variables.firstname = "" />
    <cfset variables.lastname = "" />
    <cfset variables.description = "" />
    <cfset variables.level = 0 />

    <cfreturn this />
  </cffunction>

  <cffunction  name="getFullName">
    <cfreturn variables.firstname & " " & variables.lastname>
  </cffunction>

  <cffunction  name="getLastFirstName">
    <cfreturn variables.lastname &", " & variables.firstname>
  </cffunction>

</cfcomponent>
