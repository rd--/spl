# ImplicitInteger

`ImplicitInteger` is a numeric trait.
It implements integer functions at types that can be converted to `Integer`.

The required method is:

- `Integer`

`ImplicitInteger` is a `Trait`:

```
>>> system
>>> .traitDictionary['@ImplicitInteger']
>>> .isTrait
true
```

Types implementing `ImplicitInteger`:

```
>>> system
>>> .traitTypes('@ImplicitInteger')
>>> .sort!
[
	'Float'
	'Fraction'
]
```

* * *

See also: Float, Fraction, Integer

Guides: Integer Functions
