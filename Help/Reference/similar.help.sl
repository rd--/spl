# similar

- _p ~ q_

Answer `true` if the object _p_ is similar to (or almost equal to or close to) another object _q_, else `false`.
The meaning of _similar_ is determined by the type of _p_.

At `SmallFloat`:

```
>>> 1.e ~ 2.7183
true

>>> 1.pi ~ 3.1416
true

>>> 23 ~ 23.001
true
```

At `Interval`:

```
>>> (1.e -- 1.pi) ~ (2.7183 -- 3.1416)
true
```

At `LargeInteger`:

```
>>> 23L ~ 23.001
true

>>> 23.001 ~ 23L
true
```

At `Complex`:

```
>>> Complex(1.e, 1.pi) ~ 2.7183J3.1416
true
```

At `List`:

```
>>> [1.e 1.pi] ~ [2.7183 3.1416]
true
```

At `Tuple`:

```
>>> (1.e, 1.pi) ~ (2.7183, 3.1416)
true
```

At `List` of `List`:

```
>>> [
>>> 	1.e 1.pi;
>>> 	1.pi 1.e
>>> ] ~ [
>>> 	2.7183 3.1416;
>>> 	3.1416 2.7183
>>> ]
true
```

At `String`:

```
>>> 'text' ~ 'text'
true

>>> ['x', 'x'] ~ ['x', ['x']]
false

>>> 'text' ~ ['t' 'e' 'x' 't']
false

>>> ['t' 'e' 'x' 't'] ~ 'text'
false
```

At `Character`,
answers true to character and the equivalent one place `String`:

```
>>> Character('x') ~ 'x'
true

>>> 'x' ~ Character('x')
true
```

At `Tuple`:

```
>>> (1, 2) ~ (1.0001, 2)
true
```

At `Record`:

```
>>> let a = (x: 1, y: 2.0001);
>>> let b = (y: 2, x: 1.0001);
>>> (a = b, a ~ b)
(false, true)
```

At `List` of `Assocation` values:

```
>>> let a = [1 -> 2.0001, 3 -> 4];
>>> let b = [1 -> 2, 3 -> 4.0001];
>>> a ~ b
true
```

At `Map`:

```
>>> let a = Map[1 -> 2.0001, 3 -> 4];
>>> let b = Map[1 -> 2, 3 -> 4.0001];
>>> a ~ b
true
```

* * *

See also: ~, =, <~, >~, !=, !~, dissimilar, isCloseTo, isVeryCloseTo

Guides: Comparison Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Match)

Categories: Comparing
