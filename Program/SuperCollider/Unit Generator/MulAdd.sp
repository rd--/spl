/* *+ */
*+(SinOsc(440, 0), 0.1, 0.05)

/* *+ ; initialization rate */
SinOsc([*+(200, 2, 300), 200 * 2 + 300], 0) * 0.1

/* *+ ; control rate */
let ctl = (freq: 200, mul: 2, add: 40).localControls;
SinOsc([*+(ctl::freq, ctl::mul, ctl::add), 440], 0) * 0.1

/* *+ ; audio rate */
*+(SinOsc(440, 0), LfNoise2(1) * 0.1, LfNoise2(1) * 0.01)

/* *+ ; audio rate with control rate mul and add inputs */
let ctl = (mul: 0.1, add: 0.05).localControls;
*+(SinOsc(440, 0), ctl::mul, ctl::add)

/* *+ ; audio rate with constant mul and add inputs */
*+(SinOsc(440, 0), 0.1, 0.05)
