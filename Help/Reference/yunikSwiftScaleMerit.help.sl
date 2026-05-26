# yunikSwiftScaleMerit

- _yunikSwiftScaleMerit(k)_

Answer the Yunik-Swift scale merit score for the _k_-place equal tempered scale.

The Yunik-Swift merit score of the 12-EDO scale:

```
>>> 12.yunikSwiftScaleMerit
0.09293
```

The Yunik-Swift merit scores of the 19-EDO scales:

```
>>> 19.yunikSwiftScaleMerit
0.13386
```

Other EDO scales with relatively high merit scores:

```
>>> [41 46 31 17 34 22 53]
>>> .collect(yunikSwiftScaleMerit:/1)
[
	0.11590
	0.11065
	0.10779
	0.10379
	0.10168
	0.10081
	0.09855
]
```

Plot merit scores for scales up to 60-EDO:

~~~spl svg=A
2:60.collect(
	yunikSwiftScaleMerit:/1
).linePlot
~~~

![](Help/Image/yunikSwiftScaleMerit-A.svg)

Note that the paper gives a higher value for 31-EDO than the algorithm implemented here gives,
however the description of the algorithm is unclear as to exactly how the relative difference is calculated:

```
>>> 31.yunikSwiftScaleMerit
0.10779
```

* * *

See also: relativeChange, sqrt

Guides: Tuning Functions

Further Reading: Yunik and Swift 1980
