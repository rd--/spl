# rgba

- _rgba(c)_

Answer the _rgba_ components of the colour _c_.

```
>>> HsvColour([180 / 360, 1, 1], 1).rgba
[0 1 1 1]
```

Threads over lists:

```
>>> Sfc32(678142)
>>> .randomColour(3)
>>> .rgba
[
	0.40402 0.71644  0.36855 0.17088;
	0.66231 0.86364  0.04725 0.62714;
	0.44482 0.031714 0.21215 0.30308
]
```

* * *

See also: Colour, hsv, rgb, srgb

Guides: Colour Functions

Categories: Colour
