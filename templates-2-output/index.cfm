<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- this is HTML commentary, it will be sent to browser, but not displayed -->
    <title>Second template example: dynamic output -- Lucee Minute</title>
  </head>
  <body>
    <!--- this is CFML commentary, it will be excluded from output by Lucee engine --->
    <h1>Hello from CFML template!</h1>
    <h2>This is plain HTML</h2>
    <p>Any CFML or CFScript be put between &lt;CF*&gt; tag, e.g. &lt;CFOUTPUT&gt; tags, will be processed by Lucee engine:</p>
    <p>Expressions or function calls must be put between ##'s to be evaluated.</p>
    <h3>Example function call</h3>
    <p>Current date: &lt;CFOUTPUT&gt;#DateFormat(Now(), "long")#&lt;/CFOUTPUT&gt;</p> 
    <p>Lucee dynamic output is below:</p>
    <p>Current date: <cfoutput>Current date #DateFormat(Now(), "long")#.</cfoutput></p>
    <h3>Example math expression</h3>
    <p>&lt;CFOUTPUT&gt;2x2=#2*2#&lt;/CFOUTPUT&gt;</p> 
    <p>Lucee dynamic output is below:</p>
    <p><cfoutput>2x2=#2*2#</cfoutput></p>
  </body>
</html>