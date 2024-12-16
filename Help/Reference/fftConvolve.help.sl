# fftConvolve

- _fftConvolve(aList, anotherList)_

Convolution, also known as Fourier convolution and polynomial multiplication.
The answer size is the sum of the input sizes minus one.
Implemented using `fft` and `ifft`.
Should give answers equal to those given by `convolve`, ignoring floating point errors.

```
>>> [2 3 4].fftConvolve([1 2 3])
[2 7 16 17 12]

>>> [1 0 1].fftConvolve([2 7])
[2 7 2 7]

>>> let u = [1 1 1];
>>> let v = [1 1 0 0 0 1 1];
>>> u.fftConvolve(v)
[1 2 2 1 0 1 2 2 1]
```

A convolution typically smooths the function.
Smooth box function (to a triangle function):

~~~spl svg=A
let x = (-1 -- 1).discretize(100);
let u = x.collect(unitBox:/1);
u.fftConvolve(u).linePlot
~~~

![](sw/spl/Help/Image/fftConvolve-A.svg)

Smooth triangle function:

~~~spl svg=B
let x = (-1 -- 1).discretize(100);
let u = x.collect(unitBox:/1);
let v = u.fftConvolve(u);
v.fftConvolve(v).linePlot
~~~

![](sw/spl/Help/Image/fftConvolve-B.svg)

Autocorrelation of white noise is an impulse:

~~~spl svg=C
let r = Sfc32(317841);
let u = r.randomReal(-1, 1, [200]);
let v = u.reversed;
u.fftConvolve(v).linePlot
~~~

![](sw/spl/Help/Image/fftConvolve-C.svg)

* * *

See also: convolve, fft, ifft

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Convolve.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/conv.html)
