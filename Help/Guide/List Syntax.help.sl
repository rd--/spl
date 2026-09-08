# List Syntax

- _[]_
- _[x₁ x₂ …]_

Lists are written between square brackets.
List items are separated by commas.

A list of integers:

```
>>> [1, 2, 3]
[1, 2, 3]
```

A list of expressions:

```
>>> [1 + 2, 3 * 4, 25.sqrt]
[3, 12, 5]
```

The empty list:

```
>>> []
[]
```

A list of the empty list:

```
>>> [[]]
[[]]
```

There are no rewrite rules,
list syntax is not rewritten by the simplifier:

```
>> '[]'.splSimplify
[]

>> '[x, y, z]'.splSimplify
[x, y, z]
```

* * *

See also: List

Guides: Array Syntax, List Assignment Syntax, Record Syntax, Tuple Syntax, Syntax Guides, Vector Syntax, Volume Syntax

Categories: Syntax
