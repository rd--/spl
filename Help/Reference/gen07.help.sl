# gen07

- _gen07(anInteger, aSequence)_

Constructs functions from segments of straight lines.
The specification consists of alternating level and duration items.

Sawtooth up and down, starting and ending at zero:

~~~spl svg=A
1024.gen07([0 512 1 0 -1 512 0]).linePlot
~~~

![](sw/spl/Help/Image/gen07-A.svg)

A square from positive to negative:

~~~spl svg=B
1024.gen07([1 512 1 0 -1 512 -1]).linePlot
~~~

![](sw/spl/Help/Image/gen07-B.svg)

A sawtooth down, a straight line from positive to negative:

~~~spl svg=C
1024.gen07([1 1024 -1]).linePlot
~~~

![](sw/spl/Help/Image/gen07-C.svg)

* * *

See also: gen05, gen16

Guides: Csound Gen Routines

References:
_Csound_
[1](https://www.csounds.com/manual/html/GEN07.html)
