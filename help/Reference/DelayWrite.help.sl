# DelayWrite

_DelayWrite(buffer, input)_

- buffer: the memory for the delay line
- input: the input signal to write to the delay line

DelayWrite and DelayTap implement delay line reading and writing in separate objects. This lets you put processing in the feedback loop, or granulate a delay line, or implement a ping pong delay or other feedback network. The DelayTap unit generators read from the delay line and DelayWrite writes to it. You must supply a Buffer long enough to hold the maximum delay time you will require. You do not need to initialize the buffer. The maximum delay time is the length of the buffer minus the block size. The minimum delay time is equal to the block size + 1. A single delay line may have any number of Taps but only one DelayWrite. The same buffer should be supplied to the DelayWrite and all DelayTap unit generators which are part of the same delay line.

TapN uses no interpolation, TapL uses linear interpolation, TapA uses all pass interpolation.

The output of DelayWrite is just a copy of the input signal. The output of DelayWrite is usually not needed, but it must be in the call graph of the Synth. In order to acheive this you will usually use the _<!_ operator which returns the first argument but ignores the second. This is just a bit of prestidigitation to give the DelayWrite object an order in the call graph. Otherwise, if the Synth object is unable to trace up the graph and find theDelayWr object, it will never get called and the Taps will produce either garbage or silence. The use of _<!_ is shown below. Also see the help for _<!_.

Simple feedback delay (if this is all you want, Comb is easier to use):

```
{- allocate a buffer for the delay line -}
let buffer = BufAlloc(1, 48000 * 0.3).BufClear;
{- make a percussive sound as input -}
let input = Decay(Impulse(1, 0), 0.2) * PinkNoise();
{- tap the delay line at 0.15 second delay -}
let delayedSignal = DelayTap(buffer, 0.15);
{- mix the delayed signal with the input -}
let mixedSignal = (delayedSignal * 0.4) + input;
{- write the mixed signal to the delay line -}
let writer = DelayWrite(buffer, mixedSignal);
{- output the mixed signal -}
mixedSignal <! writer
```

Ping pong delay:

```
{- allocate a buffer for the left delay line -}
let leftBuffer = BufAlloc(1, 48000 * 0.4).BufClear;
{- allocate a buffer for the right delay line -}
let rightBuffer = BufAlloc(1, 48000 * 0.4).BufClear;
{- make a percussive sound as input -}
let input = Decay(Impulse(0.4, 0), 0.1) * PinkNoise();
{- tap the left delay line -}
let leftDelayedSignal = DelayTap(leftBuffer, 0.3);
{- tap the left delay line -}
let rightDelayedSignal = DelayTap(rightBuffer, 0.3);
{- mix the delayed signal with the input -}
let output = [leftDelayedSignal + input, rightDelayedSignal];
{- scale delay signal -}
let toDelay = output * 0.8;
{- feedback to buffers in reverse order -}
let writer = DelayWrite([rightBuffer, leftBuffer], toDelay);
{- output with writer attached to graph -}
output <! writer
```

Distortion in the feedback loop:

```
{- allocate a buffer for the delay line -}
let buffer = BufAlloc(1, 48000 * 0.3).BufClear;
{- sine pulse -}
let input = FSinOsc(1000, 0) * LfPulse(0.3, 0, 0.05) * 0.3;
{- tap the delay line at 0.15 second delay and distort -}
let delayedSignal = DelayTap(buffer, 0.15).Distort;
{- mix the delayed signal with the input -}
let mixedSignal = (delayedSignal * 0.8) + input;
{- write the mixed signal to the delay line -}
let writer = DelayWrite(buffer, mixedSignal);
{- output the mixed signal -}
mixedSignal <! writer
```

Pitch shift in the feedback loop:

```
{- allocate a buffer for the delay line -}
let buffer = BufAlloc(1, 48000 * 0.3).BufClear;
{- sine pulse -}
let input = FSinOsc(1000, 0) * LfPulse(0.3, 0, 0.05) * 0.3;
{- tap the delay line at 0.15 seconds -}
let delayed = DelayTap(buffer, 0.15);
{- apply pitch shift -}
let shifted = PitchShift(delayed, 0.2, 5 / 7, 0.01, 0.01);
{- mix the delayed signal with the input -}
let mixedSignal = (shifted * 0.8) + input;
{- write the mixed signal to the delay line -}
let writer = DelayWrite(buffer, mixedSignal);
{- output the mixed signal -}
mixedSignal <! writer
```

* * *

See also: DelayWrite
