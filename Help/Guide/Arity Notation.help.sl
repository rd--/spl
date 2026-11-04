# Arity Notation

Sᴘʟ is arity strict,
meaning that each `Block` and `Method` must be called with the correct number of formal parameters.

```
>>> let f = { :x | x * x };
>>> f(3)
9

>>> {
>>> 	let f = { :x | x * x };
>>> 	f(3, 4)
>>> }.hasError
true
```

The system inserts arity checks when arity qualified names are introduced,
either as `let` bindings or as `Block` arguments.

```
>>> let f/1 = sqrt/1;
>>> f(9)
3

>>> {
>>> 	let f/1 = power/2;
>>> 	f(9)
>>> }.hasError
true

>>> {
>>> 	let f = { :g/1 :x | g(x) };
>>> 	f(power/2, 9)
>>> }.hasError
true
```

* * *

See also: Block, Method, /
