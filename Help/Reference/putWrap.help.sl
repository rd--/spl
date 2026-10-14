# putWrap!

- _putWrap!(c, i, x)_

Store the value _x_ into the sequence _c_ at index _i_.
If _i_ is out of bounds, let it wrap around from the end to the beginning until it is in bounds.
Answer _x_.

```
>>> let l = [1 nil 3];
>>> let z = l.putWrap!(5, 2);
>>> (l, z)
([1 2 3], 2)
```

* * *

See also: Put, atWrap, put!, putPin!

Guides: List Functions

Categories: Acccessing
