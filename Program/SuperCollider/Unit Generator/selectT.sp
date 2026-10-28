/* selectT ; list expansion at first input */
let m = [0 2 3 5 7 9] + 48;
let k = m.size + 1;
let x = mouseX(0, k, 0, 0.2);
let y = mouseY(0, k, 0, 0.2);
sinOsc(selectT([x, y], m).midiCps, 0) * 0.1
