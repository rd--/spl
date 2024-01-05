(* String wander-cluster (Jmcc) #6 *)
{
	var note1 = 50 + 50.IRand0;
	var note2 = Fold(note1 + 15.IRand0 - 7, 50, 120);
	var delay = 1 / note2.MidiCps;
	EqPan(CombC(WhiteNoise() * 0.008, 0.01, delay, delay * 1000), 1.Rand2)
}.overlap(4 / 3, 4 / 3, 6)
