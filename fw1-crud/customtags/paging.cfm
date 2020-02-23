<cfset lastPage=attributes.lastPage>
<cfset currentPage=attributes.currentPage>
<cfset prevPage=currentPage-1>
<cfset nextPage=currentPage+1>

<cfset navigate=attributes.url & "&word=" & attributes.word>

<cfoutput> 
  <nav aria-label="...">
    <ul class="pagination">
      <li class="page-item <cfif currentPage EQ 1> disabled </cfif>">
        <a class="page-link" href="#navigate#&page=#prevPage#" tabindex="-1" aria-disabled="true">Previous</a>
      </li>
      <cfloop index="i" from="1" to="#lastPage#">
        <li class="page-item <cfif i EQ currentPage>active</cfif>">
            <a class="page-link" href="#navigate#&page=#i#">#i#</a>
        </li>
      </cfloop>
      <li class="page-item <cfif currentPage EQ lastPage> disabled </cfif>">
        <a class="page-link" href="#navigate#&page=#nextPage#">Next</a>
      </li>
    </ul>
  </nav>
</cfoutput>