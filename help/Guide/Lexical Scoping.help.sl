# Lexical scoping

Spl is lexically scoped.

In the following program the `Block` at _f₀_ refers to the _x_ that is in scope when it is defined,
not to the _x_ that is in scope when it is evaluated.

```
>>> let x = 1;
>>> let f = { x };
>>> let g = { let x = 2; f() };
>>> g()
1
```

The _x_ in the `Block` at _f₀_ is a reference to the _x_ in lexical scope and will see subsequent mutations:

```
>>> let x = 1;
>>> let f = { x };
>>> x := 2;
>>> f()
2
```

