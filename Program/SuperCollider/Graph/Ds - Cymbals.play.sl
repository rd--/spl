/* https://www.mcld.co.uk/cymbalsynthesis/ ; 5 */
let lowCutoffEnv = Perc(1, 0.5, 5, -4) * 20000 + 10;
let lowDriver = Lpf(WhiteNoise() * 0.1, lowCutoffEnv);
let highCutoffEnv = 10001 - (Perc(1, 1, 3, -4) * 10000);
let highDriver = Hpf(WhiteNoise() * 0.1, highCutoffEnv) * Perc(1, 1, 2, -4) * 0.25;
let thwack = Perc(1, 0.001, 0.001, -4);
let freq = { ExpRand(300, 20000) } ! 100;
let res = Ringz(lowDriver + highDriver + thwack, freq, 1).mean;
((res * 1) + (lowDriver * 2) + thwack) ! 2 * 0.25
