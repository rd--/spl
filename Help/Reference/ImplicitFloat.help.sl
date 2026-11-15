# ImplicitFloat

`ImplicitFloat` is a numeric trait.
It implements floating point functions at types that can be converted to `Float`.
It is the mechanism by which `Fraction` supports trigonometry functions, and so on.

```
>>> 1/4.sin
0.2474

>>> 1L.cos
0.5403
```

The required method is:

- `Float`

`ImplicitFloat` is a `Trait`:

```
>>> system
>>> .traitDictionary['@ImplicitFloat']
>>> .isTrait
true
```

Types implementing `ImplicitFloat`:

```
>>> system
>>> .traitTypes('@ImplicitFloat')
>>> .sort!
[
	'Fraction'
	'Integer'
]
```

* * *

See also: Float, Fraction, Integer

Guides: Floating Point Functions
