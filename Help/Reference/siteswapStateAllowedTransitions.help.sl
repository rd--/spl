# siteswapStateAllowedTransitions

- _siteswapStateAllowedTransitions(σ)_

Answer the list of allowed transitions for the siteswap state _σ_.

The allowed transitions for the state space of D₃:

```
>>> [
>>> 	0 0 1 1 1;
>>> 	0 1 0 1 1;
>>> 	0 1 1 0 1;
>>> 	0 1 1 1 0;
>>> 	1 0 0 1 1;
>>> 	1 0 1 0 1;
>>> 	1 0 1 1 0;
>>> 	1 1 0 0 1;
>>> 	1 1 0 1 0;
>>> 	1 1 1 0 0
>>> ].collect(
>>> 	siteswapStateAllowedTransitions:/1
>>> )
[
	0;
	0;
	0;
	0;
	1 2 5;
	1 3 5;
	1 4 5;
	2 3 5;
	2 4 5;
	3 4 5
]
```

* * *

See also: isSiteswap, siteswapStateTransition

Guides: Combinatorial Functions
