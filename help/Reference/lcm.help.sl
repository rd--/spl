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
>>> (1n .. 100n).lcm
69720375229712477164533808935312303556800n
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

Plot the least common multiple for a number with 12:

~~~
1:100.lcm(12).linePlot
~~~

* * *

See also: gcd, Gcd, Lcm

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
