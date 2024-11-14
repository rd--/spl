# precedesOrEqualTo

- _precedesOrEqualTo(p, q)_

Answer `true` if _p_ precedes or is equal to _q_, according to `compare`, else `false`.

At `List`:

```
>>> [1 2 3].precedesOrEqualTo([2 3 4])
true
```

C.f. `<=`:

```
>>> [1 2 3] <= [2 3 4]
[true true true]
```

At `String`:

```
>>> 'abc'.precedesOrEqualTo('bcd')
true

>>> '-0'.precedesOrEqualTo('-2')
true
```

Where supported `precedesOrEqualTo` is displayed as ≼.

* * *

See also: =, <, >, <=>, compare, precedes

Unicode: U+227c ≼ Precedes Or Equal To

Categories: Comparing
