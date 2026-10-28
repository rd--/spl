/* balance2 */
balance2(lfSaw(44, 0), pulse(33, 0.5), sinOsc(0.5, 0), 0.1)

/* balance2 */
{ balance2(lfSaw(44, 0), pulse(33, 0.5), sinOsc(rand(0.25, 0.75), 0), 0.05) } !+ 2

/* balance2 ; with control rate position input */
{ balance2(lfSaw(44, 0), pulse(33, 0.5), sinOsc(rand(0.25, 0.75), 0).kr, 0.1) } !+ 2

/* balance2 */
let o = sinOsc([440, 550], 0);
balance2(o.first, o.second, lfNoise1(4), 0.1)

/* balance2 */
let o = sinOsc(440, 0);
balance2(o, o, sinOsc(0.2, 0), 0.1)

/* balance2 */
let o = sinOsc(440, 0);
balance2(o, o, mouseX(-1, 1, 0, 0.2), 0.2)
