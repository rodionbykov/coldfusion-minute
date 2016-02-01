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
                <h2 class="post-title">
                   Comments
                </h2>
                <cfloop array="#comments#" index="c">
                <div class="post-preview">
                    #c.getBody()#
                    <p class="post-meta">Comment by <a href="index.cfm?route=author&amp;id=#c.getAuthor().getID()#">#c.getAuthor().getFirstName()# #c.getAuthor().getLastName()#</a>
                                         for <a href="index.cfm?route=post&amp;id=#c.getPost().getID()#">#c.getPost().getTitle()#</a>
                                         on #DateFormat(c.getMoment(), "long")#
                    </p>
                </div>
                <hr>
                </cfloop>
            </div>
        </div>
    </div>
</cfoutput>