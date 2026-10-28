/* http://twitter.com/n_peeq_t/status/1264595510217719809 */
let b = 25;
let s = decay(dust(5), 1) * sinOsc(b * sinOsc(b, 0) * b, 0);
let f = resonz(s, b ^ 2 * lfNoise0(5).abs + b, 0.1);
gVerb(f, b, 4, 0.1, 0.3, 2, 1, 0.7, 0.5, 300) * 0.2
