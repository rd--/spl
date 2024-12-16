# stepArity

- _stepArity(aScale)_

Answer the step arity,
also called step variety,
of _aScale_.

The step arity is the number of step sizes.

A unary scale:

```
>>> Scale(1, [2 2 2 2 2 2], 'Whole-tone')
>>> .stepArity
1
```

A binary scale:

```
>>> Scale(1, [2 2 1 2 2 2 1], 'Maj.')
>>> .stepArity
2
```

A ternary scale:

```
>>> Scale(7, [3, 1, 1, 2], 'Slendro Alit')
>>> .stepArity
3
```

* * *

See also: intervalClasses, scalaScaleArchive, Scale
