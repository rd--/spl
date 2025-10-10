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
>> 'let x = -5; -x'.splSimplify
let x = -5; negate(x)
```

The negations is of the literal,
to negate an expression use the `negate` method,
or the unary `-` operator,
which must be writte postfix:

```
>>> let x = -5;
>>> (-x.square, x.square.-)
(25, -25)
```

* * *

Guides: Operator Syntax, Syntax Guides
