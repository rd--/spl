/* inFb ; assumes graph is writing to bus zero */
let input = inFb(1, 0);
sinOsc(input * 1300 + 300, 0) * 0.4
