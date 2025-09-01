# @ (commercialAt)

- _c @ i_

Answer the item in the collection _c_ at index _i_.

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

However there is a family of operator forms for variants of `at`,
such as `atAll` and `atPath`.

`@*` is a mnemonic for `atAll`:

```
>>> let c = [1 .. 9];
>>> c @* [3 5 7]
[3 5 7]
```

`@>` is a mnemonic for `atPath`:

```
>>> let c = [1 2 3; 4 5 6];
>>> c @> [2 3]
6
```

The name of this operator is `commercialAt`.

`@` is also a syntax token.
`@` prefixes `Trait` names in contexts where they must be distinguished from `Type` names, see `Defining Methods`.

* * *

See also: at, Point

Guides: At Syntax, Binary Operators, Defining Methods

Unicode: U+0040 @ Commercial At

Categories: Accessing, Syntax
