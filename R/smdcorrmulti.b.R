# This file is a generated template, your changes will not be overwritten

smdcorrmultiClass <- if (requireNamespace('jmvcore', quietly=TRUE)) R6::R6Class(
    "smdcorrmultiClass",
    inherit = smdcorrmultiBase,
    private = list(

        .run = function() {
            # STOP IF EITHER DATA VALUE MISSING
            if (is.null(self$options$vars) | length(self$options$vars)==1)
                return()
            # SEND DATA TO PLOTTING FUNCTION
            plotData <- self$data
            image <- self$results$plot
            image$setState(plotData)
        },

        .plot=function(image, ...) {

        # GET DATA
            if (is.null(self$options$vars) | length(self$options$vars)==1)
                return()
            t <- image$state
            v=colnames(t)
        # GOOD TRICK
            #self$results$text$setContent(t) # Use to print things to Jamovi
        # GET VALUES
        # Manage datapoint visibility
            dt=self$options$dottype; if (dt=="dot") dottype="16" else dottype="1"
            #color_dot=self$options$color_dot
            dotsize=as.numeric(self$options$dotsize); ss=dotsize; if (is.na(ss)) dotsize=30  else if (ss<1) dotsize=1 else if (ss>100) dotsize=100
            # xjitter=as.numeric(self$options$xjitter); ss=xjitter; if (is.na(ss)) xjitter=0   else if (ss<0) xjitter=0 else if (ss>100) xjitter=100
            # yjitter=as.numeric(self$options$yjitter); ss=yjitter; if (is.na(ss)) yjitter=0   else if (ss<0) yjitter=0 else if (ss>100) yjitter=100
            jitter_perc=as.numeric(self$options$jitter_perc); ss=jitter_perc; if (is.na(ss)) jitter_perc=0 else if (ss<0) jitter_perc=0 else if (ss>100) jitter_perc=100
            dotopac=as.numeric(self$options$dotopac); ss=dotopac; if (is.na(ss)) dotopac=100 else if (ss<0) dotopac=0 else if (ss>100) dotopac=100
        # Manage datapoint visibility
            spearman=self$options$spearman
        # Show stats/data/colors
            upper=self$options$upper
            lower=self$options$lower
            tint=self$options$tint
            color1=self$options$color1
            tint2=self$options$tint2
            color2=self$options$color2
        # Fit lines/curves
            lw=as.numeric(self$options$lw); ss=lw; if (is.na(ss)) lw=25 else if (ss<0) lw=0 else if (ss>100) lw=100
            fit=self$options$fit
            smoothness=as.numeric(self$options$smoothness); ss=smoothness; if (is.na(ss)) smoothness=25 else if (ss<0) smoothness=0 else if (ss>100) smoothness=100
            digits=as.numeric(self$options$digits)
            # lw=as.numeric(self$options$lw); ss=lw; if (is.na(ss)) lw=40 else if (ss<0) lw=0 else if (ss>100) lw=100
            # lsline=self$options$lsline
            # color1=self$options$color1
            # polynomial=self$options$polynomial
            # color2=self$options$color2
            # polynomial_degree=as.numeric(self$options$polynomial_degree)
            # spline=self$options$spline
            # color3=self$options$color3
            # spline_smoothness=as.numeric(self$options$spline_smoothness); ss=spline_smoothness; if (is.na(ss)) spline_smoothness=50 else if (ss<1) spline_smoothness=1 else if (ss>100) spline_smoothness=100
        # Tweak axes
            equateaxes=self$options$equateaxes
            axisranges=as.numeric(c(self$options$axesmin,self$options$axesmax))
            # rug=self$options$rug
            # xaxisrange=c(self$options$xmin,self$options$xmax)
            # yaxisrange=c(self$options$ymin,self$options$ymax)
        # Adjust labels & plot size
            #showstats=self$options$showstats
            graphtitle=self$options$graphtitle; if (graphtitle=="auto") graphtitle=""
            variablelabels=self$options$variablelabels; if (variablelabels=="auto") variablelabels=v[1]
            ticklabelsize=as.numeric(self$options$ticklabelsize); ss=ticklabelsize; if (is.na(ss)) ticklabelsize=30  else if (ss<1) ticklabelsize=1 else if (ss>100) ticklabelsize=100
            #yvariablelabel=self$options$yvariablelabel; if (yvariablelabel=="auto") yvariablelabel=v[2]
            #plotwidth=self$options$plotwidth
            #plotheight=self$options$plotheight
        # Show residuals
            # showresiduals=self$options$showresiduals

        # PROCESS DATA AND COMPUTE STATISTICS
        # Transform data into percentile ranks
            if (spearman==TRUE) t=perc_rank(t)
        # Figure out max correlation
            tintcors=cor(t, use = "pairwise.complete.obs");
            diag(tintcors) = NA
            maxtintcorr = max(abs(tintcors), na.rm = TRUE)
            # Jitter data percent of minimum difference between points for each column
            t1=jitter_by_percent_min(t,jitter_perc,spearman)
            # Get variable labels
            if(variablelabels=="") colnames(t)=v
            else {
                rng=variablelabels
                rng=unlist(strsplit(rng,","))
                if (length(rng) < length(v)) {
                    rng2=rng
                    rng2[(length(rng)+1):length(v)]=v[(length(rng)+1):length(v)]
                }
                else {
                    rng2=rng[1:length(v)]
                }
                colnames(t)=rng2
            }
        # Choose axis ranges (if typed range is neither default nor non-numeric, then )
            ranges=equate_zscored_axis_ranges2(t, cushion=.1, equate=equateaxes, range=axisranges) # Could in very rare cases be cutting off data points
            nc=ncol(t) # find number of columns
            xlim=array(0,c(nc,nc,2)); ylim=array(0,c(nc,nc,2));
            for (i in 1:ncol(t)) { # for each column of graphs
                for (j in 1:ncol(t)) { # for each graph in this column of graphs
                    xlim[j,i,]=ranges[j,] # set the x range
                    ylim[j,i,]=ranges[i,] # set the y range
                }
            }
        # DRAW PLOT
            # Draw the scatterplot
            if(tint==FALSE) {tintcolor=rgb(1,1,1); tintcolor2=rgb(1,1,1); dotint=0} else if (tint2==FALSE) {tintcolor=color1; tintcolor2=rgb(1,1,1); dotint=1} else {tintcolor=color1; tintcolor2=color2; dotint=2}
            if(fit=="line") p="my_line" else if (fit=="curve") p="my_curve" else if (fit=="both") p="my_lineandcurve" else if (fit=="none") p="my_points"
            if(upper=="stats") u="panel_cor2" else if (upper=="data") u=p else if (upper=="neither") u=NULL
            if(lower=="stats") l="panel_cor2" else if (lower=="data") l=p else if (lower=="neither") l=NULL
            ticks=c(FALSE,FALSE); if(lower=="data") ticks[1]=TRUE; if(upper=="data") ticks[2]=TRUE;
            adj=(ticklabelsize+10)/39 # a hack to adjust the bottom tick labels to match the left tick labels as they get bigger & smaller
            makemyplot <- function() {
                par(pty="s")
                pairs2(t, panel=p, cex.axis=(ticklabelsize+1)/25, adj=adj,
                       upper.panel=u, lower.panel=l, xlim=xlim, ylim=ylim, jdata=t1,
                       pch=as.numeric(dottype), cex=dotsize/20, sp=spearman,
                       col=rgb(red=0.0, green=0.0, blue=0.0, alpha=dotopac/100),
                       main=graphtitle, cex.main=3, lw=lw/10, smoothness=smoothness/100,
                       digits=digits, perc_rank=spearman, ticks=ticks,
                       dotint=dotint, panelcolor=tintcolor, panelcolor2=tintcolor2, tintmaxcorr=maxtintcorr)
            }
            plot <- makemyplot()
            print(plot)
            TRUE
        }
    )
)
