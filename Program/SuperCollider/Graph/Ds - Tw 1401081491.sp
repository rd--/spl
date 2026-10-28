/* https://twitter.com/mclduk/status/1401081491 ; ds */
let x = line(0, [0.9, 1], 30);
5.timesRepeat {
	let o/1 = [
		{ :f | saw(f) },
		{ :f | sinOsc(f, 0) },
		{ :f | pulse(f, 0.5) }
	].atRandom;
	x := o(x.linLin(-1, 1, 10, 1000))
};
x * 0.1
