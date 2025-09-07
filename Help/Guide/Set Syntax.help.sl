# Set Syntax

Rewrite rule:

- _{|x, …|}_ ⟹ _Set([x, …])_

Sets are written as lists between special curly brackets:

```
>> '{|x, y, z|}'.splSimplify
Set([x, y, z])
```

A set of integers:

```
>>> {|1, 2, 3|}
Set([1, 2, 3])
```

The empty `Set`,
note that the space character is required,
the expression `{||}` is parsed as a `Block` answering the binary operator `||`:

```
>>> let x = {| |};
>>> (x.isSet, x.isEmpty)
(true, true)
```

Where supported {| is displayed as ⦃,
and |} is displayed as ⦄.

* * *

See also: Set

Guides: List Syntax, Syntax Guides

References:
_W_
[1](https://en.wikipedia.org/wiki/Set_(mathematics))

Unicode: U+2983 ⦃ Left White Curly Bracket, U+2984 ⦄ Right White Curly Bracket
