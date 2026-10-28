/* sfPlay ; normal playback at same speed of recording ; loop ; requires=SfAcquire */
let sf = sfAcquireMono('Floating');
sfPlay(sf, 1, 1, 0, 1)

/* sfPlay ; normal playback at same speed of recording ; no loop, retrigger */
let sf = sfAcquireMono('Floating');
sfPlay(sf, 1, impulse(1 / sfDuration(sf), 0), 0, 0)

/* sfPlay ; mouse controls playback rate and re-trigger interval ; loop */
let sf = sfAcquireMono('Floating');
let rateMultiplier = mouseX(0.25, 4, 1, 0.2);
sfPlay(sf, rateMultiplier, 1, 0, 1)

/* sfPlay ; mouse controls playback rate and re-trigger interval ; no loop, retrigger */
let sf = sfAcquireMono('Floating');
let rateMultiplier = mouseX(0.25, 4, 1, 0.2);
sfPlay(sf, rateMultiplier, impulse(rateMultiplier / sfDuration(sf), 0), 0, 0)

/* sfPlay ; recursive scrubbing (adc) ; https://www.listarc.cal.bham.ac.uk/lists/sc-users-2002/msg00736.html */
let sf = sfAcquireMono('Floating');
let r = 10;
[1 .. 6].do { :i |
	r := lfNoise1(0.2 ^ i * 50) * r
};
sfPlay(sf, r, 1, [0, 18000], 1)

/* sfPlay ; floating dust (adc) ; https://www.listarc.cal.bham.ac.uk/lists/sc-users-2002/msg00736.html ; panning edit (rd) */
let sf = sfAcquireMono('Floating');
[0 .. 9].collect { :n |
	let r = 0.1 ^ (n - 1);
	[0 .. n].collect { :i |
		let a = (n - 2 < i).if {
			0.5
		} {
			0.1 ^ (n * 0.9 - 3.5 - i)
		};
		r := sfPlay(sf, r, 1, 0, 1) * a
	};
	eqPan2(r, rand(-1, 1))
}.mix

/* sfPlay ; 2 min (adc) ; https://www.listarc.cal.bham.ac.uk/lists/sc-users-2002/msg00736.html */
let sf = sfAcquireMono('Floating');
let l = xLine(1, 0.007, 120);
sfPlay(sf, decay(dust(1 / (l * l)) * l.signedSqrt, 1), 1, l, 1)
