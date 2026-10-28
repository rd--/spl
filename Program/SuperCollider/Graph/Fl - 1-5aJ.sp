/* https://sccode.org/1-5aJ (fl) ; chaos engine hum */
let o = sinOsc(101, saw(0.12345) * 678 + 9) * 0.2 + 0.8;
let p = pulse([25, 25.5], 0.25) * 0.125 - 0.25;
let f = sinOsc([50, 51], 0) * o + p * 50 + 10;
sinOsc(f.kr, 0) * 0.5
