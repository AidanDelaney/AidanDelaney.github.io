% Writing Documents with $\LaTeX$
% Aidan Delaney
% <a href="mailto:aidan@ontologyengineering.org">aidan@ontologyengineering.org</a> | <a href="http://www.twitter.com/aidandelaney">\@aidandelaney</a>

# About Me {data-background='images/royal-pavilion-brighton.jpg'}

* Academic for over a decade (PhD in CS involving logic).
* Researcher in Visual Languages and Visual Reasoning.
* Shipped code in Haskell, C, Java, Perl, Python, C++, JavaScript & others.
* Director of an Eastbourne not-for-profit [__TechResort__](http://techresort.co.uk/).
* Founder of a submarine-mode startup.

# Document Preparation

* I'm good with source code.
* I *do* source control.
* I require good support for math formulae.
* I need source code snippets.
* I need *excellent* bibliography support.
* Cross-reference support is necessary.

# Source Code

```TeX
\documentclass{article}

\title{Something}
\author{Aidan}

\begin{document}
My first document.
\end{document}
```

# Source Control

```bash
commit e71a29bef2cf2a4f9e3584c297c99285bcf16435
Author: Aidan Delaney <aidan@ontologyengineering.org>
Date:   Thu Jan 21 10:08:08 2016 +0000

    Enabled beamer output with automagic conversion of SVG to PDF/PNG etc...

commit cef2fe4fdf21145d3565d816fba0eb1389532990
Author: Aidan Delaney <aidan@ontologyengineering.org>
Date:   Mon Jan 18 09:59:57 2016 +0000

    Added KTP presentation to index.

commit 51a3c731d492622fe2c44eb037ece6de57e3bbce
Author: Aidan Delaney <aidan@ontologyengineering.org>
Date:   Mon Jan 18 09:56:37 2016 +0000

    Reveal.js bump
```

# Mathematics Support {data-background="#fff" data-transition="fade-in fade-out"}

I might need inline $e^{\pi i}=-1$ equations.

Or something in a block:
$$
\bigcup\limits_{z\in MZ(d)}\Psi(z) = \emptyset
$$

Or even something much more complicated:
$$
f^\prime(s^\prime)=\left\{
\begin{array}{cr}
(k,(in\cup\{l\},out))&\textrm{where }\eta(\pi^{-1}(s^\prime))\in\Psi(in\cup\{l\},out)\\
(k,(in,out\cup\{l\}))&\textrm{where }\eta(\pi^{-1}(s^\prime))\in\Psi(in,out\cup\{l\})
\end{array}
\right.
$$

# Source Code Snippits

```java
/**
 * Calculates the points of intersection.
 */
protected Collection<Point2D>
           intersectionPoints(SplitArcBoundary other) {
  Collection<Point2D> ixs = new HashSet<Point2D>();
  for(CircleArc2D a1 : this.curves) {
    for(CircleArc2D a2 : other.curves) {
      Optional<Collection<Point2D>> is =
              nonTangentalIntersections(a1, a2);
      if(is.isPresent()) {
        ixs.addAll(is.get());
      }
    }
  }
  return ixs;
}
```
# Bibliography Support

I need to cite papers from a database [@croucher:rpaolsorbwgsug].

# Cross-referencing

![Caption.](images/image.png) {#fig:description}

Cross reference to @fig:description.

# LibreOffice & Google Docs

* I'm good with source code -- neither are source code.
* I *do* source control -- neither support my standard workflow.
* I require good support for math formulae -- it's _passable_ in both, but not great.
* I need source code snippets -- uugh!
* I need *excellent* bibliography support -- both are too complex.
* Cross-reference support is necessary -- YMMV.

# Writing your first LaTeX file

```LaTeX
\documentclass{article}

\title{Something}
\author{Aidan}

\begin{document}
\maketitle
My first document.
\end{document}
```

# Compiling your LaTeX document

There are a number of differing \LaTeX compilers.  Just use `pdflatex`.

```bash
$ pdflatex myfile.tex
```

# Citing work

```LaTeX
\documentclass{article}

\title{Something}
\author{Aidan}

\begin{document}
\maketitle
My first document cites some work \cite{mykey}

\bibliographystyle{plain}
\bibibliography{mybibfile}

\end{document}
```

# Adding lists

We have three types of list `enumerate`, `itemize` and `description`:

```LaTex
\begin{itemize}
  \item A list item
  \item Another list item
\end{itemize}
```

The `begin` and `end` blocks mark the start and end of an _environment_.

# Adding sections

```LaTeX
\section{Section Title}
```

Note it's not a `begin` & `end` environment.

# Adding images

People argue far too much with images in LaTeX.  Here's the skinny -- Use Inkscape to draw any images you require as SVG.  Alternatively download images as PNG or JPEG.

```LaTeX
\begin{figure}
  \begin{center} % Note Yanqui spelling
    \includegraphics{images/foo} % no extension
    \caption[width=0.8\textwidth]{A figure caption}
    \label{fig:foo}
  \end{center}
\end{figure}
```

But first you need to use the `graphicx` package.

# Adding tables

Tables are a PITA (Note again the use of `figure`, `caption` and `label`.

```LaTeX
\begin{figure}
  \begin{center}
    \begin{tabular}{l|l|l|l|l|l|l|l|}
    &a&b&aa&ab&ba&aba&aab\\\hline
    a&aa&ab&aa&aab&aba&aab&aab\\
    b&ba&b&aab&ba&ba&aab&aab\\
    \end{tabular}
    \caption{A table of stuff}
    \label{tab:stuff}
  \end{center}
\end{figure}
```

# Cross References

Any `\label{x}` can be referenced with a `\ref{x}`.

# Working __with__ $\LaTeX$

* If you're fighting $\LaTeX$ then you're probably wrong, work _with_ it, not against it.
* Don't hard position figures until the document is completely finished.
* Don't try and save space (eg: respect a page limit) until the document is completely finished.
* Remember that your content is *always* more important than the tools you use to develop it.

# The Twist

* LaTeX is often used in source code comments.
* This presentation was not written in \LaTeX :)
  - the magic of pandoc, or
  - the power of markup.

# Thank You {data-background="#08f" data-transition="fade-in fade-out"}

* To you, for giving up your time.

# References
