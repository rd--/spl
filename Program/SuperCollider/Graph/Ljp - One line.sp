/* One line (ljp) */
let lfs = (lfSaw([1, 0.99], [0, 0.6]) * 2000 + 2000);
let sft = lfs.truncate([400, 600]) * [1, -1];
eqPan2(sinOsc(onePole(sft.sum, 0.98), 0), 0) / 10
