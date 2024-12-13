# Gendy1

- _Gendy1(ampdist=1, durdist=1, adparam=1, ddparam=1, minfreq=440, maxfreq=660, ampscale=0.5, durscale=0.5, initCPs=12, knum)_

Dynamic stochastic synthesis generator.

- ampdist: Choice of probability distribution for the next perturbation of the amplitude of a control point.
- durdist: Choice of distribution for the perturbation of the current inter control point duration
- adparam: A parameter for the shape of the amplitude probability distribution, requires values in the range 0.0001 to 1
- ddparam: A parameter for the shape of the duration probability distribution, requires values in the range 0.0001 to 1
- minfreq: Minimum allowed frequency of oscillation for the Gendy1 oscillator, i.e. largest period of the duration
- maxfreq: Maximum allowed frequency of oscillation for the Gendy1 oscillator, i.e. smallest period of the duration
- ampscale: Normally 0 to 1, multiplier for the distribution delta value for amplitude
- durscale: Normally 0 to 1, multiplier for the distribution delta value for duration
- initCPs: Initialise the number of control points in the memory. Xenakis specifies 12
- knum: Current number of utilised control points

An implementation of the dynamic stochastic synthesis generator conceived by Iannis Xenakis,
and described in _Formalized Music_ (Xenakis 1992).
The BASIC program in the book was written by Marie-Helene Serra.

The possible amplitude distributions are:
0: linear,
1: Cauchy,
2: logistic,
3: hyperbolic cosine,
4: arc sine,
5: exponential,
6: sinus.

A texture:

```
{
	let freq = Gendy1(
		IRand(0, 6),
		IRand(0, 6),
		SinOsc(0.1, 0) * 0.49 + 0.51,
		SinOsc(0.13, 0) * 0.49 + 0.51,
		Rand(130, 160.3),
		Rand(130, 160.3),
		SinOsc(0.17, 0) * 0.49 + 0.51,
		SinOsc(0.19, 0) * 0.49 + 0.51,
		12,
		12
	) * 200 + 400;
	EqPan(
		SinOsc(
			freq,
			0
		),
		Rand(-1, 1)
	) * 0.1
} !+ 10
```

At `Record`, a texture graph with mouse control:

```
let n = 11;
Resonz(
	{
		let freq = Rand(50, 560.3);
		let numCps = Rand(2, 20);
		let kNum = MulAdd(
			SinOsc(ExpRand(0.02, 0.2), 0),
			numCps / 2,
			numCps / 2
		);
		let osc = Gendy1(
			ampDist: Rand(0, 6),
			durDist: Rand(0, 6),
			adParam: Rand(0, 1),
			ddParam: Rand(0, 1),
			minFreq: freq,
			maxFreq: freq,
			ampScale: Rand(0, 1),
			durScale: Rand(0, 1),
			initCps: numCps,
			kNum: kNum.kr
		);
		EqPan2(
			osc,
			Rand(-1, 1)
		) * 0.5 / n.sqrt
	} !+ n,
	MouseX(100, 2000, 0, 0.2),
	MouseY(0.01, 1.0, 0, 0.2)
)
```

An overlapping texture program:

~~~
{
	let n = 11;
	{
		let freq = Rand(50, 560.3);
		let numCps = Rand(2, 20);
		let kNum = SinOsc(
			ExpRand(0.02, 0.2),
			0
		).LinLin(-1, 1, 0, numCps);
		let osc = Gendy1(
			ampDist: Rand(0, 6),
			durDist: Rand(0, 6),
			adParam: Rand(0, 1),
			ddParam: Rand(0, 1),
			minFreq: freq,
			maxFreq: freq,
			ampScale: Rand(0, 1),
			durScale: Rand(0, 1),
			initCps: numCps,
			kNum: kNum.kr
		);
		EqPan2(
			osc,
			Rand(-1, 1)
		) * 0.1 / n.sqrt
	} !+ n
}.overlapTextureProgram(4, 5, 3)
~~~

* * *

See also: Gendy2, Gendy3

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Gendy1.html)

Further Reading: Hoffmann 2002, Hoffmann 2004, Serra 1993, Xenakis 1992

Categories: Ugen
