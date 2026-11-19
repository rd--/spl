# henonAreaPreservingMap

- _henonAreaPreservingMap(a)_

An area-preserving quadratic map by Michel Hénon.

Plot Hénon area-preserving map:

~~~spl png=A
let f/1 = henonAreaPreservingMap(-10.0);
Sfc32(789341)
.randomReal([0.0 1.0], [43L 2L])
.collect { :v |
	f/1
	.iterate(v)
	.next(43L)
	.takeWhile { :each |
		each.abs.max <= 1.0
	}
}
.catenate
.PointCloud
.Bitmap(100.0)
~~~

![](Help/Image/henonAreaPreservingMap-A.png)

* * *

See also: deJongMap, henonMap, martinMap

Guides: Chaotic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HenonMap.html)

Further Reading: Hénon 1969
