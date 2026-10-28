/* tGrains ; requires=SfAcquire */
let numChannels = 2;
let sf = sfAcquireMono('CrotaleD6');
let triggerRate = mouseY(2, 120, 1, 0.2);
let trigger = impulse(triggerRate, 0);
let rate = 1.2 ^ (whiteNoise() * 3).round(1);
let centerPos = mouseX(0, sfDuration(sf), 0, 0.2);
let dur = 1.2 / triggerRate;
let pan = tRand(-1, 1, trigger);
let amp = 1 / 2;
let interp = 4;
tGrains(numChannels, trigger, sf, rate, centerPos, dur, pan, amp, interp)
