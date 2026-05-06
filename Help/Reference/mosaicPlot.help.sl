# mosaicPlot

- _mosaicPlot(m)_

Answer a mosaic plot of the data set _m_.

A non-intersecting data-set from _ST|10-1, 080262_,
rows have equal sums,
(Xenakis 1989, p.139):

~~~spl svg=A
[
	5 10 10 30 20 5 10 10;
	5 25 8 9 8 13 22 10;
	10 10 5 15 10 10 20 20;
	5 15 15 15 15 10 15 10;
	15 5 5 18 5 17 17 18;
	9 13 3 20 5 20 19 11;
	16 18 2 26 3 11 12 12
].mosaicPlot
~~~

![](Help/Image/mosaicPlot-A.svg)

A random matrix with a normal distribution,
note that the row sums are not uniform and therefore the mosaic row heights are not uniform:

~~~spl svg=B
let r = Sfc32(789134);
NormalDistribution(7, 4)
.randomVariate(r, [7 8])
.mosaicPlot
~~~

![](Help/Image/mosaicPlot-B.svg)

* * *

See also: parallelAxisPlot, radialAxisPlot

Guides: Plotting Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Mosaic_plot)

Further Reading: Hartigan and Kleiner 1981
