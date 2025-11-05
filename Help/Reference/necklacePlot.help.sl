# necklacePlot

- _necklacePlot(n)_
- _necklacePlot([i₁ i₂ …], m)_

Plot the necklace _n_.
A necklace plot places the beads clockwise and equidistantly about a circle and colours each bead appropriately.

At `ResidueSet`,
which specifies a two colour necklace:

~~~spl svg=A
ResidueSet([0 2 4 5 7 9 11], 12)
.necklacePlot
~~~

![](sw/spl/Help/Image/necklacePlot-A.svg)

The binary form at `List` requires a position vector and a modulus:

~~~spl svg=B
[0 3 6 10 12].necklacePlot(16)
~~~

![](sw/spl/Help/Image/necklacePlot-B.svg)

At `BitSet`,
which specifies a two colour necklace:

~~~spl svg=C
BitSet([0 4 8 11], 16)
.necklacePlot
~~~

![](sw/spl/Help/Image/necklacePlot-C.svg)

* * *

See also: residueSetPlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Necklace.html),
_W_
[1](https://en.wikipedia.org/wiki/Necklace_(combinatorics))
