# new -- smalltalk

- _new(f, n)_ == _f(n)_

	[].species = Array:/1
	[].species.new(3) = [nil, nil, nil]
