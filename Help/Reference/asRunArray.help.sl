# asRunArray

- _asRunArray([x₁ x₂ …])_

Convert the sequence _x_ into a `RunArray`:

```
>>> 'abbbccccc'.characters.asRunArray.runs
[1 3 5]
```

There is a distinct method to convert a sequence of _run -> value_ associations into a `RunArray`:

```
>>> [1 -> 'a', 3 -> 'b', 5 -> 'c']
>>> .associationListToRunArray
>>> .asList
>>> .stringJoin
'abbbccccc'
```

* * *

See also: RunArray

Categories: Converting
