# composeLeft

- _composeLeft(f/1, g/1)_

Compose the two unary Blocks _f_ and _g_ into one unary Block.

The blocks are composed right to left,
i.e. _g_ is applied first and _f_ second.

```
>>> let f/1 = -.bindLeft(3)
>>> .composeLeft(
>>> 	^.bindLeft(7)
>>> );
>>> f(5)
(3 - (7 ^ 5))

>>> let f/1 = -.bindRight(3)
>>> .composeLeft(
>>> 	^.bindRight(7)
>>> );
>>> f(5)
((5 ^ 7) - 3)
```

Composition of inverses:

```
>>> let n = system.nextRandomFloat;
>>> let f/1 = square/1.composeLeft(sqrt/1);
>>> f(n)
n
```

Sometimes `@*` is defined as an operator form:

```
>>> let @* = composeLeft/2;
>>> let f/1 = square/1 @* sqrt/1;
>>> f(23)
23
```

Compare to `composeRight`:

```
>>> let f/1 = square/1.composeLeft(negate/1);
>>> f(7)
49

>>> let f/1 = square/1.composeRight(negate/1);
>>> f(7)
-49
```

At `List`:

```
>>> let f/1 = [square/1, negate/1].composeLeft;
>>> f(7)
49

>>> let f/1 = [square/1, negate/1].composeRight;
>>> f(7)
-49
```

* * *

See also: bindLeft, bindRight, composeRight

Guides: Block Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Compose),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:.),
_Mathematica_
[1](https://mathworld.wolfram.com/Composition.html)
[2](https://reference.wolfram.com/language/ref/Composition.html)
