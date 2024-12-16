# convolve

- _convolve(aList, anotherList)_

Convolution, also known as Fourier convolution and polynomial multiplication.
The answer size is the sum of the input sizes minus one.

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

A convolution typically smooths the function.
Smooth box function (to a triangle function):

~~~spl svg=A
let x = (-1 -- 1).discretize(100);
let u = x.collect(unitBox:/1);
u.convolve(u).linePlot
~~~

![](sw/spl/Help/Image/convolve-A.svg)

Smooth triangle function:

~~~
let x = (-1 -- 1).discretize(100);
let u = x.collect(unitBox:/1);
let v = u.convolve(u);
v.convolve(v).linePlot
~~~

![](sw/spl/Help/Image/convolve-B.svg)

* * *

See also: fft, ifft

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Convolve.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/conv.html)
