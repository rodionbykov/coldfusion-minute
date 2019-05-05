<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- this is HTML commentary, it will be sent to browser, but not displayed -->
    <title>Thirds template example: template includes other template -- Lucee Minute</title>
  </head>
  <body>
    <!--- this is CFML commentary, it will be excluded from output by Lucee engine --->
    <h1>Hello from CFML template!</h1>
    <h2>This is plain HTML</h2>
    <p>&lt;CFINCLUDE&gt; tag allows to include one template from another template.
    
    <cfinclude template="someothertemplate.cfm" />

  </body>
</html>