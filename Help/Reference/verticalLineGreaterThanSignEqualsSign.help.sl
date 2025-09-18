# |>=

- _a |>= b_

Answer `true` if _a_ succeeds or is equal to _b_,
else `false`.

At `SmallFloat`:

```
>>> 3 |>= 2
true

>>> 2 <| 3
true
```

At `String`:

```
>>> '3' |>= '2'
true

>>> '2' <| '3'
true
```

Where supported `|>=` is displayed as ≽.

* * *

See also: <|, |>, succeedsOrEqualTo

Guide: Comparison Functions

Unicode: U+227D ≽ Succeeds or Equal To
