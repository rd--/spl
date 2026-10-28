/* use pitchShift to granulate input ; upper left corner is normal playback ; x = pitch dispersion, y = time dispersion */
let grainSize = 0.1;
let in = audioIn([1, 2]) * 0.5;
let x = mouseX(0, 1, 0, 0.2);
let y = mouseY(0, grainSize, 0, 0.2);
pitchShift(in, grainSize, 1, x, y)
