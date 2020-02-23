<cfcomponent accessors="true">

  <cffunction name="getUsers">
    <cfargument name="page" type="numeric" default="1" />
    <cfargument name="word" type="any" default="" />
    <cfargument name="pagesize" type="numeric" default="10" />
    <cfif page GT 1>
      <cfset offset = (page-1) * pagesize />
    <cfelse>
      <cfset offset = 0 />
    </cfif>

    <cfset result=[] />

    <cfquery name="qry">
      SELECT id, login, firstname, lastname, description, level
      FROM users
      WHERE firstname LIKE <cfqueryparam value="%#word#%" cfsqltype="cf_sql_varchar" />
        OR lastname LIKE <cfqueryparam value="%#word#%" cfsqltype="cf_sql_varchar" />
      ORDER BY id
      LIMIT #offset#, #pagesize#
    </cfquery>

    <cfloop query="qry">
      <cfset user = new model.beans.user() />
      <cfset user.setID(qry.id) />
      <cfset user.setLogin(qry.login) />
      <cfset user.setFirstName(qry.firstname) />
      <cfset user.setLastName(qry.lastname) />
      <cfset user.setDescription(qry.description) />
      <cfset user.setLevel(qry.level) />
      <cfset result.append(user) />
    </cfloop>

    <cfreturn result />
  </cffunction>

  <cffunction name="getUsersCount">
    <cfargument name="page" type="numeric" default="1" />
    <cfargument name="word" type="any" default="" />

    <cfset result = 0 />

    <cfquery name="qry">
      SELECT count(id) AS users
      FROM users
      WHERE firstname LIKE <cfqueryparam value="%#word#%" cfsqltype="CF_SQL_VARCHAR" />
        OR lastname LIKE <cfqueryparam value="%#word#%" cfsqltype="CF_SQL_VARCHAR" />
    </cfquery>
    <cfif qry.RecordCount GT 0>
      <cfset result = qry.users />
    </cfif>

    <cfreturn result>
  </cffunction>

  <cffunction name="getUser">
    <cfargument name="id" type="numeric" />

    <cfset result = new model.beans.user() />

    <cfquery name="qry">
      SELECT id, login, firstname, lastname, description, level
      FROM users
      WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />
    </cfquery>

    <cfif qry.RecordCount GT 0>
        <cfset result.setID(qry.id) />
        <cfset result.setLogin(qry.login) />
        <cfset result.setFirstName(qry.firstname) />
        <cfset result.setLastName(qry.lastname) />
        <cfset result.setDescription(qry.description) />
        <cfset result.setLevel(qry.level) />
    </cfif>

    <cfreturn result>
  </cffunction>

    <cffunction  name="saveUser">
      <cfargument name="user" />
        <cfif actor.getId() EQ 0>
            <cfquery>
                INSERT INTO actor (first_name, last_name, last_update, active)
                VALUES (
                    <cfqueryparam value="#actor.getFirstname()#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#actor.getLastname()#" cfsqltype="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">,
                    <cfqueryparam value="#actor.getActive()#" cfsqltype="CF_SQL_INTEGER">
                )
            </cfquery>
        <cfelse>
            <cfquery name="qry">
                UPDATE actor SET
                    first_name = <cfqueryparam value="#actor.getFirstname()#" cfsqltype="CF_SQL_VARCHAR">,
                    last_name = <cfqueryparam value="#actor.getLastname()#" cfsqltype="CF_SQL_VARCHAR">,
                    last_update = <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">,
                    active=<cfqueryparam value="#actor.getActive()#" cfsqltype="CF_SQL_INTEGER">
                WHERE actor_id=<cfqueryparam value="#actor.getId()#" cfsqltype="CF_SQL_INTEGER">
            </cfquery>
        </cfif>
    </cffunction>

    <cffunction  name="deleteActor">
        <cfargument  name="id" type="numeric">
        <cfquery name="qry">
            UPDATE actor SET
            active = <cfqueryparam value="0" cfsqltype="CF_SQL_INTEGER">,
            last_update = <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">
            WHERE actor_id=<cfqueryparam value="#id#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
    </cffunction>

    <cffunction  name="searchActor">
        <cfargument  name="word" type="any">
        <cfset result=[]>
        <cfquery name="qry">
            SELECT * FROM actor
            WHERE first_name LIKE <cfqueryparam value="%#word#%" cfsqltype="CF_SQL_VARCHAR">
            or last_name LIKE <cfqueryparam value="%#word#%" cfsqltype="CF_SQL_VARCHAR">
            ORDER BY actor_id DESC LIMIT 10
        </cfquery>
        <cfloop query="qry">
            <cfset actor=new model.beans.actor()>
            <cfset actor.setid(qry.actor_id)>
            <cfset actor.setfirstname(qry.first_name)>
            <cfset actor.setlastname(qry.last_name)>
            <cfset actor.setupdated(qry.last_update)>
            <cfset actor.setactive(qry.active)>
            <cfset result.append(actor)>
        </cfloop>
        <cfreturn result>
    </cffunction>

</cfcomponent>