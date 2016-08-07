% Programming your Pictures in Haskell
% Aidan Delaney & Brent Yorgey
% [aidan@ontologyengineering.org](mailto:aidan@ontologyengineering.org) | [\@aidandelaney](http://www.twitter.com/aidandelaney) <br /> [yorgey@hendrix.edu](mailto:yorgey@hendrix.edu) | [https://byorgey.wordpress.com/](https://byorgey.wordpress.com)

# Introduction

## DSL

* Diagrams is a Domain Specific Language
* Uses many _combinators_ to compose diagrams.
* Layout is handled in horizontal and vertical boxes
    - similar to GTK
* [Excellent documentation](http://projects.haskell.org/diagrams/doc/quickstart.html)

##  Wide usage
* [Weaving a Torus](http://mathr.co.uk/blog/2013-04-05_weaving_a_torus.html)
* [Parking Maps](https://idontgetoutmuch.wordpress.com/2013/10/23/parking-in-westminster-an-analysis-in-haskell/)
* [System event visualisation](http://www.well-typed.com/blog/86/)
* [Maze Creation](http://www.corentindupont.info/blog/posts/2014-02-17-Cretan-Maze.html)
* [Puzzle Generation](https://maybepuzzles.wordpress.com/2014/04/07/drawing-puzzles-with-the-haskell-diagrams-framework/)
* [Data Type Documentation](https://readerunner.wordpress.com/2014/04/29/red-black-neighbourhood-stencil-diagrams/)
* [Tree Visualization](https://martingalemeasure.wordpress.com/2014/07/07/haskell-numeric-types-quick-reference/)

## Usage
Particularly useful for programmatic generation of large numbers of diagrams.  For instance [Bracelets](https://byorgey.wordpress.com/2015/07/10/the-species-of-bracelets/).  Backends exist for SVG, PNG, PDF, HTML 5 canvas and GTK.

![https://byorgey.files.wordpress.com/2015/07/9bf376e5e3d8e6ab.png?w=640](https://byorgey.files.wordpress.com/2015/07/9bf376e5e3d8e6ab.png)

## Takeaways

1. Declarative drawing of diagrams allows separation of concerns.
2. Declarative drawing assists in rapid prototyping of visualisation.

# First Steps

## Haskell

Functions are defined with a type signature:

```haskell
example :: Diagram B
```

defines a function to return a `Diagram B`.  Both `Diagram` and `B` are defined by the diagrams module.

Functions are implemented as such:

```haskell
example = circle 1
```

## Primitives

```haskell
example :: Diagram B
example = circle 1 ||| square 1 ||| pentagon 1
```

See [TwoD-Shapes](http://projects.haskell.org/diagrams/haddock/Diagrams-TwoD-Shapes.html) documentation for full details.

## Points & Vectors

Diagrams doesn't conflate 2d points with 2d vectors! Many, many graphics APIs do -- and that annoys me.

```haskell
r2 (3, 3) -- a vector
p2 (3, 3) -- a point
```

## Beside

Rather than side-by side positioning we can:

```haskell
example :: Diagram B
example = beside (r2 (0.5, 0.5)) (circle 1) (square 1)
```

## Multiple Combinators

```haskell
example3 :: Diagram B
example3 = (circle 2 === square 1) ||| pentagon 3
```

## \# Attributes

```haskell
example2 :: Diagram B
example2 = circle 2 # lc blue ||| pentagon 3
```

`#` is simply a postfix function so `circle 1 # lc blue` is `lc blue (circle 1)`

## More Attributes

```haskell
example4 :: Diagram B
example4 = ((circle 2 # lc blue === square 1) # centerY ||| pentagon 3 # centerY)
```

## Horizontal composition

```haskell
example5 :: Diagram B
example5 = hcat [(circle 2 # lc blue === square 1)
                 , pentagon 3, triangle 4]
```

## Vertical composition

```haskell
example6 :: Diagram B
example6 = vcat [circle 2 # lc blue
                 , square 1
                 , pentagon 3]
```

## Envelopes

```haskell
> example6 :: Diagram B
> example6 = vcat [circle 2 # lc blue # showEnvelope' (with & eColor .~ green)
>                 , square 1
>                 , pentagon 3] # centerY # showEnvelope' (with & eColor .~ red)
```

# Case Study

## Tree Viz

We'll create a tree and visualise it's recursive structure.

## Tree

The following is one way of implementing a binary tree.

```haskell
data Tree = Leaf | Branch Tree Tree
```

## Visualisation

We'll visualise each leaf as a square:

```haskell
square 1
```

## Patterns

We can use haskell's pattern matching to build our visualisation.

```haskell
boxes :: Tree -> Diagram B
boxes Leaf = ...
boxes (Branch l r) = ...
```

## Danger

Live demo from here on -- I shouldn't do this, but here we go.

# Conclusion

* The Diagrams EDSL is straightforward and useful.
* Diagrams and Haskell supports refactoring.
    - a.k.a. exploring the data visualisation.

## Takeaways

1. Declarative drawing of diagrams allows separation of concerns.
2. Declarative drawing assists in rapid prototyping of visualisation.

# References
