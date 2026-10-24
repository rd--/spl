# fibonacciClosedForm

- fibonacciClosedForm(n, x=1)_

Closed form calculation of the _n_-th Fibonacci number.

Detect the point at which the closed form calculation disagrees by more than one-half:

```
>>> 1:76.detect { :n |
>>> 	let a = n.fibonacciNumber;
>>> 	let b = n.fibonacciClosedForm;
>>> 	(a - b).abs >= 0.5
>>> }
65

>>> 65.fibonacciClosedForm
17167680177564.422

>>> 65.fibonacciNumber
17167680177565L
```

Evaluate symbolically:

```
>> `n`.fibonacciClosedForm
(/
  (-
    (^ 1.618033988749894 n)
    (*
      (cos (* n π))
      (^ 1.618033988749894 (* n -1))))
  2.23606797749979)

>> `n`.fibonacciClosedForm(`x`)
(/
  (-
    (*
      (^ 2 (- 0 n))
      (^ (+ x (sqrt (+ 4 (* x x)))) n)
    )
    (*
      (*
        (^ 2 n)
        (^ (+ x (sqrt (+ 4 (* x x)))) (- 0 n))
      )
      (cos (* n π))
    )
  )
  (sqrt (+ 4 (* x x)))
)
```

Plot over a subset of the reals:

~~~spl svg=A
(-2 -- 2).functionPlot(
	fibonacciClosedForm/1
)
~~~

![](Help/Image/fibonacciClosedForm-A.svg)

* * *

See also: fibonacci, fibonacciNumber, fibonacciSequence

Guides: Integer Functions, Integer Sequence Functions
