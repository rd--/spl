(* sawed cymbals (jmcc) #9 *)
var sustainTime = 4;
var transitionTime = 4;
var dur = transitionTime * 2 + sustainTime;
{
	var p = 15; (* number of partials per channel per 'cymbal' *)
	var f1 = 500 + 2000.Rand0;
	var f2 = 8000.Rand0;
	var frequencies = { f1 + f2.Rand0 } ! p;
	var ringTimes = { 2 + 4.Rand0 } ! p;
	var osc = LfSaw(XLine(600.Rand0, 600.Rand0, dur), 0) * 0.0005;
	RingzBank(osc, frequencies, nil, ringTimes)
}.overlap(sustainTime, transitionTime, 6)
