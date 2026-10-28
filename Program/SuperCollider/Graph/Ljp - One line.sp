/* One line (ljp) */
let lfs = (LfSaw([1, 0.99], [0, 0.6]) * 2000 + 2000);
let sft = lfs.truncate([400, 600]) * [1, -1];
EqPan2(SinOsc(OnePole(sft.sum, 0.98), 0), 0) / 10
