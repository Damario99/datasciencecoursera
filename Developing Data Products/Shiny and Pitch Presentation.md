Shiny and Pitch Presentation
========================================================
author: 
date: 20/01/2022
autosize: true

Second Slide
========================================================
Will create a Shiny application and deploy it on Rstudio's servers. Also will use Rstudio Presenter to prepare a reproducible pitch presentation about the application.

Shiny Application Must Include:

-Write a shiny application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application.

-Deploy the application on Rstudio's shiny server

-Share the application link by pasting it into the provided text box

-Share your server.R and ui.R code on github

Third Slide
========================================================

Presentation Must Include:

-It must be done in Slidify or Rstudio Presenter

-It must be 5 pages

-It must be hosted on github or Rpubs

-It must contained some embedded R code that gets run when slidifying the document

Fourth Slide
========================================================

For the shiny link see: <https://bash99.shinyapps.io/FinalProject/>.

For the github link see: <https://github.com/Damario99/datasciencecoursera/tree/main/Developing%20Data%20Products/FinalProject>

Fifth Slide
========================================================


```r
library(vioplot)
x1 <- mtcars$mpg[mtcars$cyl==4]
x2 <- mtcars$mpg[mtcars$cyl==6]
x3 <- mtcars$mpg[mtcars$cyl==8]
vioplot(x1, x2, x3, names=c("4 cyl", "6 cyl", "8 cyl"),
   col="gold")
title("Violin Plots of MPG")
```

![plot of chunk unnamed-chunk-1](Shiny and Pitch Presentation-figure/unnamed-chunk-1-1.png)
