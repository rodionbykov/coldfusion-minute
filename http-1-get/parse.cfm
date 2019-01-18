<cfset arrURLs = [
    'https://www.theguardian.com/international',
    'https://www.independent.co.uk/'
] />

<cfloop array="#arrURLs#" item="url">
    <cfhttp url="#url#" result="result" />
    <cfoutput>#result.filecontent#</cfoutput>
</cfloop>

<cfdump var="#cfhttp#" />