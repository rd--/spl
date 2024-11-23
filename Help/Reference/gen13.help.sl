# gen13

- _gen13(size, x=1, a=1, h0=0, h)_

Stores a polynomial whose coefficients derive from the Chebyshev polynomials of the first kind.
Uses Chebyshev coefficients to generate stored polynomial functions which,
under waveshaping,
can be used to split a sinusoid into harmonic partials having a pre-definable spectrum.

- _size_: number of points in the table
- _x_: provides the left and right values _(-x, +x)_ of the interval over which the polynomial is to be drawn
- _a_: amplitude scaling factor of the sinusoid input that is expected to produce the spectrum at _h_
- _h0_: offset
- _h_: list of relative amplitudes of partials in waveshaped output signal

Quasi-sawtooth transfer function:

~~~
let h = [
	100 -50 -33 25 20 -16.7 -14.2 12.5 11.1 -10
	-9.09 8.333 7.69 -7.14 -6.67 6.25 5.88 -5.55 -5.26 5
];
513.gen13(1, 1, 0, h).linePlot
~~~

Quasi-square wave transfer function:

~~~
let h = [100 0 -33 0 20 0 -14.2 0 11.1 0 -9.09 0 7.69 0 -6.67 0 5.88 0 -5.26];
513.gen13(1, 1, 0, h).linePlot
~~~

Quasi-triangle wave transfer function:

~~~
let h = [100 0 -11.11 0 4 0 -2.04 0 1.23 0 -0.826 0 0.59 0 -0.444 0 0.346 0 -0.277];
513.gen13(1, 1, 0, h).linePlot
~~~

Transfer function:

~~~
let h = [1 -0.8 0 0.6 0 0 0 0.4 0 0 0 0 0.1 -0.2 -0.3 0.5];
513.gen13(1, 1, 0, h).linePlot
~~~

Transfer function, high partials, sometimes without a fundamental, give inharmonic spectra:

~~~
let h = [0 0 -0.1 0 0.3 0 -0.5 0 0.7 0 -0.9 0 1 0 -1 0];
513.gen13(1, 1, 0, h).linePlot
~~~

Another inharmonic spectra:

~~~
let h = [0 0 0 0 0 0 -1 0 1 0 0 -0.1 0 0.1 0 -0.2 0.3 0 -0.7 0 0.2 0 -0.1];
513.gen13(1, 1, 0, h).linePlot
~~~

Split a sinusoid into 3 odd-harmonic partials of relative strength _5-3-1_:

~~~
let h = [5 0 3 0 1];
513.gen13(1, 1, 0, h).linePlot
~~~

* * *

See also: Csound Gen Routines, gen03

References:
_Csound_
[1](https://www.csounds.com/manual/html/GEN13.html)
