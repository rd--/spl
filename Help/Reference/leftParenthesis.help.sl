# '(' (leftParenthesis)

`(` is a balanced syntax token, closed by `)`, it is not an operator.

`(` is a part of `Dictionary Syntax`, `Trailing Dictionary Syntax` and `Tuple Syntax`,
where it begins either a dictionary or a tuple that is subsequently ended by `)`.

```
>>> (x: 1, y: 2, z: 3).isDictionary
true

>>> min(x: 1, y: 2, z: 3)
1

>>> (1, 2, 3).isTuple
true
```

It is also a part of `Apply Syntax`, `Method Syntax` and `Value Apply Syntax`,
where it begins a tuple holding the arguments to a procedure.

```
>>> max(-3, 3)
3

>>> -3.max(3)
3
```

The name of this syntax token is `leftParenthesis`.

* * *

See also: ), Apply Syntax, Method Syntax, Tuple Syntax, Value Apply Syntax
