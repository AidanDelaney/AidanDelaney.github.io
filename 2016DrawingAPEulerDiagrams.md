% Drawing Area Proportional Euler Diagrams
% Aidan Delaney
% <a href="mailto:aidan@ontologyengineering.org">aidan@ontologyengineering.org</a> | <a href="http://www.twitter.com/aidandelaney">\@aidandelaney</a>

# AP Euler Diagrams

## Previous Work

  * EulerAPE [@10.1371/journal.pone.0101717]
    - [3 Area proportional Ellipses](http://www.eulerdiagrams.org/eulerAPE/)
    - 71 cites _mostly_ bioinf.
  * Wilkinson [@wilkinson:eaaacvaed]
    - [Statistical model to draw Euler diagrams with circles](https://www.cs.uic.edu/~wilkinson/Publications/venneuler.pdf).
    - Defines a "stress" model and tries to minimise it.
    - 63 cites _mostly_ bioinf.
  * Example from yesterday's [Wall Street Journal](images/wsj.jpg)

## Our Contribution

  * "Standard" algorithms -- force directed graph layout [@eades:ahfgd].
  * Use a force model to attract/repel circle centres.
    - Hooke's law & Coulomb's law.
    - well understood optimisations, advantages and disadvantages.
  * Usable & __maintainable__ implementation.

##

![Force Directed Circles](images/force-directed-circles.svg){width=80%}

## Vennom

  * Implements the force directed layout algorithm.
  * Key-weakness #1 - calculates area by drawing a bitmap.
  * Key-weakness #2 - calculates forces in a pairwise manner.

## Bitmaps

![](images/zone-bitmap.svg){width=80%}

## Advantages

  * Computationally fast $O(n^2)$, if the bitmap is small.
  * Straightforward to implement.

## Disadvantages

  * Not perfectly accurate.
  * $O(n^2)$ grows poorly.
  * Optimisations cause some corner cases with "holes".

## Pairwise

![](images/pairwise-force-directed-circles.svg){width=70%}

## TODO

  * We need to add good area reporting to Vennom.
  * In about 5 slides time...
  * Need to compute forces is a concurrent manner.


# GNU R

## Prevalence

  * Use in Bioinformatics [@croucher:rpaolsorbwgsug, @page:sreeosfma].
  * [Little Book of Bioinformatics](https://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/)
  * Done well it will *significantly* improve impact.

## Example t-test

Paired t-test:
```r
before = c(12.9, 13.5, 12.8, 15.6, 17.2, 19.2, 12.6, 15.3, 14.4, 11.3)
after  = c(12.7, 13.6, 12.0, 15.2, 16.8, 20.0, 12.0, 15.9, 16.0, 11.1)

t.test(before, after, paired=TRUE)
```

## Example histogram

```r
before = c(12.9, 13.5, 12.8, 15.6, 17.2, 19.2, 12.6, 15.3, 14.4, 11.3)

pdf("myhistogram.pdf")
hist(before)
svg("myhistogram.svg")
hist(before)
```

## More Examples

![ggplot2 example](http://www.statmethods.net/advgraphs/images/ggplotdensity.png){width=200px}

  * See [http://www.statmethods.net/](http://www.statmethods.net/) for some good examples.
  * [ggplot2](http://ggplot2.org/) is an *extremely* powerful graphics library for R.
    - The ideas behind ggplot2 are similar to the motivation for the VMG; developing semantics for visualisations (or vice-versa).

## Exensible

  * There exists an "app-store" for R.
  * CRAN: *Comprehensive R Archive Network*.
  * Modelled on CPAN (from 1993!).
  * `ggplot2` and `venneuler` are distributed via CRAN.

## Using VennEuler

```r
library("venneuler")

vd <- venneuler(c(A=0.3, B=0.3, C=1.1, "A&B"=0.1, "A&C"=0.2, "B&C"=0.1 ,"A&B&C"=0.1))
plot(vd)
```

## EuleR wish?
```r
library("euleR")

ed <- euleR(c(A=0.3, B=0.3, C=1.1, "A&B"=0.1, "A&C"=0.2, "B&C"=0.1 ,"A&B&C"=0.1))
plot(ed)
```

Be source compatible!

# Requirements

##

  1. Source compatibility with venneuler.
  2. Distributable via CRAN.
  3. Calculate area more accurately than vennom.
  4. Be maintainable.

# Two Architectures

## Monolith

  * Use RJava -- vennom is written in Java.
  * Bundle vennom, area calculation and R-bridge as CRAN package.
  * Manually manage transitive dependencies

## Monolith

![euleR monolithic architecture](images/monolith.svg)

## Web Service

  * Require Internet connection.
  * Move R-bridge, vennom, area calculation an dependencies to cloud.
  * Allows _tracking_ or user requests.

## Web Service

![euleR cloud architecture](images/cloud.svg){height=80%}

# Area Calculation

## Problem

  * As discussed, the bitmap approach is inaccurate and doesn't scale ($O(n^2)$).
  * How to practically calculate the area of a concrete zone.

## Inkscape inspired

  * Represent all primitives as paths.
  * A path is a "sequence of symmetric power basis polynomials".
  * Calculating the intersection of two paths is straightforward.
    - Paths can be arbitrarily shaped -- fun for the future.
  * Somewhat inaccurate when representing circles (I'd like to quantify this).
  * Inkscape's area calculation is broken for some complex paths.

## s-basis area

![S-basis closed path](images/s-basis-area.svg){width=60%}

## JavaGeom

  * A geometry package for Java
  * Provides a `CircleArc2D`
    - we added `getChordArea()` and a few other things.
  * Implemented an area calculation for `BoundaryPolyCurve2D<CircleArc2D>`.

## Our Solution

  * Take an input concrete diagram.
  * Calculate the concrete Euler graph.
  * Split each circle into 'arcs' at the intersection points indicated by the Euler graph.
  * Represent each concrete zone as a `BoundaryPolyCurve2D<CircleArc2D>`.
  * Calculate the concrete inclusion hierarchy for concrete zones.

# Conclusion

## Examples

![Venneuler example](images/rand3-venneuler.svg){width=40%}
![Vennom example](images/rand3-vennom.svg){width=40%}

But we're __significantly__ faster.

## Development

  * The *supposed* hard bits were easy.
  * The *easy* bit -- area calculation -- is surprisingly involved.
  * The core vennom algorithm needs improvement.
  * Development -- i.e. impact -- is a full-time commitment.

## Bibliography
