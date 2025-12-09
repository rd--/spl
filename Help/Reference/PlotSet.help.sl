# PlotSet

- _PlotSet(m)_
- _PlotSet(c, [m n])_

A `Type` representing a set of data plots.

In the unary case _m_ must be a regular matrix of `Plot` values,
however `nil` values are allowed as missing entries.

In the binary case the collection _c_ will be be reshaped to have _m_ rows and _n_ columns,
missing items will be set to `nil`.

* * *

See also: Plot

Guides: Plotting Functions
