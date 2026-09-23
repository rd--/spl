# InPlace Syntax

- _f!_

InPlace syntax allows the last letter of an identifier to be an exclamation mark,
which is re-written as the text _InPlace_.

Rewrite rules:

```
>> 'sort!'.splSimplify
sortInPlace

>> 'sort!/1'.splSimplify
sortInPlace/1

>> 'sort!(x)'.splSimplify
sortInPlace(x)

>> 'x.sort!'.splSimplify
sortInPlace(x)
```

This follows the Scheme language convention of writing in place, or mutating, procedures with a trailing exclamation mark.

In place sort:

```
>>> let x = [1 3 5 4 2];
>>> (x, x == x.sort!)
([1 2 3 4 5], true)
```

In place reverse:

```
>>> let x = [1 3 5 4 2];
>>> (x, x == x.reverse!)
([2 4 5 3 1], true)
```

* * *

See also: reverse, reverseInPlace, sort, sortInPlace
