<cfcomponent accessors="true">

  <cfproperty name="id" />
  <cfproperty name="login" />
  <cfproperty name="firstname" />
  <cfproperty name="lastname" />
  <cfproperty name="description" />
  <cfproperty name="level" />

  <cffunction  name="init">
    <cfset id = 0 />
    <cfset login = "" />
    <cfset firstname = "" />
    <cfset lastname = "" />
    <cfset description = "" />
    <cfset level = 0 />

    <cfreturn this />
  </cffunction>

  <cffunction  name="getFullName">
    <cfreturn firstname & " " & lastname>
  </cffunction>

  <cffunction  name="getLastFirstName">
    <cfreturn lastname &", " & firstname>
  </cffunction>
</cfcomponent>