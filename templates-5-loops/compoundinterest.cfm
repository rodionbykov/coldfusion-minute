<!--- in Futurama S01E06 'A Fishful of Dollars' Fry has $0.93 on bank account in 2000, making $4.3b in year 3000 --->

<cfset date = "2000-01-01" />
<cfset principal = 0.93 />
<cfset interest = 2.25 />
<cfset amount = principal * interest / 100 />
<cfoutput>
  <h1>Fry's Savings Account (#interest#% compound interest)</h1>
  <table width="50%" border="1">
  <cfloop index="i" from="1" to="1001">
    <tr>
    <td>Date: #DateFormat(date, "dd/mm/YYYY")#</td><td>Principal: #lsCurrencyFormat(principal)#</td><td>Amount: #lsCurrencyFormat(amount)#</td>
    </tr>

    <cfset date = DateAdd("yyyy", 1, date) />
    <cfset amount = principal * interest / 100 />
    <cfset principal = principal + amount/>
  </cfloop>
  </table>
</cfoutput>
