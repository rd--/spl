# lcm

- _lcm(aCollection)_
- _lcm(aNumber, anotherNumber)_

Least common multiple.

```
>>> 0.lcm(9)
0

>>> 4.lcm(6)
12

>>> 1.lcm(1)
1

>>> 1624.lcm(26)
21112
```

At `Collection`:

```
>>> [2 3 5].reduce(lcm:/2)
30

>>> [2 3 5].lcm
30

>>> [3 -5 7].lcm
105

>>> [1/3 2/5 3/7].lcm
6

>>> [5].lcm
5

>>> 1:20.lcm
232792560
```

Lcm threads elementwise over lists:

```
>>> [3 7 40].collect { :each | 12.lcm(each) }
[12 84 120]

>>> [3 7 40].lcm(12)
[12 84 120]

>>> 12.lcm([3 7 40])
[12 84 120]
```

Lcm of first one hundred integers:

```
>>> (1L .. 100L).lcm
69720375229712477164533808935312303556800L
```

Cumulative least common multiples:

```
>>> 1:9.scan(lcm:/2)
[1 2 6 12 60 60 420 840 2520]
```

Signs are discarded:

```
>>> [-3 7].lcm
21
```

For `zero` and `one`, `lcm` is analogous to logical and:

```
>>> lcm:/2.table([0 1], [0 1])
[0 0; 0 1]

>>> &&.table([false true], [false true])
[false false; false true]
```

Plot the least common multiple for a number with 12:

~~~spl svg=A
1:72.functionPlot { :x |
	x.lcm(12)
}
~~~

![](sw/spl/Help/Image/lcm-A.svg)

* * *

See also: &&, gcd, Gcd, Lcm

Guides: Integer Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/LCM),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:lcm),
_Mathematica_
[1](https://mathworld.wolfram.com/LeastCommonMultiple.html)
[2](https://mathworld.wolfram.com/LCM.html),
_Smalltalk_
5.6.5.14
