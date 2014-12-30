## how does a plot get created?

## the first approach
library(datasets)
with(faithful, plot(eruptions, waiting))  ## make plot appear on screen device
title(main = "Old Faithful Geyser data")  ## annotate with a title

## the second approach
pdf(file = "myplot.pdf")  ## open PDF device; create 'myplot.pdf' in my working directory
## create plot and send to a file (no plot appears on screen)
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")  ## annotate plot; still nothing in screen
dev.off()  ## Close the PDF file device
## Now you can view the file 'myplot.pdf' on your computer

## copying plots
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")
dev.copy(png, file = "geyserplot.png")
dev.off()
