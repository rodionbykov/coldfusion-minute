<cfset arrURLs = [
    'https://www.theguardian.com/international',
    'https://www.independent.co.uk/',
    'https://www.thetimes.co.uk/',
    'https://www.thesun.co.uk/'
] />

<cfloop array="#arrURLs#" item="aURL">
    <cfhttp url="#aURL#" result="result" />
    <cfset f = reFindNoCase("<title>([^<>/]+)<\/title>", result.filecontent, 1, true) />
    <cfset title = Mid(result.filecontent, f.pos[2], f.len[2]) />
    <cfdump var="#aURL#" label="Page URL" />
    <cfdump var="#title#" label="Page title" />
    <br /><br />
</cfloop>
