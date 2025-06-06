# convolve

- _convolve(aList, anotherList)_

Convolution, also known as Fourier convolution and polynomial multiplication.
The answer size is the sum of the input sizes minus one.
Implemented using direct calculation.

```
>>> [2 3 4].convolve([1 2 3])
[2 7 16 17 12]

>>> [1 0 1].convolve([2 7])
[2 7 2 7]

>>> let u = [1 1 1];
>>> let v = [1 1 0 0 0 1 1];
>>> u.convolve(v)
[1 2 2 1 0 1 2 2 1]
```

Convolve with a single element:

```
>>> [1].convolve([1 2 3 4 5 6])
[1 2 3 4 5 6]
```

A convolution typically smooths the function.
Smooth box function (to a triangle function):

~~~spl svg=A
let x = (-1 -- 1).discretize(100);
let u = x.collect(unitBox:/1);
u.convolve(u).linePlot
~~~

![](sw/spl/Help/Image/convolve-A.svg)

Smooth triangle function:

~~~spl svg=B
let x = (-1 -- 1).discretize(100);
let u = x.collect(unitBox:/1);
let v = u.convolve(u);
v.convolve(v).linePlot
~~~

![](sw/spl/Help/Image/convolve-B.svg)

Autocorrelation of white noise is an impulse:

~~~spl svg=C
let r = Sfc32(317841);
let u = r.randomReal([-1 1], [200]);
let v = u.reversed;
u.convolve(v).linePlot
~~~

![](sw/spl/Help/Image/convolve-C.svg)

Find the autocorrelation of a list:

~~~spl svg=D
let u = 1:100.collect { :i | (i ^ 2) % 17 };
let v = u.reversed;
(u ++ u).convolve(v).middle(100).linePlot
~~~

![](sw/spl/Help/Image/convolve-D.svg)

* * *

See also: accumulate, differences, fft, fftConvolve, ifft, inner, linearRecurrence, movingAverage, partition

Guides: Fourier Analysis Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ListConvolve.html)
[2](https://reference.wolfram.com/language/ref/Convolve.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/conv.html)
