# normalInteger

- _normalInteger(x)_

Convert the object _x_ to a normal integer from a special form.

At `LargeInteger`,
answer a `SmallFloat` if the integer can be properly represented as such:

```
>>> 23L.normalInteger
23

>>> (23L ^ 13).normalInteger
504036361936467383L
```

At `SmallFloat`,
answer a `SmallFloat` if it is an integer,
else signal an error:

```
>>> 23.normalInteger
23

>>> {
>>> 	3.141.normalInteger
>>> }.hasError
true
```

_Rationale_:
`normalInteger` is a subset of `Integer`,
it is only defined at `SmallFloat` and `LargeInteger`.

* * *

See also: Integer, LargeInteger, SmallInteger

Guides: Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Normal.html)
