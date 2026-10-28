/* https://www.mcld.co.uk/cymbalsynthesis/ ; 5 */
let lowCutoffEnv = perc(1, 0.5, 5, -4) * 20000 + 10;
let lowDriver = lpf(whiteNoise() * 0.1, lowCutoffEnv);
let highCutoffEnv = 10001 - (perc(1, 1, 3, -4) * 10000);
let highDriver = hpf(whiteNoise() * 0.1, highCutoffEnv) * perc(1, 1, 2, -4) * 0.25;
let thwack = perc(1, 0.001, 0.001, -4);
let freq = { expRand(300, 20000) } ! 100;
let res = ringz(lowDriver + highDriver + thwack, freq, 1).mean;
List(2, ((res * 1) + (lowDriver * 2) + thwack)) * 0.25
