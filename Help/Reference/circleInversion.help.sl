# circleInversion

- _circleInversion(x, c)_

Answer the inversion of _x_ given the reference circle _c_.

+Circle{
	circleInversion { :self |
		let c = self.center;
		let r = self.radius;
		{ :u |
			let v = u - c;
			c + ((r.squared * v) / v.norm.squared)
		}
	}
	circleInversion { :self :reference |
		let [x, y] = self.center;
		let a = self.radius;
		let [x0, y0] = reference.center;
		let k = reference.radius;
		let s = k.squared / ((x - x0).squared + (y - y0).squared - a.squared);
		Circle(
			[
				x0 + (s * (x - x0)),
				y0 + (s * (y - y0))
			],
			s.abs * a
		)
	}
	circlePower { :self |
		let c = self.center;
		let r = self.radius;
		{ :u |
			(u - c).norm.squared - r.squared
		}
	}
}
+List{
	circleInversion { :self :circle |
		let f:/1 = circle.circleInversion;
		self.isVector.if {
			f(self)
		} {
			self.collect(f:/1)
		}
	}
	circlePower { :self :circle |
		let f:/1 = circle.circlePower;
		self.isVector.if {
			f(self)
		} {
			self.collect(f:/1)
		}
	}
}

```
>>> let c = Circle([0 0], 1);
>>> let u = [2 2];
>>> let v = u.circleInversion(c);
>>> (v, v.circleInversion(c))
([0.25 0.25], [2 2])

Invert a circle to another circle:

```
>>> let c = Circle([0 0], 1);
>>> let u = Circle([2 2], 1);
>>> u.circleInversion(c)
Circle([2/7 2/7], 1/7)
```


x^'	=	x_0+s(x-x_0)	
(6)
y^'	=	y_0+s(y-y_0)
