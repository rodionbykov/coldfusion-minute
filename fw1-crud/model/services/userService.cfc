<cfcomponent accessors="true">

  <cffunction name="getAll">
    <cfargument name="page" />
    <cfargument name="pagesize" />

    <cfif page gt 1>
      <cfset offset = (page-1) * pagesize />
    <cfelse>
      <cfset offset = 0 />
    </cfif>

    <cfset result=[] />

    <cfquery name="qry">
      SELECT id, login, firstname, lastname, description, level
      FROM users
      ORDER BY id
      LIMIT <cfqueryparam cfsqltype="cf_sql_integer" value="#offset#" />, <cfqueryparam cfsqltype="cf_sql_integer" value="#pagesize#" />
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

  <cffunction name="getCount">
    <cfargument name="searchterm" type="any" default="" />

    <cfset result = 0 />

    <cfquery name="qry">
      SELECT count(id) AS cnt
      FROM users
      <cfif Len(arguments.searchterm) gt 0>
      WHERE firstname LIKE <cfqueryparam value="%#searchterm#%" cfsqltype="cf_sql_varchar" />
        OR lastname LIKE <cfqueryparam value="%#searchterm#%" cfsqltype="cf_sql_varchar" />
      </cfif>
    </cfquery>
    <cfif qry.RecordCount gt 0>
      <cfset result = qry.cnt />
    </cfif>

    <cfreturn result>
  </cffunction>

  <cffunction name="new">
    <cfreturn new model.beans.user() />
  </cffunction>

  <cffunction name="get">
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

    <cffunction name="saveUser">
      <cfargument name="user" />

        <cfif user.getID() eq 0>
            <cfquery result="res">
                INSERT INTO users (login, firstname, lastname, description, level)
                VALUES (
                    <cfqueryparam value="#user.getLogin()#" cfsqltype="cf_sql_varchar" />,
                    <cfqueryparam value="#user.getFirstname()#" cfsqltype="cf_sql_varchar" />,
                    <cfqueryparam value="#user.getLastname()#" cfsqltype="cf_sql_varchar" />,
                    <cfqueryparam value="#user.getDescription()#" cfsqltype="cf_sql_varchar" />,
                    <cfqueryparam value="#user.getLevel()#" cfsqltype="cf_sql_integer" />
                )
            </cfquery>
            <cfset user.setID(res) />
        <cfelse>
            <cfquery name="qry">
                UPDATE users SET
                    login = <cfqueryparam value="#user.getLogin()#" cfsqltype="cf_sql_varchar" />,
                    firstname = <cfqueryparam value="#user.getFirstname()#" cfsqltype="cf_sql_varchar" />,
                    lastname = <cfqueryparam value="#user.getLastname()#" cfsqltype="cf_sql_varchar" />,
                    description = <cfqueryparam value="#user.getDescription()#" cfsqltype="cf_sql_varchar" />,
                    level = <cfqueryparam value="#user.getLevel()#" cfsqltype="cf_sql_integer" />
                WHERE id = <cfqueryparam value="#user.getID()#" cfsqltype="cf_sql_integer" />
            </cfquery>
        </cfif>
      
      <cfreturn user />
    </cffunction>

    <cffunction name="delete">
      <cfargument name="id" type="numeric" />

      <cfquery>
        DELETE FROM users
        WHERE id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer" />
      </cfquery>
    </cffunction>

    <cffunction name="find">
      <cfargument name="searchterm" />

      <cfset result = [] />
      
      <cfquery name="qry">
        SELECT id, login, firstname, lastname, description, level
        FROM users
        <cfif Len(arguments.searchterm) gt 0>
        WHERE firstname LIKE <cfqueryparam value="%#searchterm#%" cfsqltype="cf_sql_varchar" />
          OR lastname LIKE <cfqueryparam value="%#searchterm#%" cfsqltype="cf_sql_varchar" />
        </cfif>
        ORDER BY id
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

</cfcomponent>
