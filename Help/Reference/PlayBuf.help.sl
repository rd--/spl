# PlayBuf

- _PlayBuf(numChannels, bufnum=0, rate=1, trigger=1, startPos=0, loop = 0, doneAction=0)_

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

```spl SfAcquire
let sf = SfAcquireMono('Floating');
PlayBuf(1, sf, 1, 0, 0, 1, 0)
```

Accelerating pitch:

```spl SfAcquire
let sf = SfAcquireMono('Floating');
let rate = XLine(0.1, 100, 60);
PlayBuf(1, sf, rate, 0, 0, 1, 0)
```

Sine wave control of playback rate. Negative rate plays backwards:

```spl SfAcquire
let sf = SfAcquireMono('Floating');
let rate = SinOsc(XLine(0.2, 8, 30), 0) * 2 + 0.1;
PlayBuf(1, sf, rate, 0, 0, 1, 0)
```

* * *

See also: BufRd

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/PlayBuf.html)

Categories: Ugen
