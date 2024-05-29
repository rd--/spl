# @

- _aCollection @ anIndex_

Answer the item in _aCollection_ at _anIndex_.

```
>>> let c = 1:9;
>>> c @ 3
3
```

This form is rarely used since `at` is ordinarily written using `At Syntax` as:

```
>>> let c = 1:9;
>>> c[3]
3
```

However it is nice to have operator forms for variants of `at`,
such as `atAll` and `atPath`. `@*` is a mnemonic for `atAll`:

```
>>> let c = [1 .. 9];
>>> c @* [3 5 7]
[3 5 7]
```

and `@>` for `atPath`:

```
>>> let c = [1 2 3; 4 5 6];
>>> c @> [2 3]
6
```

The name of this operator is _commercialAt_.

* * *

See also: at, At Syntax, Point

Unicode: U+0040 @ Commercial At

Categories: Accessing
