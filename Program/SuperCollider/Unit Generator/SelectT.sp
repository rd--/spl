/* SelectT ; list expansion at first input */
let m = [0 2 3 5 7 9] + 48;
let k = m.size + 1;
let x = MouseX(0, k, 0, 0.2);
let y = MouseY(0, k, 0, 0.2);
SinOsc(SelectT([x, y], m).midiCps, 0) * 0.1
