# setharesDissonance

- _setharesDissonance(p, q)_

Answer the Sethares dissonance function for the spectra _p_ and _q_,
which each have the form _[f₁ u₁; f₂ u₂; …]_,
where _f_ are frequencies, in hertz and _u_ are amplitudes.

Plot the Sethares dissonance function over one octave of a nine-partial harmonic series with the specified reference frequency:

~~~spl svg=A
let f0 = 880;
let h = { :x |
	1:9.collect { :r |
		[x * r, 1]
	}
};
let h1 = h(f0);
0:1200:2.centsToRatio.collect { :r |
	setharesDissonance(h1, h(f0 * r))
}.linePlot
~~~

![](sw/spl/Help/Image/setharesDissonance-A.svg)

Calculate cents values of the minima of the dissonance function:

```
>>> let f0 = 880;
>>> let h = { :x |
>>> 	1:9.collect { :r |
>>> 		[x * r, 1]
>>> 	}
>>> };
>>> let h1 = h(f0);
>>> let x = 0:1200:2;
>>> let i = x.centsToRatio.collect { :r |
>>> 	let h2 = h(f0 * r);
>>> 	-1 * setharesDissonance(h1, h2)
>>> }.findPeaks.collect(first:/1);
>>> x @* i
[
	  0  204  232  266  316
	386  434  498  582  702
	814  884  968 1018 1200
]
```

* * *

See also: barlowDisharmonicity, plompLeveltDissonance

Guides: Xenharmonic Functions

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/User:Sintel/Validation_of_common_consonance_measures)
