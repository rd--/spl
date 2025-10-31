# colourCalculatorPlot

- _colourCalculatorPlot(m, c)_
- _colourCalculatorPlot(d, ⍴, c)_

Answer a colour calculator plot of the matrix _m_,
or of the digits of the decimal number _d_ reshaped into shape ⍴,
using the list of colours _c_.

A simple fraction with a repeating decimal form:

```
>>> Decimal(1/7, 12)
0.142857142857D
```

Plot 100 places in a 10×10 grid:

~~~spl svg=A
Decimal(1/7, 100)
.colourCalculatorPlot(
	[10 10],
	[
		251 243 005;
		242 008 132;
		255 100 003;
		144 113 058;
		071 000 165;
		000 000 211;
		221 009 007;
		002 171 234;
		031 183 020;
		086 044 005
	] / 255
)
~~~

![](sw/spl/Help/Image/colourCalculatorPlot-A.svg)

Plot 72 places in a 6×12 grid:

~~~spl svg=B
Decimal(1/7, 72)
.colourCalculatorPlot(
	[6 12],
	'Tableau/Classic 10'
	.namedColourPalette
	.colourList
)
~~~

![](sw/spl/Help/Image/colourCalculatorPlot-B.svg)

Plot 102 places in a 6×17 grid:

~~~spl svg=C
Decimal(1/7, 102)
.colourCalculatorPlot(
	[6 17],
	'Mathematica/Rainbow'
	.namedColourGradient
	.resample(10)
	.colourList
)
~~~

![](sw/spl/Help/Image/colourCalculatorPlot-C.svg)

Plot 81 places of 226/999 in a 9×9 grid:

~~~spl svg=D
Decimal(226/999, 81)
.colourCalculatorPlot(
	[9 9],
	'Mathworks/Summer'
	.namedColourGradient
	.resample(10)
	.colourList
)
~~~

![](sw/spl/Help/Image/colourCalculatorPlot-D.svg)

* * *

See also: arrayPlot, Decimal

Guides: Plotting Functions

Further Reading: Sinclair 2001
