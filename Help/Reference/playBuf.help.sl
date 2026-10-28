# playBuf

- _playBuf(numChannels, bufnum=0, rate=1, trigger=1, startPos=0, loop = 0, doneAction=0)_

Sample playback oscillator
Plays back a memory resident sample.

- numChannels: number of channels
- bufnum: a signal buffer
- rate: playback rate, 1 is normal, 2 is one octave up, 0.5 is one octave down, -1 is backwards normal rate. Interpolation is cubic.
- trigger: A trigger causes a jump to the startPos
- startPos: sample frame to start playback
- loop: 1 means true, 0 means false
- doneAction: action to be executed when the buffer is finished playing

Normal playback at same speed of recording:

```spl sfAcquire
let sf = sfAcquireMono('Floating');
playBuf(1, sf, 1, 0, 0, 1, 0)
```

Accelerating pitch:

```spl sfAcquire
let sf = sfAcquireMono('Floating');
let rate = xLine(0.1, 100, 60);
playBuf(1, sf, rate, 0, 0, 1, 0)
```

Sine wave control of playback rate.
Negative rate plays backwards:

```spl sfAcquire
let sf = sfAcquireMono('Floating');
let rate = sinOsc(xLine(0.2, 8, 30), 0) * 2 + 0.1;
playBuf(1, sf, rate, 0, 0, 1, 0)
```

* * *

See also: bufRd

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/PlayBuf.html)

Categories: Ugen
