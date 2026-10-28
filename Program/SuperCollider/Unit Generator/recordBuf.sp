/* recordBuf ; simple delay line ; reader is playBuf and writer is recordBuf */
let buffer = bufAlloc(1, 48000 * 0.3).bufClear; /* allocate and clear a buffer for the delay line */
let input = decay(impulse(1, 0), 0.2) * pinkNoise(); /* make a percussive sound as input */
let delayedSignal = playBuf(1, buffer, 1, 1, 0.15, 1, 0); /* tap the delay line at 0.15 second delay */
let mixedSignal = (delayedSignal * 0.4) + input; /* mix the delayed signal with the input */
let writer = recordBuf(buffer, 0, 1, 0, 1, 1, 0, 0, mixedSignal); /* write the mixed signal to the delay line */
mixedSignal <! writer /* output the mixed signal */
