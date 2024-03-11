# @

- _aNumber @ anotherNumber_
- _aCollection @ anIndex_

In the `Number` case this operator is the point constructor, as in Smalltalk:

```
>>> 0@0
Point(0, 0)
```

In the `Collection` case this is the operator form of `at`:

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

Note that `at` at `Number` is an error:

```
>>> let n = 23;
>>> { n[3] }.ifError { true }
true
```

_Rationale_:
These two uses are somewhat at odds.
The `Point` constructor form should properly thread over lists.
However using `@*` and `@>` as `at` variants is odd if `@` is not `at`.

* * *

See also: at, At Syntax, Point

Unicode: U+0040 @ Commercial At

Categories: Graphics, Accessing
