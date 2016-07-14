% Implementing Computing
% Aidan Delaney
% <a href="mailto:aidan@ontologyengineering.org">aidan@ontologyengineering.org</a> | <a href="http://www.twitter.com/aidandelaney">\@aidandelaney</a>

# Introduction

## About Me {data-background='images/royal-pavilion-brighton.jpg' }


* <span style="color:#ffffff">Academic for over a decade (PhD in CS involving logic).</span>
* <span style="color:#ffffff">Researcher in Visual Languages and Visual Reasoning.</span>
* <span style="color:#ffffff">Shipped code in Haskell, C, Java, Perl, Python, C++, JavaScript & others.</span>
* <span style="color:#ffffff">Director of an Eastbourne not-for-profit [__TechResort__](http://techresort.co.uk/).</span>
* <span style="color:#ffffff">School Governor at Pashley Down and Gildridge House.</span>
* <span style="color:#ffffff">Involved with CAS for a while.</span>

## Takeaways

1. Testing frameworks help.
2. Automated testing helps assessment.

## Assumptions

* Discussing a small, but important, facet of the curriculum i.e. programming.
* Using a text-based programming language.
* Writing small programmes; generally $\le$ 100 LOC.

## Running example

* OCR password example from A453
    - Write a program to test the "strength" of a password.
    - strong passwords have a capital letter and a digit.
    - medium passwords have a capital letter or a digit.
    - all passwords are between 6 and 12 characters long.

# Industry-grade Development

## Practices

* Agile planning
    - backlog, user stories, sprint planning.
* Build system
    - dependency resolution, supports "higher-level" QA practices.
* Test framework
    - system and unit testing.
* Source control
    - aids with transparency of development project.

## Test Framework

| Python   |     Java      |  C#   |
|:----------:|:-------------:|:------:|
| pytest |  JUnit | NUnit |

* Provides structure for automated tests.
* Helps in test planning.

## Triangulation


## Specification

* *Really* helps design.
* Cucumber is a nice specification language
  - _Feature_: The feature to be tested
  - _Scenario_: A flow of events through a feature.
  - _Given_, _And_, _When_, _Then_: Descriptions in natural language.

## Example

```Cucumber
Scenario: Short password
  Given a <short> password
  And the password is less than 6 letters long
  Then the password is unacceptable

  Examples:
    | short |
    | a     |
    | ab    |
```

## Your Turn

It should be at least 6, and no more than 12 characters long The system must indicate that the password has failed and why...

Password strength can be assessed against simple criteria to assess its suitability; for example a password system using only upper and lower case alphabetical characters and numeric characters could assess the password strength as:

* WEAK if only one type used, e.g. all lower case or all numeric
* MEDIUM if two types are used
* STRONG if all three types are used.

## Steps

* We can map each scenario into executable tests.
* _Automated systems can figure out where we've missed a step_.
* Tests can be run multiple times and __are their own documentation__.

## Example

```Python
@given('a <short> password')
def step_input_password(short):
    return PasswordCheck.check(short)
```

## Test First

* Now we have a spec and a test we know "when to go home".
  - the code is done when the tests run.
* Our code is nicely decomposed into functions with
  - user view
  - system view
  - module/unit view

# Conclusion

## Spec-Test-Code

* Triangulation is _key_.
* Triangulated projects make good stories.
  - This is what I'm going to do.
  - This is how it works.
  - This is what I've done.
* Triangulation _is_ assessment.

## My Code

## OCR Solution
![An image of some bad code](images/code.png)

# References
