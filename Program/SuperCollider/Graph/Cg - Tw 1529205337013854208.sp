/* http://twitter.com/SC2Sbot/status/1529205337013854208 (cg) */
[1 .. 10].collect { :i |
	sinOscFb(
		2000 / i - i,
		pulse([i / 4, i / 3], 0.5)
	)
}.mix / 20
