# gendy1

- _gendy1(ampdist=1, durdist=1, adparam=1, ddparam=1, minfreq=440, maxfreq=660, ampscale=0.5, durscale=0.5, initCPs=12, knum=initCPs)_

Dynamic stochastic synthesis generator.

- ampdist: Choice of probability distribution for the next perturbation of the amplitude of a control point.
- durdist: Choice of distribution for the perturbation of the current inter control point duration
- adparam: A parameter for the shape of the amplitude probability distribution, requires values in the range 0.0001 to 1
- ddparam: A parameter for the shape of the duration probability distribution, requires values in the range 0.0001 to 1
- minfreq: Minimum allowed frequency of oscillation for the gendy1 oscillator, i.e. largest period of the duration
- maxfreq: Maximum allowed frequency of oscillation for the gendy1 oscillator, i.e. smallest period of the duration
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

~~~spl syn=A
{
	let freq = gendy1(
		iRand(0, 6),
		iRand(0, 6),
		sinOsc(0.1, 0) * 0.49 + 0.51,
		sinOsc(0.13, 0) * 0.49 + 0.51,
		rand(130, 160.3),
		rand(130, 160.3),
		sinOsc(0.17, 0) * 0.49 + 0.51,
		sinOsc(0.19, 0) * 0.49 + 0.51,
		12,
		12
	) * 200 + 400;
	eqPan(
		sinOsc(
			freq,
			0
		),
		rand(-1, 1)
	) * 0.1
} !+ 10
~~~

At `Record`, a texture graph with mouse control:

~~~spl syn=B
let n = 11;
resonz(
	{
		let freq = rand(50, 560.3);
		let numCps = rand(2, 20);
		let kNum = (
			sinOsc(expRand(0.02, 0.2), 0)
			* (numCps / 2)
			+ (numCps / 2)
		);
		let osc = gendy1(
			ampDist: rand(0, 6),
			durDist: rand(0, 6),
			adParam: rand(0, 1),
			ddParam: rand(0, 1),
			minFreq: freq,
			maxFreq: freq,
			ampScale: rand(0, 1),
			durScale: rand(0, 1),
			initCps: numCps,
			kNum: kNum.kr
		);
		eqPan2(
			osc,
			rand(-1, 1)
		) * 0.5 / n.sqrt
	} !+ n,
	mouseX(100, 2000, 0, 0.2),
	mouseY(0.01, 1.0, 0, 0.2)
)
~~~

An overlapping texture program:

~~~spl texture
{
	let n = 11;
	{
		let freq = rand(50, 560.3);
		let numCps = rand(2, 20);
		let kNum = sinOsc(
			expRand(0.02, 0.2),
			0
		).linLin(-1, 1, 0, numCps);
		let osc = gendy1(
			ampDist: rand(0, 6),
			durDist: rand(0, 6),
			adParam: rand(0, 1),
			ddParam: rand(0, 1),
			minFreq: freq,
			maxFreq: freq,
			ampScale: rand(0, 1),
			durScale: rand(0, 1),
			initCps: numCps,
			kNum: kNum.kr
		);
		eqPan2(
			osc,
			rand(-1, 1)
		) * 0.1 / n.sqrt
	} !+ n
}.overlapTextureProgram(4, 5, 3)
~~~

* * *

See also: gendy2, gendy3

Guides: Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/gendy.html)
_SuperCollider_
[1](https://doc.sccode.org/Classes/Gendy1.html)

Further Reading: Hoffmann 2002, Hoffmann 2004, Serra 1993, Xenakis 1992

Categories: Ugen
