# isByte

- _isByte(aNumber)_

Answer `true` if _aNumber_ is an integer in the closed interval _(0, 255)_.

```
>>> 5.isByte
true

>>> -1.isByte
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

Categories: Testing
