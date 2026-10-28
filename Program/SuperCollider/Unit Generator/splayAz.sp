/* splayAz ; Stereo ; 2->2 */
let osc = sinOsc([333, 555], 0) * 0.1;
let orientation = mouseX(0, 1, 0, 0.2);
splayAz(2, osc, 1, 1, 2, 0, orientation, true)

/* splayAz ; Octophonic ; 2->8 ; Formerly error, also at Sc */
let osc = sinOsc([333, 555], 0) * 0.1;
let orientation = mouseX(0, 1, 0, 0.2);
splayAz(8, osc, 1, 1, 2, 0, orientation, true)

/* splayAz ; Octophonic ; 24->8 */
let numChannels = 8;
let numVoices = 24;
let orientation = 0;
let inList = [1 .. numVoices].collect { :each |
	sinOsc(lfNoise2(rand(10, 20)) * 200 + (each * 50 + 400), 0) * 0.1
};
splayAz(8, inList, 1, 1, 2, 0, orientation, true)
