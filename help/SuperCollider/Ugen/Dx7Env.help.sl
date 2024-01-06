(* Dx7Env *)
let r1 = 35, r2 = 64, r3 = 55, r4 = 25;
let l1 = 99, l2 = 65, l3 = 75, l4 = 0;
let ol = 99;
let gate = MouseButton(0, 1, 0.2);
let data = 0;
SinOsc(440, 0) * Dx7Env(gate, data, r1, r2, r3, r4, l1, l2, l3, l4, ol) * 0.1
