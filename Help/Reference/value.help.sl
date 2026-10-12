# value

- _value(x)_

At `Association`,
answer the value at the _k→v_:

```
>>> ('w' -> 23).value
23
```

Spl does not implement the `value` protocol:

```
>>> { 23.value }.hasError
true
```

* * *

See also: Association, key

Guides: Dictionary Functions, Value Protocol

References:
_Smalltalk_
5.4.2.2
5.4.4.2

Categories: Accessing, Evaluating
