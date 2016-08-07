% Programming your Pictures
% Aidan Delaney & Brent Yorgey
% [aidan@ontologyengineering.org](mailto:aidan@ontologyengineering.org) | [\@aidandelaney](http://www.twitter.com/aidandelaney) <br /> [yorgey@hendrix.edu](mailto:yorgey@hendrix.edu) | [https://byorgey.wordpress.com/](https://byorgey.wordpress.com)

# Introduction

## Programme

* Short introduction (10mins).
* Diagrams in R (60 mins) -- with some activities.
* Diagrams in Haskell (35 mins) -- with fewer activities.
* Conclusion (5 mins).

We'll find 10 mins for a comfort break at an appropriate time.

## <span style="color:#ffffff">About Aidan</span> {data-background='images/royal-pavilion-brighton.jpg' }

* <span style="color:#ffffff">Member of Diagrams Steering Comittee.</span>
* <span style="color:#ffffff">Researcher in Visual Languages and Visual Reasoning.</span>
* <span style="color:#ffffff">Shipped code in Haskell, C, Java, Perl, Python, C++, JavaScript & others.</span>
* <span style="color:#ffffff">Director of an Eastbourne not-for-profit [__TechResort__](http://techresort.co.uk/).</span>
* <span style="color:#ffffff">Involved with BCS Computing at School project for a while.</span>

## Takeaways

1. Declarative drawing of diagrams allows separation of concerns.
2. Declarative drawing assists in rapid prototyping of visualisation.

## Assumptions

* You don't know any R.
* You don't know any Haskell.
* You like Diagrams.

## Prerequisites

* You have [RStudio](https://www.rstudio.com/) installed to follow the R examples.
    - available on USB disk.
* You're using [Stack](http://docs.haskellstack.org/en/stable/README/) to follow Haskell examples.
    - this is a huge download and I've structured the tutorial to work without it too.

## Caveats

* I am not a statistician (though I'm improving):
    - I'm a diagrams person who has to provide visualisation support to some data scientists.
* If my statistical examples are incorrect it's because my focus is on the visualisation:
    - Though I'd appreciate a heads-up on any glaring errors.

## Notation

An R source code listing should look like:
```R
mydata <- c(1, 4, 8)
```

A Haskell source code listing should look like:
```Haskell
qsort :: [Int] -> [Int]
qsort x:xs = (filter (<x) xs) ++ [x] ++ (filter (>x) xs)
```

Any executed commands will be provided in Unix shell:
```sh
$ ./executeme --with-option 7
```

## My Code

The slides (and question sheets) are available at [http://aidandelaney.github.io/](http://aidandelaney.github.io/).

# References
