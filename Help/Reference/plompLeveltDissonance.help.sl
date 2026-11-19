# plompLeveltDissonance

- _plompLeveltDissonance(f₁, f₂, u₁, u₂)_

Answer the Plomp-Levelt dissonance function.
_f₁_ and _f₂_ are frequencies, in hertz, and _u₁_ and _u₂_ are amplitudes.

Plot the Plomp-Levelt dissonance function over one octave with the specified reference frequencies:

~~~spl svg=A
[125.0 250.0 500.0 1000.0 2000.0].collect { :f1 |
	(0.0, 10.0 .. 1200.0).collect { :c |
		let f2 = f1 * c.centsToRatio;
		plompLeveltDissonance(
			f1, f2,
			1.0, 1.0
		)
	}
}.linePlot
~~~

![](Help/Image/plompLeveltDissonance-A.svg)

* * *

See also: barlowDisharmonicity, setharesDissonance

Guides: Xenharmonic Functions

Further Reading: Plomp and Levelt 1965
