# AmClip

- _AmClip(a, b)_

Two quadrant multiply.
0 when _b_ <= 0, _a_ * _b_ when b > 0.

As amplitude envelope:

```
WhiteNoise().AmClip(SinOsc(1, 0) * 0.2)
```

Plot:

~~~
(0 -- 4.pi).functionPlot { :x | AmClip(1, x.sin) }
~~~

* * *

See also: Clip, Clip2

Categories: Ugen, Math
