# stepArity

- _stepArity(scale)_

Answer the step arity,
also called step variety,
of _scale_.

The step arity is the number of step sizes.
Scales with a step arity of one are called unary scales,
those with a step arity of two are called binary scales,
those with a step arity of three are called ternary scales.

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

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Step_variety)
