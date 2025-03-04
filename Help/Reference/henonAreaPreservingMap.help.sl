# henonAreaPreservingMap

- _henonMap(a, b)_

An area-preserving quardatic map by Michel Hénon.

~~~spl png=A
let f:/1 = henonAreaPreservingMap(-10);
Sfc32(789341)
.randomReal(0, 1, [43 2])
.collect { :v |
	f:/1
	.iterate(v)
	.next(43)
	.takeWhile { :each |
		each.abs.max <= 1
	}
}
.catenate
.PointCloud
.asBitmap(100)
~~~

![](sw/spl/Help/Image/henonAreaPreservingMap-A.png)

* * *

See also: deJongAttractor, henonMap, martinMap

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HenonMap.html)

Further Reading: Hénon 1969
