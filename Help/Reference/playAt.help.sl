# playAt

- _playAt(x, t)_

Play _x_ at time _t_, which is in _session_ time, not _absolute_ time.

Schedule an enveloped and self-deleting quiet sine oscillator to play in five seconds from now:

```
let x = Release(
	SinOsc(440, 0) * 0.1,
	0.05,
	1,
	3
);
let t0 = system.sessionTime;
x.playAt(t0 + 5)
```

_Rationale_:
The `sessionTime` clock may be more accurate than the `absoluteTime` clock.

* * *

See also: schedule, sessionTime

Guides: Scheduling Functions, SuperCollider Functions
