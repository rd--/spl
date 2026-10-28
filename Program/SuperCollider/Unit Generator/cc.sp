/* cc ; continuous controller ; one indexed */
let f = lag(cc(1), 0.1) * 110 + 110;
let nh = lag(cc(2), 0.2) * 9 + 1;
let a = lag(cc(3), 0.3) * 0.1;
let p = lag(cc(4), 0.4) * 2 - 1;
pan2(blip(f, nh) * a, p, 1)
