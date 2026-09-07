# signedSqrt

- _signedSqrt(x)_

Signed real square root,
defined as _√x_ where _x>0_,
amd _-√-x_ where _x<0_.

```
>>> -9.signedSqrt
-3
```

Compare with `sqrt`:

```
>>> -9.sqrt
0J3
```

Threads over lists:

```
>>> [-9 0 9].signedSqrt
[-3 0 3]
```

Ploto over subset of reals:

~~~spl svg=A
(-7 -- 7).functionPlot(
	signedSqrt:/1
)
~~~

![](Help/Image/signedSqrt-A.svg)

* * *

See also: ^, cubeRoot, nthRoot, sqrt

Guides: Mathematical Functions

Categories: Ugen
