# Block Type Annotation Syntax

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

Guides: Block Syntax, Syntax Guides
