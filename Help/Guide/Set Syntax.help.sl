# Set Syntax

Rewrite rule:

- _{|x, …|}_ ⟹ _Set([x, …])_

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

Where supported {| is displayed as ⦃ and |} as ⦄.

* * *

See also: Set

Guides: List Syntax, Syntax Guides

Unicode: U+2983 ⦃ Left White Curly Bracket, U+2984 ⦄ Right White Curly Bracket
