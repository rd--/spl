# Sos

- _Sos(in, a0, a1, a2, b1, b2)_

A standard second order filter section.
Alias for `SecondOrderFilterSection`.
Filter coefficients are given directly rather than calculated for you.
Formula is equivalent to _y(i)=a0·x(i)+a1·x(i-1)+a2·x(i-2)+b1·y(i-1)+b2·y(i-2)_.

Same as `TwoPole`:

```
let theta = MouseX(0.2.pi, 1.pi, 0, 0.2);
let rho = MouseY(0.6, 0.99, 0, 0.2);
let b1 = 2 * rho * theta.Cos;
let b2 = rho.square.-;
SecondOrderFilterSection(
	LfSaw(200, 0) * 0.1,
	1,
	0,
	0,
	b1,
	b2
)
```

* * *

See also: Fos

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SOS.html)

Categories: Ugen, Filter
