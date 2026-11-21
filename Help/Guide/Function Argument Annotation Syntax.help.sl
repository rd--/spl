# Function Argument Annotation Syntax

This syntax allows arguments to functions _x,y…_ to be annotated with an upper-case identifier _T,U…_.
The annotation is applied to the argument before the function body proper.
Not all arguments need have annotations.

Rewrite rules:

```
>> '{ :x T | x }'.splSimplify
{ :x | x := T(x); x }

>> '{ :x T :y | [x, y] }'.splSimplify
{ :x :y | x := T(x); [x, y] }

>> '{ :x :y T | [x, y] }'.splSimplify
{ :x :y | y := T(y); [x, y] }

>> '{ :x T :y U | [x, y] }'.splSimplify
{ :x :y | x := T(x); y := U(y); [x, y] }
```

* * *

Guides: Function Syntax, Syntax Guides
