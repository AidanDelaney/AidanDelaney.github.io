% Programming your Pictures in R
% Aidan Delaney & Brent Yorgey
% [aidan@ontologyengineering.org](mailto:aidan@ontologyengineering.org) | [\@aidandelaney](http://www.twitter.com/aidandelaney) <br /> [yorgey@hendrix.edu](mailto:yorgey@hendrix.edu) | [https://byorgey.wordpress.com/](https://byorgey.wordpress.com)

# Introduction

## R History

## Grammar of Graphics

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

## R DataFrame

* Usually rows are the observations
* Columns are the variables
* Often (normally?) imported from a CSV or similar file.

```R
> mtcars$mpg
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
mtcars["gear",]

# by row
mtcars[,1]

# dataframe slice
mtcars[c("gear", "mpg")]
```

## BarChart

Let's plot the number of car models by their cylinder count.

```R
p <- ggplot(mtcars, aes(x=factor(cyl))) + geom_bar()
plot(p)
```

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

## PieChart

A piechart is a barchart with a single stacked bar

```R
pie <- ggplot(mtcars, aes(x = 1, fill = factor(cyl))) + geom_bar(width = 1)
```

Plotted on a different coordinate space i.e. polar.

```R
pie <- ggplot(mtcars, aes(x = 1, fill = factor(cyl))) + geom_bar(width = 1) + coord_polar(theta = "y")
```

## Polar BarChart

We can change the coordinate system of any plot.

```R
p <- ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(width = 1) + coord_polar()
```

## BoxPlot

```R
p <- ggplot(mtcars, aes(x=factor(cyl), y=mpg))
p + geom_boxplot()
```

## Histogram

## Short example

```R
ggplot(mtcars, aes(x=mpg, y=disp)) + geom_point()
ggplot(mtcars, aes(x=mpg, y=disp)) + geom_point() + geom_smooth()
ggplot(mtcars, aes(x=mpg, y=disp)) + geom_point() + geom_smooth() + coord_flip()
ggplot(mtcars, aes(x=mpg, y=disp)) + geom_point(aes(color=factor(am))) + geom_smooth() + coord_flip()
ggplot(mtcars, aes(disp,mpg)) + geom_point(aes(colour=factor(am))) + geom_smooth() + coord_flip() + facet_grid(gear ~ .)
```

# ggplot2 Grammar

## Overview

* Diagrams are built up in layers
* Each diagram has
    1. A _data_ layer,
    2. a _stat_istics layer,
    3. a _geom_etry layer,
    4. a _scale_s layer, and
    5. a theme layer.
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

## Scales

Adding a scale modifies the axes or:

```R
p + scale_fill_brewer()
```

## Aesthetics

Implementing many of Tufte's guidelines becomes:

```R
p + theme_minimal()
```

# Diagrams Diagrams

# Exploring ANOVA

## Hypothesis

> An Automatic transmission is better for miles per gallon

## Dependent Variable

In this case `mpg` is our dependent variable.

## Histogram

```R
ggplot(mtcars, aes(x=mpg)) +
  geom_histogram(binwidth=1)
```

## Hist & Normal

```R
ggplot(mtcars, aes(x=mpg)) +
  geom_histogram(aes(y = ..density..), binwidth=1) +
  stat_function(fun=dnorm,
                aes(colour = "red"),
                args = with(mtcars, c(mean = mean(mpg), sd = sd(mpg)))
                )
```


# Conclusion
