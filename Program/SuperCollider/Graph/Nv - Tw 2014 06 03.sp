/* http://twitter.com/headcube/status/474064500564324352 (nv) ; packet size */
let k = 9;
{
	let f = [1 .. 8].collect{ :ix |
		{
			lfPulse(2 ^ iRand(-9, 1), iRand(0, 2) / 2, 0.5)
		} !* (ix + 1) / ix + 1
	}.product * 86;
	pluck(bpf(f, f, 1).sin, saw(440), 1 , 1 / f, 9, 0.5)
} !^ k * 0.2
