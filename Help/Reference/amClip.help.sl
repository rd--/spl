# amClip

- _amClip(a, b)_

Two quadrant multiply.
0 when _b_ <= 0, _a_ * _b_ when b > 0.

```
>>> amClip([1 2 3 4], [1 -1 0 1])
[1 0 0 4]
```

As amplitude envelope:

~~~spl syn=A
whiteNoise().amClip(
	sinOsc(1, 0) * 0.2
)
~~~

Two quadrant multiply:

~~~spl svg=A
(0 -- 4.pi).functionPlot { :x |
	amClip(1, x.sin)
}
~~~

![](Help/Image/amClip-A.svg)

* * *

See also: clip

Guides: Unit Generators

Categories: Ugen, Math
