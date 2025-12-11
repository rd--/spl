# takeDrop

- _takeDrop([x₁ x₂ …], n)_

Answer a `List` of two lists where the first contains the first _n_ elements of the list _x_ and the second contains the rest.

```
>>> [1 .. 9].takeDrop(3)
[
	1 2 3;
	4 5 6 7 8 9
]
```

At `Range`:

```
>>> 1:3.takeDrop(1)
[1:1, 2:3]

>>> 1:5.takeDrop(5)
[1:5, 1:0]

>>> 1:5.takeDrop(0)
[1:0, 1:5]
```

Equivalent to `take` and `drop`:

```
>>> let x = [1 .. 9];
>>> [x.take(3), x.drop(3)]
[
	1 2 3;
	4 5 6 7 8 9
]
```

Equivalent to `takeList` calculating the size of the second list automatically:

```
>>> [1 .. 9].takeList([3 6])
[1 2 3; 4 5 6 7 8 9]
```

With _n=0_:

```
>>> [1 2 3 4 5].takeDrop(0)
[; 1 2 3 4 5]

>>> [].takeDrop(0)
[[], []]
```

At `String`:

```
>>> 'abcdefghijklmn'.takeDrop(6)
['abcdef' 'ghijklmn']
```

It is an error if _n_ is too large:

```
>>> { [1 .. 5].takeDrop(6) }.hasError
true
```

* * *

See also: drop, take, takeList

Guides: List Functions

References:
_Haskell_
[1](https://hackage.haskell.org/package/base-4.21.0.0/docs/Data-List.html#v:splitAt),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/TakeDrop.html)
[2](https://reference.wolfram.com/language/ref/StringTakeDrop.html)
