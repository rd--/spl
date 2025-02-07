# List Comprehensions

The Haskell list comprehension:

~~~hs
[ x * x | x <- [1, 2, 7, 12], even x ]
~~~

is rewritten in Haskell _do_ notation as:

~~~hs
do x <- [1, 2, 7, 12]; guard (even x); return (x * x)
~~~

and in plain Haskell notation as:

~~~hs
[1, 2, 7, 12] >>= \x -> guard (even x) >> return (x * x)
~~~

In Sᴘʟ this program might be written:

```
>>> let answer = [];
>>> [1 2 7 12].do { :x |
>>> 	x.isEven.ifTrue {
>>> 		answer.add(x * x)
>>> 	}
>>> };
>>> answer
[4 144]
```

The Haskell list comprehension:

~~~hs
[ (x, y) |
  x <- [1 .. 5],
  y <- [1 .. x],
  isPrime (x + y) ]
~~~

might be written in Sᴘʟ as:

```
>>> let answer = [];
>>> (1 .. 5).do { :x |
>>> 	(1 .. x).do { :y |
>>> 		(x + y).isPrime.ifTrue {
>>> 			answer.add([x, y])
>>> 		}
>>> 	}
>>> };
>>> answer
[1 1; 2 1; 3 2; 4 1; 4 3; 5 2]
```

* * *

See also: do

References:
_Haskell_
[1](https://www.haskell.org/onlinereport/haskell2010/haskellch3.html#x8-420003.11),
_SuperCollider_
[1](https://doc.sccode.org/Guides/ListComprehensions.html)
