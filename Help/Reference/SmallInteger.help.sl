# SmallInteger

- _SmallInteger(x)_

Answer the `Float` that is equal to the number _x_,
which must be an integer value.
`SmallInteger` is a pseudo-type,
it has a pseudo-type predicate `isSmallInteger`.

At `Float`:

```
>>> SmallInteger(23)
23
```

It is an error if the value is not an integer:

```
>>> {
>>> 	SmallInteger(1.pi)
>>> }.hasError
true
```

At `Integer`:

```
>>> SmallInteger(8388608L)
8388608
```

It is an error if the value is cannot be represented as a small integer:

```
>>> {
>>> 	SmallInteger(2L ^ 53)
>>> }.hasError
true
```

At `Fraction`,
value must be an integer:

```
>>> SmallInteger(23/1)
23

>>> {
>>> 	SmallInteger(22/7)
>>> }.hasError
true
```

At `Decimal`,
value must be an integer:

```
>>> SmallInteger(23D)
23

>>> SmallInteger(23.000D)
23

>>> {
>>> 	SmallInteger(3.141D)
>>> }.hasError
true
```

Arithmetic at small integers overflows to `Integer` as required:

```
>>> 17L ^ 17
827240261886336764177L

>>> let a = 2L ^ 49;
>>> (a, a.square)
(
	562949953421312,
	316912650057057350374175801344L
)

>>> let a = 2L ^ 49;
>>> (-a, -a - (a * 17))
(
	-562949953421312,
	-10133099161583616L
)
```

_Rationale_:
Arithmetic overflow of `SmallInteger` values is particularly confusing.
The answers remain approximately accurate,
and it is very easy to miss that overflow has occurred.
The interpreter promotes answers that would overflow to the type `Integer`.
It is possible to have the interpreter print a message when overflow occurs,
and also to treat overflow as an error.
The help files generally run without requiring type promotion,
by writing integer literals in expressions that would otherwise overflow with an `L` suffix.
That is,
calculations which would overflow are written using `Integer` values.

* * *

See also: Float, Fraction, Integer, isSmallInteger

Guides: Bitwise Functions, Integer Functions, Number Functions
