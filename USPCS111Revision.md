% Revision
% Aidan Delaney
% <a href="mailto:aidan@ontologyengineering.org">aidan@ontologyengineering.org</a> | <a href="http://www.twitter.com/aidandelaney">\@aidandelaney</a>

# Revision {data-background="#CCCCCC" data-transition="fade-in fade-out"}

## Learning Objectives

  * To review all of our learning so far

# Syntax

## Variable declaration

```c++
int x = 7;
float pi = 3.14f;
double d = 3.3333333;
string s = "Hello";
char c = 'x';
```

## Conditionals

```c++
if(/*condition*/) {
  // do this
}
```

* Can add an `else` clause
* Or even another condition to check `if else(/*condition*/)`

## Iteration: For

```c++
for(int i=0; i< 10; i++) {
  // do loop body
}
```

* Loop variable, loop guard, loop variable update

## Iteration: While

```c++
int i = 0;
while(i< 10) {
  // do loop body
  i++;
}
```

* Loop variable, loop guard, loop variable update

## Iteration: Do While

```c++
int i = 0;
do {
  // do loop body
  i++;
} while(i< 10);
```

* Loop variable, loop guard, loop variable update

## Array Declaration

```c++
int an_array[10];
int my_array = {1, 2, 3, 4, 5};
```

## Functions

```c++
int my_function(int & param1, int param2) {
    param1 = 1; // modify reference parameter
    param2 = 1; // modify copy of value parameter
    return 1;
}
```

## Passing Arrays

* We can treat arrays as if they're passed by reference

```c++
int my_function(int my_array[], int array_size);
```

* Remember to pass the array size.

# Semantics

## Random Numbers

```c++
srand(time(0));  // Call once

// Get random number between 0 and 9;
rand() % 10;
```

## Input Validation

```c++
int a_number;
cin >> a_number;

if(cin.fail()) {
  // Remember cin is a queue, we have to empty the
  // junk as it has failed to read an int.
  string junk;
  cin >> junk;

  // Clear the notification of failure
  cin.clear();
}
```

## Read into Array

```
/** Reads and validates and int from cin.
 */
int readInt();

int main() {
  int my_array[5];

  for(int i=0; i<5;i++) {
    my_array[i] = readInt();
  }
}
```

## Read from File

```c++
// We need one of these
ifstream infile();

infile.open("myfile.txt");

// In future you'll use a parser
while(infile.eof()) {
  int field1, field2;
  infile >> field1 >> field2;

  // validate input

  // do something with input
}
```

## Write to File

```c++
ofstream outfile();

// Don't open a file you're using for reading.
outfile.open("output.txt");

out << "Some Text"
```

# Problem Solving

## Divide-and-Conquer

![Divide and Conquer](https://ka-perseus-images.s3.amazonaws.com/98c02634ee7f970a6bfb0812cc1495bacb462282.png)

## Flowcharts

![A flowchart](http://orm-chimera-prod.s3.amazonaws.com/1234000000754/images/twdp_0403.png)

# Conclusion {data-background="#00d414" data-transition="fade-in fade-out"}

##

* Syntax is now the _easy_ part of programming
* How to solve problems is the difficult part
    - divide into sub-problems
    - solve sub-problem
    - compose solution to whole problem from sub-solutions
* Functions help!

## Thank you 

* I'm always happy to answer questions over email.
     - <a href="mailto:aidan.delaney@usp.ac.fj">aidan.delaney@usp.ac.fj</a> | <a href="http://www.twitter.com/aidandelaney">\@aidandelaney</a>
