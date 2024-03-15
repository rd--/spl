# :

Colon is a syntax token, it is not an operator.

A colon prefix indicates argument names in `Block Syntax`:

```
>>> { :i | i * i } . (3)
9
```

A colon suffix indicates key names in `Dictionary Syntax`:

```
>>> (x: 1, y: 2).keys
['x', 'y']
```

An infix colon defines a `Range` in `Range Syntax`:

```
>>> 1:9 % 2
[1 0 1 0 1 0 1 0 1]
```

* * *

See also: ,, ., ;, :;, :=, Block Syntax, Dictionary Syntax, Range Syntax
