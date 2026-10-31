# precedesOrEqual

- _precedesOrEqual(p, q)_

Answer `true` if _p_ precedes or is equal to _q_,
according to `compare`,
else `false`.

At `List`:

```
>>> [1 2 3].precedesOrEqual([2 3 4])
true
```

C.f. `<=`:

```
>>> [1 2 3] <= [2 3 4]
[true true true]
```

At `String`:

```
>>> 'abc'.precedesOrEqual('bcd')
true

>>> '-0'.precedesOrEqual('-2')
true
```

Where supported `precedesOrEqual` is displayed as ≼.

* * *

See also: <, <=>, =, >, compare, precedes

Guides: Comparison Functions

Unicode: U+227c ≼ Precedes Or Equal To
