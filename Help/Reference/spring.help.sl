# spring

- _spring(in, spring, damp)_

Physical model of resonating spring.
Models the force of a resonating string

- in: modulated input force
- spring: spring constant (incl. mass)
- damp: damping

Trigger gate is mouse button, spring constant is `mouseX`,
`mouseY` controls damping,
modulate frequency with the force:

~~~spl syn=A
let inforce = k2A(mouseButton(0, 1, 0)) > 0;
let k = mouseY(0.1, 20, 1, 0.2);
let d = mouseX(0.00001, 0.1, 1, 0.2);
let outforce = spring(inforce, k, d);
let freq = outforce * 400 + 500;
sinOsc(freq, 0) * 0.2
~~~

Several springs in series.
Trigger gate is mouse button,
spring constant is `mouseX`,
`mouseY` controls damping,
modulate frequency with the force:

~~~spl syn=B
let d = mouseY(0.00001, 0.01, 1, 0.2);
let k = mouseX(0.1, 20, 1, 0.2);
let inforce = k2A(mouseButton(0, 1, 0)) > 0;
let m0 = spring(inforce, k, 0.01);
let m1 = spring(m0, 0.5 * k, d);
let m2 = spring(m0, 0.6 * k + 0.2, d);
let m3 = spring(m1 - m2, 0.4, d);
sinOsc(m3 * 200 + 500, 0) * 0.1
~~~

Modulating a resonating string with the force,
spring constant is `mouseX`,
`mouseY` controls damping:

~~~spl syn=C
let k = mouseX(0.5, 100, 1, 0.2);
let d = mouseY(0.0001, 0.01, 1, 0.2);
let t = dust(2);
let m0 = spring(toggleFf(t), 1 * k, 0.01);
let m1 = spring(m0, 0.5 * k, d);
let m2 = spring(m0, 0.6 * k, d);
let m3 = spring([m1, m2], 0.4 * k, d);
let m4 = spring(m3 - m1 + m2, 0.1 * k, d);
combL(
	t,
	0.1,
	linLin(m4, -10, 10, 1 / 8000, 1 / 100),
	12
)
~~~

* * *

See also: pluck

Guides: Unit Generators

Categories: Ugen
