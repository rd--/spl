# isByte

- _isByte(n)_

Answer `true` if the number _n_ is an integer in the closed interval _(0,255)_.

```
>>> 5.isByte
true

>>> -1.isByte
false
```

At `LargeInteger`:

```
>>> 23L.isByte
true

>>> 37891241578931L.isByte
false
```

Non-integers are not bytes:

```
>>> 3.141.isByte
false
```

It is an `error` if the value is not a number:

```
>>> { 'x'.isByte }.hasError
true
```

* * *

See also: Integer, isInteger

Guides: Predicate Functions

Categories: Testing
