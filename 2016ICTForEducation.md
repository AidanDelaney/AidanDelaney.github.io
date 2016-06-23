% Implementing Computing
% Aidan Delaney
% <a href="mailto:aidan@ontologyengineering.org">aidan@ontologyengineering.org</a> | <a href="http://www.twitter.com/aidandelaney">\@aidandelaney</a>

# Introduction

## Abstract

We consider some practical tips for implementing the new computing curriculum in schools.  In particular, we will focus on KS3 and KS4 provision where, as often is the case, the computing facilities are not quite up to the task.  I will also point out some directions in which to expand computing knowledge.  We'll consider how to use expanded computing knowledge to enrich the national curriculum.

## About Me {data-background='images/royal-pavilion-brighton.jpg' }


* <span style="color:#ffffff">Academic for over a decade (PhD in CS involving logic).</span>
* <span style="color:#ffffff">Researcher in Visual Languages and Visual Reasoning.</span>
* <span style="color:#ffffff">Shipped code in Haskell, C, Java, Perl, Python, C++, JavaScript & others.</span>
* <span style="color:#ffffff">Director of an Eastbourne not-for-profit [__TechResort__](http://techresort.co.uk/).</span>
* <span style="color:#ffffff">School Governor at Pashley Down and Gildridge House.</span>
* <span style="color:#ffffff">Involved with CAS for a while.</span>

## Takeaways

1. Use a full-fat open-source development environment.
2. Professional software development practices help.

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

# Full-fat

## Dev env

Professional developers use a full-fat dev environment.  Most are cross-platform & open-source, and this is important.

| Python   |     Java      |  C#   |
|:----------:|:-------------:|:------:|
| PyCharm CE |  IntelliJ CE | MonoDevelop |


## Sys Admins

* Network managers often don't like full-fat dev environments
    - in many cases there are good reasons not to.
    - pushes towards online IDEs.
* I need course content to improve every year; so I need control of the dev env.
* Gen your network manager on board.
    - use a dev VM?

## Change

```Java
// since 2004
List<Integer> is = Arrays.asList(1, 2, 3);

int sum = 0;
// since 1994
for(int i = 0; i <= is.size() - 1; i++) {
  sum += is.get(i);
}

// since 2004
for(int i : is) {
  sum += is.get(i);  // since 2006
}

// since 2014
sum = is.stream().mapToInt(Integer::intValue).sum();
```

## Takeaway

* Use a full-fat open-source development environment
    * Control over upgrades and cadence.
    * Helps continuous improvement.
    * Requires sys-admin support.
    * Closer to professional practice.

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

## Agile planning

* As a _user_ I want to get feedback on the strength of my password.
    - system level view
* As a _developer_ I want to test the application thoroughly.
    - unit level view
* As a _marker_ I want to see clear documentation.
    - project level view

## Build System

| Python   |     Java      |  C#   |
|:----------:|:-------------:|:------:|
| pip/setuptools |  Maven | NAnt |

* Good project documentation
    - what to build/run and how.
* Helps integration of automated testing.
* Generally solves dependency management.
    - *huge* win for managing environment.

## Example

```xml
<groupId>uk.ac.brighton.test</groupId>
<artifactId>LoopTest</artifactId>
<version>1.0-SNAPSHOT</version>

<dependencies>
  <dependency>
    <groupId>org.hamcrest</groupId>
    <artifactId>hamcrest-all</artifactId>
    <version>1.3</version>
  </dependency>
  <dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <version>4.12</version>
  </dependency>
</dependencies>

<build>
  <plugins>
    <plugin>
      <groupId>org.apache.maven.plugins</groupId>
      <artifactId>maven-compiler-plugin</artifactId>
      <configuration>
        <source>1.8</source>
        <target>1.8</target>
        </configuration>
    </plugin>
  </plugins>
</build>
```

## Source Control

* Use `git` as it has won the protracted war.
* Provides evidence of engagement & consistent work.
* Evidences independent ideas.
* Supports structuring project into nibble sized pieces.
* Provides cheap & easy backup.

## Example

```bash
$ git log
commit 920b22d1501bfc7e7f882e87262f675ff7f841d3
Author: Aidan Delaney <aidan@ontologyengineering.org>
Date:   Thu Jun 23 13:13:38 2016 +0100

    Added test for strong password.

commit 3d10165f77f6ae2cf9409e0e670847bdc97b0523
Author: Aidan Delaney <aidan@ontologyengineering.org>
Date:   Thu Jun 23 11:56:52 2016 +0100

    initial commit
```

## Test Framework

| Python   |     Java      |  C#   |
|:----------:|:-------------:|:------:|
| pyunit |  JUnit | NUnit |

* Provides structure for automated tests.
* Helps in test planning.

## Example

```Java
public class PasswordStrengthTest {
  public List<Optional<String>> strong = new ArrayList<>();

  @Before
  public void setUp() {
    strong.add(Optional.of("ABCDE1GHIJKL"));
    strong.add(Optional.of("ABE1GH2JKL"));
  }

  @Test
  public void testStrong() {
    PasswordStrength ps = new PasswordStrength();
    assertThat(
       strong.stream().map(ps::checkPassword).collect(Collectors.toSet())
     , Every.everyItem(is(PasswordStrength.PStrength.STRONG))
     );
    }
}
```

## Takeaway

* Industry-level software development practices help
    - planning: There are de-jour standards for planning documents.
    - project control: source control & burn down chart provides transparency over project progress.
    - assessment: automating tests makes assessment more straightforward & build description describes project dependencies.
    - plagiarism & cheating: much harder to cheat using source-control.

# Conclusion

## Takeaways

1. Use a full-fat open-source development environment.
2. Professional software development practices help.

## Solution

```Java
public PStrength checkPassword(Optional<String> password) {
  if(!password.isPresent() || password.get().length() < 6 || password.get().length() > 12) {
    return PStrength.FAIL;
  }

  PStrength strength = PStrength.WEAK;
  if (Pattern.matches("(\\w*[\\d\\w*\\p{javaUpperCase}|\\p{javaUpperCase}\\w*\\d]\\w*)", password.get())) { // strong check
    return PStrength.STRONG;
  } else if (Pattern.matches("\\w*[\\d|\\p{javaUpperCase}]\\w*", password.get())) { // medium check
    return PStrength.MEDIUM;
  }

  return PStrength.WEAK;
}
```
## OCR Solution
![An image of some bad code](images/code.png)

# References
