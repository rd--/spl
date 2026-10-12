# schlickGainFunction

- _schlickGainFunction(b)_

Answer Schlick’s gain function for modelling a smooth and monotonic curve-shaped over _(0, 1)_.

Plot with various gain parameters:

~~~spl svg=A
(0 -- 1).functionPlot(
	[0.1 0.2 0.3 0.7 0.9].collect { :g |
		g.schlickGainFunction
	}
)
~~~

![](Help/Image/schlickGainFunction-A.svg)

Evaluate symbolically:

```
>> let f = `b`.schlickGainFunction;
>> f(`x`)
(if (< x 0.5)
  (/ x (+ (* (- (/ 1 b) 2) (- 1 (* 2 x))) 1))
  (/
    (- (* (- (/ 1 b) 2) (- 1 (* 2 x))) x)
    (- (* (- (/ 1 b) 2) (- 1 (* 2 x))) 1)))
```

* * *

See also: perlinGainFunction, schlickBiasFunction

Guides: Sigmoid Functions

Further Reading: Schlick 1994
