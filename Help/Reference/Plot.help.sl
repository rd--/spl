# Plot

- _Plot(d, f, o)_

A `Type` representing a data plot of data _d_, with format _f_ and options _o_.

Ordinarily plots are created using specific plotting functions:

- `arrayPlot`
- `discretePlot`
- `functionPlot`
- `linePlot`
- `logPlot`
- `matrixPlot`
- `pointLinePlot`
- `scatterPlot`

The plot data can have multiple pages,
the page count can be retrieved from the plot using the `pageCount` method:

```
>>> [1 3 5].linePlot.pageCount
1
```

The plot data can be retrieved using the `pageList` method,
note that the data can be rewritten into a _canonical_ form by the plot constructor:

```
>>> [1 3 5].linePlot.pageList
[
	[1 1; 2 3; 3 5]
]
```

A plot scale function can specified using the methods `log` and `logScale`,
the scale function is applied when the plot is generated,
the stored (and retrieved) data is unscaled:

```
>>> [1 3 5].linePlot.log.scale
'log'

>>> [1 3 5].linePlot.logScale.scale
'logScale'

>>> [1 3 5].linePlot.log.pageList
[
	[1 1; 2 3; 3 5]
]
```

* * *

See also: Bitmap, Graph, Greymap, Image, LineDrawing, PlotSet, Svg

Guides: Plotting Functions
