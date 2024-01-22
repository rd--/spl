{- https://sccode.org/1-4Qy ; f0 ; 0202 -}
{ :currentTime :each |
	let b = 0.1;
	let s = Dseq(9, [0, each % 9, 2, 3, 4, 0, 2, 1] * 150);
	let f = Duty(b, 0, s);
	let p = SinOsc(f, 0);
	let o = EqPan(SinOsc(each, p), each % 3 - 1) * b;
	o.playAt(currentTime + 0.5);
	[each % 5 + 1, each + 1]
}.scheduleInjecting(1)
