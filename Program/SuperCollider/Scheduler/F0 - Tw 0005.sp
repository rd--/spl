/* https://sccode.org/1-4Qy ; F0 ; 0005 */
{ :currentTime |
	let z = (1 -- 61).atRandom;
	let d = z / 3;
	let y = lfTri(z, 0).abs / z;
	let s = rlpf(
		tDuty(y, 0, y),
		z * 99 + y,
		0.01
	) * (6 + y);
	release(
		eqPan(s, 0) / 3,
		d, 0, z
	).playAt(currentTime);
	d
}.schedule
