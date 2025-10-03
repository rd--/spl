# |>

- _a |> b_

The operator form of `succeeds`.

At `Complex`

```
>>> 2J2 |> 1J1
true
```

At `List`:

```
>>> [1 2 3] |> [2 3 4]
false

>>> [2 3 4 5] |> [1 2 3]
true
```

At `String`:

```
>>> '3' |> '5'
false

>>> 'five' |> 'three'
false

>>> '-0' |> '-2'
false
```

Where supported `|>` is displayed as ≻.

* * *

See also: <, |>=, <|, succeeds

Guides: Comparison Functions

Unicode: U+227B ≻ Succeeds
