# gen20

- _gen20(size, window, ⌈, [α])_

Generates a stored function table for the specified window function.

Hamming window:

~~~spl svg=A
129.gen20(1, 1, []).linePlot
~~~

![](sw/spl/Help/Image/gen20-A.svg)

Hann window:

~~~spl svg=B
129.gen20(2, 1, []).linePlot
~~~

![](sw/spl/Help/Image/gen20-B.svg)

Bartlett window:

~~~spl svg=C
129.gen20(3, 1, []).linePlot
~~~

![](sw/spl/Help/Image/gen20-C.svg)

Blackman window:

~~~spl svg=D
129.gen20(4, 1, []).linePlot
~~~

![](sw/spl/Help/Image/gen20-D.svg)

Blackman-Harris window:

~~~spl svg=E
129.gen20(5, 1, []).linePlot
~~~

![](sw/spl/Help/Image/gen20-E.svg)

Gaussian window, α=1::

~~~spl svg=F
129.gen20(6, 1, [1]).linePlot
~~~

![](sw/spl/Help/Image/gen20-F.svg)

Gaussian window, α=2:

~~~spl svg=G
129.gen20(6, 1, [2]).linePlot
~~~

![](sw/spl/Help/Image/gen20-G.svg)

Kaiser window, α=5:

~~~spl svg=H
129.gen20(7, 1, [5]).linePlot
~~~

![](sw/spl/Help/Image/gen20-H.svg)

Kaiser window, α=10:

~~~spl svg=I
129.gen20(7, 1, [10]).linePlot
~~~

![](sw/spl/Help/Image/gen20-I.svg)

Sinc window, α=1:

~~~spl svg=J
129.gen20(9, 1, [1]).linePlot
~~~

![](sw/spl/Help/Image/gen20-J.svg)

Sinc window, α=3:

~~~spl svg=K
129.gen20(9, 1, [3]).linePlot
~~~

![](sw/spl/Help/Image/gen20-K.svg)

* * *

See also: gen03, gen05, gen07, gen09, gen10, gen11, gen13, gen16, gen19

Guides: Csound Gen Routines

References:
_Csound_
[1](https://csound.com/docs/manual/GEN20.html)
[2](https://csound.com/docs/manual/MiscWindows.html)
