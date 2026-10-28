/* tScramble ; octaves, swaps channels on impulse, scramble may be identity */
let tr = impulse(1, 0);
sinOsc(tScramble(tr, [220, 440]), 0) * 0.1

/* tScramble ; c-major sin tones across stereo field, scrambles on impulse */
let tr = impulse(1, 0);
sinOsc(tScramble(tr, [60 62 64 65 67 69 71 72].midiCps), 0).splay * 0.1

/* tScramble ; initially unscrambled */
let tr = dust(1);
sinOsc(tScramble(tr, [60 62 64 65 67 69 71 72].midiCps), 0).splay * 0.1

/* tScramble ; c-major sin tones across stereo field, scrambles on impulse */
let tr = impulse(1, 0);
sinOsc(tScramble(tr, [60 62 64 65 67 69 71 72].midiCps), 0).splay * 0.1

/* tScramble ; sequences of different lengths, scrambled */
let a = [1 2 3; 1 2 3 4 5; 1 2 3 4 5 6 7];
let t1 = impulse(1 / 5, 0);
let t2 = impulse(5, 0);
let m = tChoose(t1, a.collect { :x | demand(t2, 0, dseq(Infinity, tScramble(t1, x))) });
let c = sinOsc(1200, 0) * decay(t1, 1) * 0.1;
sinOsc(m * 110, 0) * 0.1 + c

/* tScramble ; reference */
sinOsc([60 62 64 65 67 69 71 72].midiCps, 0).splay * 0.1
