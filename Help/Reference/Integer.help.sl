# Integer

`Integer` is a `Trait` for numbers.

```
>>> system
>>> .traitDictionary['Integer']
>>> .isTrait
true
```

Types implementing `Integer`:

```
>>> system
>>> .traitTypes('@Integer')
>>> .sort
[
	'LargeInteger'
	'SmallFloat'
	'Symbol'
]
```

Methods for arithmetic:

- `isPowerOfTwo`
- `factorial`
- `gcd`
- `lcm`
- `take`

* * *

See also: Binary, Fraction, Number, SmallFloat, LargeInteger

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Integer.html)

Categories: Numeric, Trait
