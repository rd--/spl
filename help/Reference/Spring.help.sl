# Spring -- physical model of resonating spring

_Spring(in, spring, damp)_

Models the force of a resonating string

- in: modulated input force
- spring: spring constant (incl. mass)
- damp: damping

Trigger gate is mouse button, spring constant is _MouseX_, _MouseY_ controls damping, modulate frequency with the force:

```
let inforce = K2A(MouseButton(0, 1, 0)) > 0;
let k = MouseY(0.1, 20, 1, 0.2);
let d = MouseX(0.00001, 0.1, 1, 0.2);
let outforce = Spring(inforce, k, d);
let freq = outforce * 400 + 500;
SinOsc(freq, 0) * 0.2
```

Several springs in series. Trigger gate is mouse button, spring constant is _MouseX_, _MouseY_ controls damping, modulate frequency with the force:

```
let d = MouseY(0.00001, 0.01, 1, 0.2);
let k = MouseX(0.1, 20, 1, 0.2);
let inforce = K2A(MouseButton(0, 1, 0)) > 0;
let m0 = Spring(inforce, k, 0.01);
let m1 = Spring(m0, 0.5 * k, d);
let m2 = Spring(m0, 0.6 * k + 0.2, d);
let m3 = Spring(m1 - m2, 0.4, d);
SinOsc(m3 * 200 + 500, 0) * 0.1
```

Modulating a resonating string with the force, spring constant is _MouseX_, _MouseY_ controls damping:

```
let k = MouseX(0.5, 100, 1, 0.2);
let d = MouseY(0.0001, 0.01, 1, 0.2);
let t = Dust(2);
let m0 = Spring(ToggleFf(t), 1 * k, 0.01);
let m1 = Spring(m0, 0.5 * k, d);
let m2 = Spring(m0, 0.6 * k, d);
let m3 = Spring([m1, m2], 0.4 * k, d);
let m4 = Spring(m3 - m1 + m2, 0.1 * k, d);
CombL(t, 0.1, LinLin(m4, -10, 10, 1/8000, 1/100), 12)
