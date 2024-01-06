# Variable Keyword Syntax -- syntax

Rewrite rules:

- _let t, ..._; ⟹ _| t ... |_
- _let t = i, ...; let u = j, ..._ ⟹ _| t = i, ..., u = j, ...; |_

These rules implement a _var_ keyword syntax for declaring and initialising temporary variables.

Note that in the _without initializers_ form only one _var_ statement is allowed,
whereas in the _with initializers_ form a sequence of _var_ statements is allowed.

_Rationale_:  This is the SuperCollider syntax for temporary variables.  It can make programs that declare many variables, or that comment on variables between each declaration, clearer to read.  The program below is by James McCartney and is taken from the SuperCollider2 documentation.

```
(* ten voices of a random sine percussion sound *)
let s = { Resonz(Dust(0.2) * 50, Rand(200, 3200), 0.003) } !+ 10;
(* reverb predelay time *)
let z = DelayC(s, 0.048, 0.048);
(* seven length modulated comb delays in parallel *)
let y = { CombL(z, 0.1, LfNoise1(Rand(0, 0.1)) * 0.04 + 0.05, 15) } !+ 7;
(* two parallel chains of four allpass delays *)
4.timesRepeat { y := AllpassC(y, 0.050, [Rand(0, 0.050), Rand(0, 0.050)], 1) };
(* add original sound to reverb *)
s + (0.2 * y)
```

The [Initialised Temporaries Syntax] can also be quite clear, when offset and indented.

```
|(
	(* ten voices of a random sine percussion sound *)
	s = { Resonz(Dust(0.2) * 50, Rand(200, 3200), 0.003) } !+ 10,
	(* reverb predelay time *)
	z = DelayC(s, 0.048, 0.048),
	(* seven length modulated comb delays in parallel *)
	y = { CombL(z, 0.1, LfNoise1(Rand(0, 0.1)) * 0.04 + 0.05, 15) } !+ 7
)|
(* two parallel chains of four allpass delays *)
4.timesRepeat { y := AllpassC(y, 0.050, [Rand(0, 0.050), Rand(0, 0.050)], 1) };
(* add original sound to reverb *)
s + (0.2 * y)
```

* * *

See also: [Initialised Temporaries Syntax]
