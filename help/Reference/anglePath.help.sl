# anglePath

- _anglePath(thetaList, radiusList, origin)_
- _anglePath(alpha)_ => _anglePath(alpha, [1], [0, 0])_

```
>>> (90.degree # 3).anglePath
[0 0; 0 1; -1 1; -1 0]
```

A polyline of three segments:

~~~
[90 130 -85].degree.anglePath([1.2 2.1 0.7], [0 0]).linePlot
~~~

Advance 20 steps, always turning 110° toward the left:

~~~
(110.degree # 20).anglePath.linePlot
~~~

With unit step sizes:

~~~
(pi / [2 3 -4]).anglePath.linePlot
~~~

With specified step sizes:

~~~ spl figure
(pi / [2 3 -4]).anglePath([0.7 2.3 3.5], [0 0]).linePlot
~~~

Make a random walk where successive steps change direction by at most 20°:

~~~
Sfc32(57951).randomReal(-20, 20, 1000).degree.anglePath.linePlot
~~~

Generate a dragon curve:

~~~
let c = { :l | l ++ [0] ++ (1 - l).reverse }.iterate([0], 10);
let theta = [90 -90].degree @* (c + 1);
theta.anglePath.linePlot
~~~

Generate a Koch snowflake curve:

~~~
(4096.thueMorseSequence * 2.pi / 3).anglePath.linePlot
~~~

Another pattern based on the Thue-Morse sequence:

~~~
(4096.thueMorseSequence * 2.pi / 5).anglePath.linePlot
~~~

* * *

See also: absArg, accumulate, angleVector, cos, degree, foldList, sin, substitutionSystem

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AnglePath.html)

Categories: Geometry
