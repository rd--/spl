# downsampleSteinarsson

- _downsampleSteinarsson(aMatrix, anInteger)_

Downsample time series data at the two column _aMatrix_ to have _anInteger_ places.

```
>>> let ts = [
>>> 	1 2;
>>> 	2 2;
>>> 	3 3;
>>> 	4 3;
>>> 	5 6;
>>> 	6 3;
>>> 	7 3;
>>> 	8 5;
>>> 	9 4;
>>> 	10 4;
>>> 	11 1;
>>> 	12 2
>>> ];
>>> ts.downsampleSteinarsson(3)
[
	1 2;
	5 6;
	12 2
]
```

* * *

See also: downsample, resample, upsample

Further Reading: Steinarsson 2013

Categories: Rearranging
