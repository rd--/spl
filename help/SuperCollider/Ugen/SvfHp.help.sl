(* SvfHp ; changing F (slowly) *)
let f = XLine(20, 20000, 20);
SvfHp(WhiteNoise() * 0.1, f, 1)

(* SvfHp ; changing Q (slowly) *)
let q = Line(2, 0.0001, 20);
SvfHp(WhiteNoise() * 0.1, 400, q)

(* SvfHp ; modulating F *)
let f = SinOsc(XLine(0.7, 300, 20), 0) * 3600 + 4000;
SvfHp(Saw(200) * 0.1, f, 1)
