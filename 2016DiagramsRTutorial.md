% Programming your Pictures in R
% Aidan Delaney & Brent Yorgey
% [aidan@ontologyengineering.org](mailto:aidan@ontologyengineering.org) | [\@aidandelaney](http://www.twitter.com/aidandelaney) <br /> [yorgey@hendrix.edu](mailto:yorgey@hendrix.edu) | [https://byorgey.wordpress.com/](https://byorgey.wordpress.com)

# Motivation

## Bioinformatics

![images/F2.large.jpg](images/F2.large.jpg)

<aside class="notes">
* I first came across R working on a bioinformatics project.
* A de-facto standard for repeatable statistical tests:
    - available to *all* researchers.
* [Microsoft R Open](https://mran.revolutionanalytics.com/).
* Becoming a de-facto standard for data science.
</aside>

## Repeatability

* Fits into repeatable workflows: see [Taverna](https://taverna.incubator.apache.org/).
* Is a programming language, so:
    - supports standard software development processes such as source control eg: [euleR](https://github.com/aidandelaney/euleR).
    - component reuse
    - testing

## Takeaways

1. Declarative drawing of diagrams allows separation of concerns.
2. Declarative drawing assists in rapid prototyping of visualisation.

# Introduction

## R History

* Based on S, developed by John Chambers [@chambers:s].
* Developed by Ross Ihaka and Robert Gentleman at University of Auckland [@ihaka:r].
* 30 year old(ish) interpreted language for statistical computation.
* Well established
    - graphical IDE: [RStudio](https://www.rstudio.com/).
    - third party packages: [CRAN](https://cran.r-project.org/).
    - stewardship: [R Foundation](https://www.r-project.org/foundation/), [useR! conference](https://www.r-project.org/conferences.html).

<aside class="notes">
* https://en.wikipedia.org/wiki/Comparison_of_statistical_packages
</aside>

## GG

* Leyland Wilkinson developed the _Grammar of Graphics_ [@wilkinson:gg].
* R impementation by Hadley Wickham in 2005 [@wickham:ggplot]
    - [Cheat Sheet](https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf).

<aside class="notes">
> Statistical graphic specifications are expressed in six statements
>
> 1. DATA: a set of data operations that create variables from datasets
> 2. TRANS: variable transformations
> 3. SCALE: scale transformations
> 4. COORD: a coordinate system
> 5. ELEMENT: graphs and their aesthetic attributes
> 6. GUIDE: one or more guides
</aside>

# First Steps

## R DataFrame

|                   | mpg  | cyl   |  disp | am   | gear |
|-------------------|------|-------|-------|------|---|
| Mazda RX4         | 21   | 6     | 160   | 1    | 4 |
| Mazda RX4 Wag     | 21   | 6     | 160   | 1    | 4 |
| Datsun 710        | 22.8 | 4     | 108   | 1    | 4 |
| Hornet 4 Drive    | 21.4 | 6     | 258   | 0    | 3 |
| Hornet Sportabout | 18.7 | 8     | 360   | 0    | 3 |
| Valiant           | 18.1 | 6     | 225   | 0    | 3 |
| Duster 360        | 14.3 | 8     | 360   | 0    | 3 |

<aside class="notes">
```R
View(mtcars)
```
</aside>

## R DataFrame

* Usually rows are the observations
* Columns are the variables
* Often (normally?) imported from a CSV or similar file.

```R
mtcars$mpg
```

Returns a vector of the values of the `mpg` variable in top-to-bottom row order.

## Importing data

For a comma separated values file you can simply

```R
mydata <- read.csv("patterns.csv")
```

Import functions exist for Excel

```R
library(xlsx)
mydata <- read.xlsx("patterns.xlsx", sheetName = "all-data")
```

and SPSS, SAS and several other file formats.

## DataFrame "Queries"

We can get dataframe information by column, row or create a _slice_.

```R
# by column
mtcars$gear
mtcars[,"gear"]

# by row
mtcars[1,]
mtcars["Fiat 128",]

# dataframe slice
mtcars[c("gear", "mpg")]
```

# Simple Charts

## Types

* bar chart
* point chart
* line chart
* box & whisker chart
* histogram

## BarChart

Let's plot the number of car models by their cylinder count.

```R
p <- ggplot(mtcars, aes(x=factor(cyl))) + geom_bar()
plot(p)
```

Will plot the count of cars that share a certain cylinder count.

## Point Chart

Let's plot the number of car models by their cylinder count.

```R
p <- ggplot(mtcars, aes(x=factor(cyl), y=mpg)) + geom_point()
plot(p)
```

Requires both `x` and `y` aesthetics.

## Line Chart

Let's plot the number of car models by their cylinder count.

```R
p <- ggplot(mtcars, aes(x=wt, y=mpg)) + geom_line()
plot(p)
```

## BoxPlot

```R
p <- ggplot(mtcars, aes(x=factor(cyl), y=mpg))
p + geom_boxplot()
```

## Histogram

```R
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth=1)
```

# Complex Diagrams

## PieChart

A piechart is a barchart with a single stacked bar

```R
pie <- ggplot(mtcars, aes(x = 1, fill = factor(cyl))) + geom_bar(position="stack")
```

Plotted on a different coordinate space i.e. polar.

```R
pie <- ggplot(mtcars, aes(x = 1, fill = factor(cyl))) + geom_bar(position="stack") + coord_polar(theta = "y")
```

## Histogram

Plot a histogram with an overlaid normal distribution:

```R

ggplot(mtcars, aes(x=mpg)) +
  geom_histogram(aes(y = ..density..), binwidth=1) +
  stat_function(fun=dnorm,
                aes(colour = "red"),
                args = with(mtcars, c(mean = mean(mpg), sd = sd(mpg)))
                ) +
  labs(x="Miles per gallon", legend.position = "bottom", legend.direction = "horizontal")
```

## Complex BarChart

Or similarly, let's use mean `mpg` as our `y` _aesthetic_. First we have to reshape our data.

```R
require(ggplot2)
require(reshape2)

plot.data <- melt(tapply(mtcars$mpg, factor(mtcars$cyl),mean), varnames="cyl", value.name="mean")
ggplot(plot.data, aes(x=factor(cyl),y=mean)) + geom_bar(stat="identity")
```

Or

```R
ggplot(mtcars, aes(y=mpg, x=factor(cyl), group=factor(cyl))) + stat_summary(fun.y=mean, geom="bar")
```

## Short example

```R
ggplot(mtcars, aes(x=mpg, y=disp)) + geom_point()
ggplot(mtcars, aes(x=mpg, y=disp)) + geom_point() + geom_smooth()
ggplot(mtcars, aes(x=mpg, y=disp)) + geom_point() + geom_smooth() + coord_flip()
ggplot(mtcars, aes(x=mpg, y=disp)) + geom_point(aes(color=factor(am))) + geom_smooth() + coord_flip()

ggplot(mtcars, aes(x=mpg, y=disp)) + geom_point(aes(color=factor(am))) + stat_smooth(method="lm") + coord_flip()
```

## Reusable Function

```R
ggplotRegression <- function (fit) {

ggplot(fit$model, aes_string(x = names(fit$model)[2], y = names(fit$model)[1])) +
  geom_point() +
  stat_smooth(method = "lm", col = "red") +
  labs(title = paste("Adj R2 = ",signif(summary(fit)$adj.r.squared, 5),
                     "Intercept =",signif(fit$coef[[1]],5 ),
                     " Slope =",signif(fit$coef[[2]], 5),
                     " P =",signif(summary(fit)$coef[2,4], 5)))
}

fit <- lm(mpg~disp, data=mtcars)
ggplotRegression(fit)

<aside class="notes">
* Taken from [https://susanejohnston.wordpress.com/2012/08/09/a-quick-and-easy-function-to-plot-lm-results-in-r/](https://susanejohnston.wordpress.com/2012/08/09/a-quick-and-easy-function-to-plot-lm-results-in-r/)
</aside>
```

# ggplot2 Grammar

## Overview

* Diagrams are built up in layers
* Each diagram has
    1. A _data_ layer,
    2. a _stat_ istics layer,
    3. a _geom_ etry layer,
    4. a _scale_ layer, and
    5. a _theme_ layer.
* We can write `ggplot(mtcars, aes(x=mpg, y=disp)) + geom_point()` because of /sane defaults/.

## Data

* Must be in a data frame.
* We map data columns to _aes_thetics.
    - generally _x_ is required
    - _color_ can be useful
    - _y_ is required by some

```R
> p <- ggplot(mtcars, aes(x=cyl))
> summary(p)
data: mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb, x [32x12]
mapping:  x = cyl
faceting: facet_null()
```

## Statistics

We can add `count` as a statistic layer to our plot

```R
> q <- p + stat_count()
> summary(q)
data: mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb, x [32x12]
mapping:  x = cyl
faceting: facet_null()
-----------------------------------
geom_bar: na.rm = FALSE, width = NULL
stat_count: na.rm = FALSE, width = NULL
position_stack
```

## Geometry

We can choose a geometry to combine with our data and statistic:

```R
> q <- p + geom_bar()
> summary(q)
data: mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb, x [32x12]
mapping:  x = cyl
faceting: facet_null()
-----------------------------------
geom_bar: na.rm = FALSE, width = NULL
stat_count: na.rm = FALSE, width = NULL
position_stack
```

We've made no difference yet, as adding `stat_count` gives a default of `geom_bar`.

## Geom Summary

```R
df <- data.frame(
  x = c(3, 1, 5),
  y = c(2, 4, 6),
  label = c("a","b","c")
)
p <- ggplot(df, aes(x, y, label = label)) + xlab(NULL) + ylab(NULL)
p + geom_point() + labs(title = "geom_point")
p + geom_bar(stat="identity") + labs(title = "geom_bar(stat=\"identity\")")
p + geom_line() + labs(title = "geom_line")
p + geom_area() + labs(title = "geom_area")
p + geom_path() + labs(title = "geom_path")
p + geom_text() + labs(title = "geom_text")
p + geom_tile() + labs(title = "geom_tile")
p + geom_polygon() + labs(title = "geom_polygon")
```

The "cheat sheet" has many more types.

## Scales

Adding a scale modifies the axes or:

```R
p + scale_fill_brewer()
```

## Aesthetics

Implementing many of Tufte's guidelines becomes:

```R
p + geom_bar(stat="identity") + labs(title = "geom_bar(stat=\"identity\")") + theme_minimal()
p + geom_bar(stat="identity") + labs(title = "geom_bar(stat=\"identity\")") + theme_bw()
```

or my favourite

```R
p + xkcdrect(
+     aes(xmin = x, xmax = x+1, ymin = 0, ymax = y),
+     df
+ ) + theme_xkcd()
```

# Conclusion

* The _Grammar of Graphics_ provides power and flexibility for generating statistical plots.
* Statistical visualisations can be mixed with Anova and other tests.
* The statistical "Diagrams of Diagrams" are generally straightforward to draw using `ggplot2`.

## Takeaways

1. Declarative drawing of diagrams allows separation of concerns.
2. Declarative drawing assists in rapid prototyping of visualisation.

## Exercises

There are three exercises for you to tackle, available at [http://aidandelaney.github.io/handouts/2016DiagramsRTutorial-questions.pdf](http://aidandelaney.github.io/handouts/2016DiagramsRTutorial-questions.pdf).
