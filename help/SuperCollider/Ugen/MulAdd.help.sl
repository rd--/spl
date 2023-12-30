(* MulAdd *)
MulAdd(SinOsc(440, 0), 0.1, 0.05)

(* MulAdd ; initialization rate *)
SinOsc([MulAdd(200, 2, 300), 200 * 2 + 300], 0) * 0.1

(* MulAdd ; control rate *)
var ctl = (freq: 200, mul: 2, add: 40).localControls;
SinOsc([MulAdd(ctl::freq, ctl::mul, ctl::add), 440], 0) * 0.1

(* MulAdd ; audio rate *)
MulAdd(SinOsc(440, 0), LfNoise2(1) * 0.1, LfNoise2(1) * 0.01)

(* MulAdd ; audio rate with control rate mul and add inputs *)
var ctl = (mul: 0.1, add: 0.05).localControls;
MulAdd(SinOsc(440, 0), ctl::mul, ctl::add)

(* MulAdd ; audio rate with constant mul and add inputs *)
MulAdd(SinOsc(440, 0), 0.1, 0.05)
