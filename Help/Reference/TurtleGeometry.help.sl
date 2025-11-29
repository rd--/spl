# TurtleGeometry

- _TurtleGeometry()_

`TurtleGeometry` is a `Type` representing a turtle geometry system.

Basic commands are:

- `forward`
- `penDown`
- `penUp`
- `right`
- `setHeading`

Derived commands are:

- `arcLeft`
- `arcRight`
- `backward`
- `left`

Draw a square:

~~~spl svg=A
let t = TurtleGeometry();
4.timesRepeat {
	t.forward(100);
	t.right(90)
};
t
~~~

![](sw/spl/Help/Image/TurtleGeometry-A.svg)

The `repeat` command provides the turtle geometry object as both parameter and answer:

~~~spl svg=B
TurtleGeometry()
.repeat(4) { :t |
	t.forward(100);
	t.right(90)
}
~~~

![](sw/spl/Help/Image/TurtleGeometry-B.svg)

Draw a set of circles:

~~~spl svg=C
TurtleGeometry()
.repeat(9) { :t |
	t.arcRight(1, 360);
	t.right(40)
}
~~~

![](sw/spl/Help/Image/TurtleGeometry-C.svg)

Draw a flower:

~~~spl svg=D
let petal = { :t |
	2.timesRepeat {
		t.arcRight(1, 60);
		t.right(120)
	}
};
TurtleGeometry()
.repeat(6) { :t |
	t.petal;
	t.right(60)
}
~~~

![](sw/spl/Help/Image/TurtleGeometry-D.svg)

Draw a sun:

~~~spl svg=E
let ray = { :t |
	2.timesRepeat {
		t.arcLeft(1, 90);
		t.arcRight(1, 90)
	}
};
TurtleGeometry()
.repeat(9) { :t |
	t.ray;
	t.right(160)
}
~~~

![](sw/spl/Help/Image/TurtleGeometry-E.svg)

Draw polygons:

~~~spl svg=F
let poly = { :t |
	let turn = 0;
	{
		t.forward(100);
		t.right(60);
		turn := turn + 60
	}.doWhileTrue {
		turn \\ 360 != 0
	}
};
TurtleGeometry()
.repeat(8) { :t |
	t.poly;
	t.right(45)
}
~~~

![](sw/spl/Help/Image/TurtleGeometry-F.svg)

Draw spirolateral:

~~~spl svg=G
let spiroPart = { :t |
	1:10.do { :i |
		t.forward(i);
		t.right(60)
	}
};
TurtleGeometry()
.repeat(3) { :t |
	t.spiroPart
}
~~~

![](sw/spl/Help/Image/TurtleGeometry-G.svg)

Draw generalised spirolateral:

~~~spl svg=H
let spiroPart = { :t |
	1:11.do { :i |
		t.forward(i);
		[3 4 5].includes(i).if {
			t.left(90)
		} {
			t.right(90)
		}
	}
};
TurtleGeometry()
.repeat(4) { :t |
	t.spiroPart
}
~~~

![](sw/spl/Help/Image/TurtleGeometry-H.svg)

Draw two interleaved regular polygons,
a square and a nonagon:

~~~spl svg=I
TurtleGeometry()
.forEach(0:35) { :t :c |
	t.vector(c * 90, 150);
	t.vector(c * -40, 150)
}
~~~

![](sw/spl/Help/Image/TurtleGeometry-I.svg)

Draw two interleaved regular polygons,
of 36 and 24 sides:

~~~spl svg=J
TurtleGeometry()
.forEach(0:75) { :t :c |
	t.vector(c * 10, 40);
	t.vector(c * -15, 40)
}
~~~

![](sw/spl/Help/Image/TurtleGeometry-J.svg)

Draw polygon with local phase change:

~~~spl svg=K
let p = 0;
TurtleGeometry()
.repeat(72) { :t |
	t.forward(p.cosDegrees);
	t.left(45);
	p := p + 20
}
~~~

![](sw/spl/Help/Image/TurtleGeometry-K.svg)

* * *

See also: drawing, Geometry

Guides: Geometry Functions

Further Reading: Abelson and diSessa 1980, Papert 1980
