# Identifier Syntax

The Sᴘʟ identifier syntax determines what names may be used for values.
There are different rules for different contexts,
for instance local `let` bound variables must begin with a lower case letter,
whereas as `Trait` and `Type` names must be begin with an upper case letter.

There is a syntax for writing negated identifiers,
in a similar manner to the syntax for writing negated literals:

```
>>> let x = -5;
>>> (x, -x)
(-5, 5)
```

This syntax is rewritten by the simplifier in terms of the `negate` method:

```
>>> '-x'.splSimplify
'negate(x)'
```

The negation is of the identifier,
to negate an expression use the `negate` method,
or the unary `-` operator,
which need not be written postfix:

```
>>> let x = -5;
>>> (-x.square, x.square.-, -(square(x)))
(25, -25, -25)
```

There is a special syntax for naming the arity of a function:

```
>>> 1:9.scanLeft(plus/2)
[1 3 6 10 15 21 28 36 45]
```

There is a special syntax for in-place, or mutating, methods:

```
>>> 'sort!'.splSimplify
'sortInPlace'

>>> 'sort!/1'.splSimplify
'sortInPlace/1'
```

* * *

Guides: Operator Syntax, Syntax Guides
