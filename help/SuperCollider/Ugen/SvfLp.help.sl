(* SvfLp ; changing F *)
let f = XLine(20, 20000, 20);
SvfLp(WhiteNoise() * 0.1, f, 1)

(* SvfLp ; changing Q *)
let q = Line(2, 0.0001, 20);
SvfLp(WhiteNoise() * 0.1, 400, q)

(* SvfLp *)
let f = SinOsc(XLine(0.7, 300, 20), 0) * 3600 + 4000;
SvfLp(Saw(200) * 0.1, f, 1)
