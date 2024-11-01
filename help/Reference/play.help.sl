# play

- _play(aUgen | anEventStream)_

Compile Ugen graph and send it to the synthesiser to be played.

```
(SinOsc(440, 0) * 0.1).play
```

Lists of Ugens signals:

```
[
	SinOsc(333, 0) * 0.1,
	Saw(111) * 0.02
].play
```

* * *

See also: List, Ugen

Categories: Synthesiser
