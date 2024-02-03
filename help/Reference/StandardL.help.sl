# StandardL -- chaos

Standard map chaotic generator.

The standard map is an area preserving map of a cylinder discovered by the plasma physicist Boris Chirikov.

_StandardL(freq=22050, k=1, xi=0.5, yi=0)_

- freq: Iteration frequency in Hertz
- k: Perturbation amount
- xi: Initial value of x
- yi: Initial value of y

Vary frequency:

```
StandardL(MouseX(20, SampleRate(), 0, 0.2), 1, 0.5, 0) * 0.1
```

Mouse-controlled _k_ parameter:

```
StandardL(SampleRate() / 2, MouseX(0.9, 4, 0, 0.2), 0.5, 0) * 0.1
```

As frequency control:

```
SinOsc(StandardL(40, MouseX(0.9, 4, 0, 0.2), 0.5, 0) * 800 + 900, 0) * 0.1
