# Experimental Relative Range Syntax

Answer `RelativeRange` values,
the notation _1:-1_ indicates the range from the first to the last index,
the notation _-1:1:-1_ indicates the range from the last to the first index:

~~~spl experimental
	1:-1
RelativeRange(1, -1, 1)

	-1:1:-1
RelativeRange(-1, 1, -1)

	[1 .. 9].part([1:-1])
[1 2 3 4 5 6 7 8 9]

	 -3:3:-1
RelativeRange(-3, 3, -1)

	 3:-3:2
RelativeRange(3, -3, 2)

	 -3:3:-2
RelativeRange(-3, 3, -2)

	 -1:1:-1
RelativeRange(-1, 1, -1)

	 1:-1
RelativeRange(1, -1, 1)
~~~
