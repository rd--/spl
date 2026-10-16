# gen20

- _gen20(n, w, ⌈, [α])_

Generates a stored function table for the specified window function _w_.

Hamming window, _w=1_:

~~~spl svg=A
129.gen20(1, 1, []).linePlot
~~~

![](Help/Image/gen20-A.svg)

Hann window, _w=2_:

~~~spl svg=B
129.gen20(2, 1, []).linePlot
~~~

![](Help/Image/gen20-B.svg)

Bartlett (or triangular) window, _w=3_:

~~~spl svg=C
129.gen20(3, 1, []).linePlot
~~~

![](Help/Image/gen20-C.svg)

Blackman window, _w=4_:

~~~spl svg=D
129.gen20(4, 1, []).linePlot
~~~

![](Help/Image/gen20-D.svg)

Blackman-Harris window, _w=5_:

~~~spl svg=E
129.gen20(5, 1, []).linePlot
~~~

![](Help/Image/gen20-E.svg)

Gaussian window, _w=6_, with _α=1_:

~~~spl svg=F
129.gen20(6, 1, [1]).linePlot
~~~

![](Help/Image/gen20-F.svg)

Gaussian window, _w=6_, with _α=2_:

~~~spl svg=G
129.gen20(6, 1, [2]).linePlot
~~~

![](Help/Image/gen20-G.svg)

Kaiser window, _w=7_, with _α=5_:

~~~spl svg=H
129.gen20(7, 1, [5]).linePlot
~~~

![](Help/Image/gen20-H.svg)

Kaiser window, _w=7_, with _α=10_:

~~~spl svg=I
129.gen20(7, 1, [10]).linePlot
~~~

![](Help/Image/gen20-I.svg)

Sinc window, _w=9_, with _α=1_:

~~~spl svg=J
129.gen20(9, 1, [1]).linePlot
~~~

![](Help/Image/gen20-J.svg)

Sinc window, _w=9_, with _α=3_:

~~~spl svg=K
129.gen20(9, 1, [3]).linePlot
~~~

![](Help/Image/gen20-K.svg)

* * *

See also: gen03, gen05, gen07, gen09, gen10, gen11, gen13, gen16, gen19

Guides: Csound Gen Routines

References:
_Csound_
[1](https://csound.com/docs/manual/GEN20.html)
[2](https://csound.com/docs/manual/MiscWindows.html)
