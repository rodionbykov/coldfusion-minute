<cfoutput>

    <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-image: url('views/img/home-bg.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="site-heading">
                        <h1>Lucee Blog</h1>
                        <hr class="small">
                        <span class="subheading">Blog powered by Lucee and ORM</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <cfloop array="#authors#" index="a">
                <div class="post-preview">
                    <a href="index.cfm?route=author&amp;id=#a.getID()#">
                        <h2 class="post-title">
                            #a.getFirstName()# #a.getLastName()#
                        </h2>
                        <cfif Len(a.getDescription())>
                        <h3 class="post-subtitle">
                            #a.getDescription()#
                        </h3>
                        </cfif>
                    </a>
                </div>
                <hr>
                </cfloop>
            </div>
        </div>
    </div>
</cfoutput>