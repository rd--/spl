/* resonators harmonic series (jmcc) #2 ; just diatonic scale */
{
	let p = 12;
	let noise = BrownNoise() * 0.001;
	let rat = [1.0 1.125 1.25 1.333 1.5 1.667 1.875 2.0 2.25 2.5 2.667 3.0 3.333 3.75 4.0];
	let freq0 = rat.atRandom * 120;
	let frequencies = 1:p.collect { :i |
		i * freq0 + Rand(-0.5, 0.5)
	};
	let amplitudes = 1 / 1:p;
	let ringtimes = { Rand(0.5, 4.5) } ! p;
	{
		RingzBank(noise, frequencies, amplitudes, ringtimes)
	} ! 2
}.xfade(1, 7)
