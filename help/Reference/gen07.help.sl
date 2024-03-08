# gen07

- _gen07(anInteger, aSequence)_

Constructs functions from segments of straight lines.
The specification consists of alternating level and duration items.

Sawtooth up and down, starting and ending at zero:

~~~
1024.gen07([0 512 1 0 -1 512 0]).plot
~~~

A square from positive to negative:

~~~
1024.gen07([1 512 1 0 -1 512 -1]).plot
~~~

A sawtooth down, a straight line from positive to negative:

~~~
1024.gen07([1 1024 -1]).plot
~~~

* * *

See also: gen05, gen09, gen10

References:
_Csound_
[1](https://www.csounds.com/manual/html/GEN07.html)
