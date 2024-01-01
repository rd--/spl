# play -- synthesiser control

- _play(aBlock)_

Evaluate _aBlock()_ and if the answer is a synthesiser value send it to the synthesiser to be played.

```
{ SinOsc(440, 0) * 0.1 }.play
```

* * *

See also: Block
