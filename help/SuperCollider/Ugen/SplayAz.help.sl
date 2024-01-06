(* SplayAz ; Stereo ; 2->2 *)
let osc = SinOsc([333, 555], 0) * 0.1;
let orientation = MouseX(0, 1, 0, 0.2);
SplayAz(2, osc, 1, 1, 2, 0, orientation, true)

(* SplayAz ; Octophonic ; 2->8 ; Formerly error, also at Sc *)
let osc = SinOsc([333, 555], 0) * 0.1;
let orientation = MouseX(0, 1, 0, 0.2);
SplayAz(8, osc, 1, 1, 2, 0, orientation, true)

(* SplayAz ; Octophonic ; 24->8 *)
let numChannels = 8;
let numVoices = 24;
let orientation = 0;
let inArray = (1 .. numVoices).collect { :each |
	SinOsc(LfNoise2(Rand(10, 20)) * 200 + (each * 50 + 400), 0) * 0.1
};
SplayAz(8, inArray, 1, 1, 2, 0, orientation, true)
