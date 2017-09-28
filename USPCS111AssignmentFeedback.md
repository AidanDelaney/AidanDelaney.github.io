% Assignment 1 Feedback
% Aidan Delaney
% <a href="mailto:aidan@ontologyengineering.org">aidan@ontologyengineering.org</a> | <a href="http://www.twitter.com/aidandelaney">\@aidandelaney</a>

# Assignment 1 {data-background="#CCCCCC" data-transition="fade-in fade-out"}

## Learning Objectives

  * To review common misunderstandings as shown by Assignment 1

## Note

I have not copied code from any of your assignments to these slides.  So if you recognise the pattern, then you made a common mistake.

# Syntax Issues

## Variable declaration

Issue 1:

```c++
char choice = 'y' | 'Y' | 'q' | 'Q';
```

Issue 2:

```
char y;
char q;
```

##   

# Semantic Issues

## Multiple `srand`

`srand` sets the seed of the random number generator.  It only needs to be done once, not every time you ask for a random number.

Calling `srand` multiple times suggests a lack of understanding in what is happening.

## Multiple input vars

```c++
int option1;
int option2;
int option3;
```

In this problem it is cleaner to have a single `option` and loop `3` times.  Otherwise you have to write the validation code thrice.

## $(P \vee \neg P)$

```c++
if(x>0) {
  // do something
} else if (x <=0) {
  // do something else
}
```
## Missing braces

```
for(int i;i<10;i++)
  cout << i;
  some_var = i * 2;
```

Because you omitted the braces, this has a different semantics than those (probably) intended.

## ALL INPUT IS TAINTED!!!

  * You *must* validate all user input.
  * It is the first principle of application security.
  * Garbage in - garbage out.

## Using `cin.ignore()`

```c++
cin.ignore(50, '\n');
```

What happens if the user types more than 50 chars?

## Boolean Logic

```c++
if (guess > number && guess < number) {
  // do something
}
```

[This Guy](https://t.co/4mMj6VBw67) can explain some boolean logic things.

# Style Issues

## Not using loops

Some people wrote all the code _inline_.  Suppose playing one round of a game is 50 lines of code, then inlining all three rounds is 150 lines of code.

I hope that our discussions on *functions* have clarified your thinking on this.

## Indentation

This
```c++
for(int i=0;i<10;i++) {
if(i > 5) {
cout << i;
}
}
```

Should be
```c++
for(int i=0;i<10;i++) {
  if(i > 5) {
    cout << i;
  }
}
```

## Swear words

```c++
// Can't get this ******** thing
```

This is unprofessional and insulting to the reader.

## Platform-specific code

```c++
#include <windows.h>
```

```c++
system("PAUSE");
```

We don't need to tie our code to a single platform.

# Conclusion {data-background="#00d414" data-transition="fade-in fade-out"}

##

* Some people made straightforward syntactic mistakes -- declaring unused variables.
* Many more had semantic issues -- ALL INPUT IS TAINED!
* Style issues are the easiest to fix and simply shouldn't happen.

## Thank you 

* I'm always happy to answer questions over email.
     - <a href="mailto:aidan.delaney@usp.ac.fj">aidan.delaney@usp.ac.fj</a> | <a href="http://www.twitter.com/aidandelaney">\@aidandelaney</a>
