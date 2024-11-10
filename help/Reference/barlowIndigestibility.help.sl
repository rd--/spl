# barlowIndigestibility

- _barlowIndigestibility(anInteger)_

The indigestibility of a prime number _p_ is defined as _2 * (p - 1) * 2 / p_.
The indigestibility of a composite number is the sum of the indigestibilities of its prime factors.
Indigestibilities are combined to generate harmonicity functions.

The indigestibility of the first seven prime numbers:

```
>>> [1 2 3 5 7 11 13].collect(barlowIndigestibility:/1)
[0 1 8/3 32/5 72/7 200/11 288/13]
```

The indigestibility of the first sixteen integers:

```
>>> 1:16.collect(barlowIndigestibility:/1)
[
	 0       1       2.6666 2
	 6.4     3.6666 10.2857 3
	 5.3333  7.4    18.1818 4.6666
	22.1538 11.2857  9.0666 4
]
```

Plot the indigestibility of the first one hundred integers:

~~~
1:100.functionPlot(barlowIndigestibility:/1)
~~~

* * *

See also: barlowHarmonicity

Further Reading: Barlow 1987
