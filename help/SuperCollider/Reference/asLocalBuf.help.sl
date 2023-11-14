# asLocalBuf -- buffer

- _asLocalBuf(anArray) == LocalBuf(anArray)_

Make a local buffer from an array or matrix of numbers.

```
var scaleBuf = [0 2 3 5 7 8 10 12].asLocalBuf;
var mnn = BufRd(1, scaleBuf, MouseX(0, 8, 0, 0.2), 1, 1) + 48;
SinOsc(mnn.MidiCps, 0) * 0.1
```

In the matrix case the buffer will have multiple channels.

```
var scaleBuf = [0 2 3 5; 7 8 10 12].asLocalBuf;
var mnn = BufRd(2, scaleBuf, MouseX(0, 4, 0, 0.2), 1, 1) + 48;
SinOsc(mnn.MidiCps, 0) * 0.1
```

* * *

See also: LocalBuf
