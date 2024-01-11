{- https://sccode.org/1-4Qy ; f0 ; 0004 -}
{ :currentTime |
	let z = 6 + 20.randomFloat;
	let d = 26 - z;
	{
		let y = LfTri(z, 0).Abs / 9 / z;
		let s = Rlpf(TDuty(y, 0, y), z * 600, 0.06);
		Release(EqPan(s, 0) * 4.5, d, 0, z)
	}.play;
	d
}.schedule
