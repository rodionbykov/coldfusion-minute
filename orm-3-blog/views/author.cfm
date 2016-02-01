<cfoutput>

    <!-- Page Header -->
    <!-- Set your background image for this header on the line below. -->
    <header class="intro-header" style="background-image: url('views/img/about-bg.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <div class="page-heading">
                        <h1>#author.getFirstName()# #author.getLastName()#</h1>
                        <hr class="small">
                        <span class="subheading">#author.getDescription()#</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <cfloop array="#author.getPosts()#" index="p">
                <div class="post-preview">
                    <a href="index.cfm?route=post&amp;id=#p.getID()#">
                        <h2 class="post-title">
                            #p.getTitle()#
                        </h2>
                        <cfif Len(p.getSubTitle())>
                        <h3 class="post-subtitle">
                            #p.getSubTitle()#
                        </h3>
                        </cfif>
                    </a>
                    <p class="post-meta">Posted by <a href="index.cfm?route=author&amp;id=#p.getAuthor().getID()#">#p.getAuthor().getFirstName()# #p.getAuthor().getLastName()#</a> on #DateFormat(p.getMoment(), "long")#</p>
                </div>
                <hr>
                </cfloop>
            </div>
        </div>
    </div>

    <hr>
</cfoutput>