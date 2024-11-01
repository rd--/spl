/* Landon rose (Jmcc) #8 ; edit (simpler, Rd) */
let ringTimes = 3 # 4;
let noteList = [
	32 43 54 89;
	10 34 80 120;
	67 88 90 100;
	14 23 34 45;
	76 88 99 124
];
{ :currentTime |
	RingzBank(
		Release(PinkNoise(0.001 # 2, 0), 2, 1, 2),
		noteList.atRandom.MidiCps,
		1,
		ringTimes
	).playAt(currentTime);
	2
}.schedule
