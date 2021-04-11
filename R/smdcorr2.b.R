# This file is a generated template, your changes will not be overwritten

smdcorr2Class <- if (requireNamespace('jmvcore', quietly=TRUE)) R6::R6Class(
    "smdcorr2Class",
    inherit = smdcorr2Base,
    private = list(

        .run = function() {
        # STOP IF EITHER DATA VALUE MISSING
            dep = self$options$dep
            ind = self$options$ind
            if ( is.null(dep) || is.null(ind) )
                return()
        # SEND DATA TO PLOTTING FUNCTION
            plotData <- self$data
            image <- self$results$plot
            image$setState(plotData)
        },

        .plot=function(image, ...) {

        # GET DATA
            dep = self$options$dep
            ind = self$options$ind
            if ( is.null(dep) || is.null(ind) ) return() # If missing either variable, do nothing
            d <- image$state
            v=colnames(d[,1:2])
        # GOOD TRICK
            #self$results$text$setContent(v) # Use to print things to Jamovi
        # GET VALUES
        # Manage datapoint visibility
            dt=self$options$dottype; if (dt=="dot") dottype="16" else dottype="1"
            color_dot=self$options$color_dot
            dotsize=as.numeric(self$options$dotsize); ss=dotsize; if (is.na(ss)) dotsize=30  else if (ss<1) dotsize=1 else if (ss>100) dotsize=100
            xjitter=as.numeric(self$options$xjitter); ss=xjitter; if (is.na(ss)) xjitter=0   else if (ss<0) xjitter=0 else if (ss>100) xjitter=100
            yjitter=as.numeric(self$options$yjitter); ss=yjitter; if (is.na(ss)) yjitter=0   else if (ss<0) yjitter=0 else if (ss>100) yjitter=100
            dotopac=as.numeric(self$options$dotopac); ss=dotopac; if (is.na(ss)) dotopac=100 else if (ss<0) dotopac=0 else if (ss>100) dotopac=100
        # Manage datapoint visibility
            spearman=self$options$spearman
        # Fit lines/curves
            lw=as.numeric(self$options$lw); ss=lw; if (is.na(ss)) lw=40 else if (ss<0) lw=0 else if (ss>100) lw=100
            lsline=self$options$lsline
            color1=self$options$color1
            polynomial=self$options$polynomial
            color2=self$options$color2
            polynomial_degree=as.numeric(self$options$polynomial_degree)
            spline=self$options$spline
            color3=self$options$color3
            spline_smoothness=as.numeric(self$options$spline_smoothness); ss=spline_smoothness; if (is.na(ss)) spline_smoothness=50 else if (ss<1) spline_smoothness=1 else if (ss>100) spline_smoothness=100
        # Tweak axes
            rug=self$options$rug
            xaxisrange=c(self$options$xmin,self$options$xmax)
            yaxisrange=c(self$options$ymin,self$options$ymax)
        # Adjust labels & plot size
            showstats=self$options$showstats
            graphtitle=self$options$graphtitle; if (graphtitle=="auto") graphtitle=""
            xvariablelabel=self$options$xvariablelabel; if (xvariablelabel=="auto") xvariablelabel=v[1]
            yvariablelabel=self$options$yvariablelabel; if (yvariablelabel=="auto") yvariablelabel=v[2]
            #plotwidth=self$options$plotwidth
            #plotheight=self$options$plotheight
        # Show residuals
            showresiduals=self$options$showresiduals

        # PROCESS DATA AND COMPUTE STATISTICS
        # Initial data processing
            if (spearman==TRUE) d=perc_rank(d) # Transform data into percentile ranks
            cc=complete.cases(d)
            d1=d[cc,];
            x=d1[,1]; y=d1[,2];
        # Jitter data percent of minimum difference between points for each column
            x1=jitter_by_percent_min_wn2(x,xjitter,ranked=spearman)
            y1=jitter_by_percent_min_wn2(y,yjitter,ranked=spearman)
        # Choose axis ranges
            ranges=equate_zscored_axis_ranges(d1,cushion=.1)
            xspan=ranges[1,2]-ranges[1,1]
            xlim=xaxisrange; ylim=yaxisrange;
            xlim=as.numeric(xlim); ylim=as.numeric(ylim);
            if(xaxisrange[1]=="auto" | is.na(xlim[1])) xlim[1]=ranges[1,1]
            if(xaxisrange[2]=="auto" | is.na(xlim[2])) xlim[2]=ranges[1,2]
            if(yaxisrange[1]=="auto" | is.na(ylim[1])) ylim[1]=ranges[2,1]
            if(yaxisrange[2]=="auto" | is.na(ylim[2])) ylim[2]=ranges[2,2]
        # Process label (omitted at present)
            v1=xvariablelabel#c("x label")#process_label(xvariablelabel,v[1]);
            xlabel=v1;
            v2=yvariablelabel#c("y label")#process_label(yvariablelabel,v[2]);
            ylabel=v2
            extra_margin=max(str_count(v1,"\n"),str_count(v2,"\n")) # max carriage returns in a label (to adjust plot margins)
        # Prepare data for download and plotting of residuals
            output=NA
            data2=d                                        # initiate data set to download using original data with all missing values
            xynames=c(v1,v2)                              # current name of x and y variables
            vnames=xynames                                # start a list of variable names, labeling the original data with the current axis labels
            if (lsline) {
                lslinemodel <- lm(y ~ poly(x,1))            # fit lsline model
                lslineresiduals=residuals(lslinemodel)      # compute residuals
                data2=cbind(data2,NA)                         # add NA column to downloadable data
                data2[cc,ncol(data2)]=lslineresiduals         # add lsline residuals to (original) data to download
                vnames=c(vnames,paste(xynames[2],"_ controlling for _ ",xynames[1],"_ via least-squares line")) # name lsline residuals
                lsline_rsq=round(1-((sd(lslineresiduals)^2)/(sd(y)^2)),2); # compute variance explained
                #output$lsline <- renderText(paste("least squares line = ", lsline_rsq, "<br>", sep="")) # generate text for variance explained
            } #else {output$lsline <- renderText(paste("", sep=""))}
            if (polynomial & length(unique(x))>polynomial_degree+2) { # poly requires a few more unique x data points than degree
                polynomialmodel <- lm(y ~ poly(x,polynomial_degree))         # fit polynomial model
                polynomialresiduals=residuals(polynomialmodel)                     # compute residuals of polynomial model
                data2=cbind(data2,NA)                                                # add NA column to downloadable data
                data2[cc,ncol(data2)]=polynomialresiduals                            # add polynomial residuals to (original) data to download
                vnames=c(vnames,paste(xynames[2],"_ controlling for _",xynames[1],"_ via polynomial of degree",polynomial_degree)) # name polynomial residuals
                polynomial_rsq=round(1-((sd(polynomialresiduals)^2)/(sd(y)^2)),2); # compute variance explained
                #output$polynomial <- renderText(paste("     polynomial = ", polynomial_rsq, "<br>", sep="")) # generate text for variance explained
            } #else {output$polynomial <- renderText(paste("", sep=""))}
            if (spline & length(unique(x))>4) {                           # if doing spline and x and y data both of reasonable length
                smoothingSpline = smooth.spline(x, y, spar=spline_smoothness/100) # fit spline model
                splineresiduals=residuals(smoothingSpline)                        # compute residuals of spline model
                data2=cbind(data2,NA)                                               # add NA column to downloadable data
                data2[cc,ncol(data2)]=splineresiduals                               # add polynomial residuals to (original) data to download
                vnames=c(vnames,paste(xynames[2],"_ controlling for _",xynames[1],"_ via spline with smoothness parameter (spar) of",spline_smoothness)) # name spline residuals
                spline_rsq=round(1-((sd(splineresiduals)^2)/(sd(y)^2)),2);        # compute variance explained
                #output$spline <- renderText(paste("     spline = ", spline_rsq, "<br>", sep="")) # generate text for variance explained
            } #else {output$spline <- renderText(paste("", sep=""))}
            colnames(data2)=vnames # put names in data file

        # Compute correlation and generate text to display (currently unused)
            r=round(cor(x,y),3)
            n=length(x)
            ci=round(CIr(r,n=n,level=.95),3)
            if(spearman==FALSE) {outputtext <- paste("r = ", r, ", n = ", n, ", 95% CI [", ci[1], ", ", ci[2], "]", sep=""); }#output$text=renderText(paste(outputtext,"<br>",sep=""))}
            if(spearman==TRUE) {outputtext <- paste("rho = ", r, ", n = ", n, ", 95% CI [", ci[1], ", ", ci[2], "]", sep=""); }#output$text=renderText(paste(outputtext,"<br>",sep=""))}

        # DRAW PLOT
            iscolor <- function(x) {tryCatch(is.matrix(col2rgb(x)), error = function(e) FALSE)}
            if (!iscolor(color_dot)) color_dot="black"
            if (lsline & !iscolor(color1)) color1="black"
            if (polynomial & !iscolor(color2)) color2="blue"
            if (spline & !iscolor(color3)) color3="red"
            c=col2rgb(color_dot)/255 # Find rgb for selected dot color
            #if(plotwidth == plotheight) dosquare=TRUE else dosquare=FALSE
            dosquare=TRUE
            makemyplot <- function(dosquare=TRUE) {
                if (dosquare) par(pty="s") # Forces the scatterplot to be square
                par(mar = c(5+extra_margin*2,4+extra_margin*2,4,2) + 0.1) # adjust default axis margin for multiline labels: par(mar = c(lower,left,top,right)) as par(mar = c(5,4,4,2) + 0.1)
                plot(x1, y1,
                     main=graphtitle, xlab="", ylab=ylabel, cex.main=3, cex.axis=1.5,   # title & axis labels & font sizes
                     xlim=xlim, ylim=ylim, frame=FALSE, cex.lab=2,                            # axis ranges & no frame
                     pch=as.numeric(dottype), cex=dotsize/20,                     # dot type and size
                     col=rgb(red=c[1], green=c[2], blue=c[3], alpha=dotopac/100)     # opacity
                )
                mtext(v1, side = 1, line = str_count(v1,"\n")*2+3, cex=2)
                if(lsline) {
                    abline(lm(y~x), col=color1, lwd=lw/10)                                                            # draws least-squares line
                    if (showresiduals) apply(cbind(x1,x1,y1,y1-lslineresiduals),1,function(coords){lines(coords[1:2],coords[3:4],col=color1)}) # plots lsline residual lines
                }
                if (polynomial & length(unique(x))>polynomial_degree+2 & length(unique(y))>1) { # poly requires a few more unique x data points than degree
                    t=cbind(x,y); t=t[order(t[,1]),]                                # create ordered x & y
                    model1 <- lm(t[,2] ~ poly(t[,1],polynomial_degree))       # fit model
                    z1 <- predict(model1)                                           # find the model predictions
                    lines(t[,1], z1, col=color2, lw=lw/10)              # draw model predictions
                    if (showresiduals) apply(cbind(x1,x1,y1,y1-polynomialresiduals),1,function(coords){lines(coords[1:2]+xspan/500,coords[3:4],col=color2)}) # plot polynomial residual lines
                }
                if (spline & length(unique(x))>4 & length(unique(y))>4) {
                    smoothingSpline = smooth.spline(x, y, spar=spline_smoothness/100)
                    lines(smoothingSpline,lw=lw/10,col=color3)
                    if (showresiduals) apply(cbind(x1,x1,y1,y1-splineresiduals),1,function(coords){lines(coords[1:2]-xspan/500,coords[3:4],col=color3)})     # plot spline residual lines
                }
                if (rug) {
                    rug(x1,side=1,quiet=TRUE,ticksize=.01); rug(y1,side=2,quiet=TRUE,ticksize=.01)
                }
                if (showstats) mtext(text=paste("     ",outputtext,sep=""), side=3, cex=1.25, adj=0, line=-1, font=2)
            }
            plot <- makemyplot(dosquare)
            print(plot)
            TRUE
        }
    )
)




