# constantImage

- _constantImage(c, [w h])_

At `SmallFloat`,
answer a constant gray image:

~~~spl png=A
0.6.constantImage([75 120])
~~~

![](Help/Image/constantImage-A.png)

At `List`,
answer a constant colour image:

~~~spl png=B
[0.875 0.25 0.125]
.constantImage([75 120])
~~~

![](Help/Image/constantImage-B.png)

At `RgbColour`,
answer a constant colour image:

~~~spl png=C
RgbColour([0.25 0.5 0.75], 0)
.constantImage([75 120])
~~~

![](Help/Image/constantImage-C.png)

* * *

See also: Image

Guides: Image Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ConstantImage.html)
