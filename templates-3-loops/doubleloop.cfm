<cfset dimension = 25 />

<cfoutput>
<!doctype html>
<html lang="ru-PL">
    <head>
        <title>Pythagorean Table</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    <body>
        <h2>Pythagorean Table</h2>
        <table class="table table-striped table-bordered table-condensed">
            <thead>
                <tr>
                    <th>&nbsp;</th>
                    <cfloop from="1" to="#dimension#" index="i">
                    <th>
                        #i#
                    </th>
                    </cfloop>
                </tr>
            </thead>
            <tbody>
                <cfloop from="1" to="#dimension#" index="i">
                    <tr>
                        <th>#i#</th>
                        <cfloop from="1" to="#dimension#" index="j">
                            <td>#i*j#</td>
                        </cfloop>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    </body>
</html>
</cfoutput>