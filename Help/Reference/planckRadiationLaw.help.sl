# planckRadiationLaw

- _planckRadiationLaw(nuOrLambda, t)_

Answer the spectral radiance for the specified temperature (in Kelvins) and either frequency (ν, in hertz) or wavelength (λ, in metres).
The function decides whether _nu_ or _lambda_ has been specified by considering the magnitude,
_nu_ will be very large (greater than `one`),
and _lamdba_ will be vert small (less than `one`).
The answer is in the appropriate SI units.

Specified as frequency (ν, in hertz):

```
>>> 12.1E9.planckRadiationLaw(1E4)
4.49811E-16
```

Specified as wavelength (λ, in metres):

```
>>> 500E-9.planckRadiationLaw(1E4)
2.27261E14
```

Plot specifying as wavelength, scaling output:

~~~spl svg=A
let t = 5777;
(1E-9 -- 3E-6).functionPlot { :lambda |
	let r = lambda.planckRadiationLaw(t);
	r * 1E-12
}
~~~

![](sw/spl/Help/Image/planckRadiationLaw-A.svg)

* * *

See also: boltzmannConstant, planckConstant, plancksRadiationFunction, speedOfLight

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/PlanckRadiationLaw.html),
_W_
[1](https://en.wikipedia.org/wiki/Planck%27s_law)
