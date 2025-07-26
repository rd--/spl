+SmallFloat {

	aizawaEquation { :a :b :c :d :e :f |
		{ :t :v |
			let [x, y, z] = v;
			[
				((z - b) * x) - (d * y),
				(d * x) + ((z - b) * y),
				c + (a * z) - (z.cubed / 3) - ((x.squared + y.squared) * (1 + (e * z))) + (f * z * x.cubed)
			]
		}
	}

	arneodoEquation { :a :b :c |
		{ :t :v |
			let [x, y, z] = v;
			[
				y,
				z,
				0 - (a * x) - (b * y) - z + (c * x.cubed)
			]
		}
	}

	coulletEquation { :a :b :c :d |
		{ :t :v |
			let [x, y, z] = v;
			[
				y,
				z,
				(a * x) + (b * y) + (c * z) + (d * x.cubed)
			]
		}
	}

	dequanLiEquation { :a :c :d :e :k :f |
		{ :t :v |
			let [x, y, z] = v;
			[
				(a * (y - x)) + (d * x * z),
				(k * x) + (f * y) - (x * z),
				(c * z) + (x * y) - (e * x * x)
			]
		}
	}

	doublePendulumEquation { :g :l :m |
		let [l1, l2] = l;
		let [m1, m2] = m;
		{ :t :v |
			let [theta1, omega1, theta2, omega2] = v;
			let a = (0 - g) * ((2 * m1) + m2) * sin(theta1);
			let b = m2 * g * sin(theta1 - (2 * theta2));
			let c = 2 * sin(theta1 - theta2) * m2;
			let d = ((omega2 ^ 2) * l2) + ((omega1 ^ 2) * l1 * cos(theta1 - theta2));
			let e = l1 * ((2 * m1) + m2 - ((m2 * cos((2 * theta1)) - (2 * theta2))));
			let f = (omega1 ^ 2) * l1 * (m1 + m2);
			let h = (g * (m1 + m2) * cos(theta1)) + ((omega2 ^ 2) * l2 * m2 * cos(theta1 - theta2));
			let i = 2 * sin(theta1 - theta2) * (f + h);
			let j = l2 * ((2 * m1) + m2 - (m2 * cos((2 * theta1) - (2 * theta2))));
			[
				omega1,
				(a - b - (c * d)) / e,
				omega2,
				i / j
			]
		}
	}

	duffingEquation { :gamma :delta :omega |
		{ :t :v |
			let [x, y] = v;
			[
				y,
				x - (x ^ 3) - (delta * y) + (gamma * (omega * t).cos)
			]
		}
	}

	henonHeilesEquation { :lambda |
		{ :t :v |
			let [x, y, px, py] = v;
			[
				px,
				py,
				0 - x - (lambda * 2 * x * y),
				0 - y - (lambda * ((x * x) - (y * y)))
			]
		}
	}

	lorenzEquation { :rho :sigma :beta |
		{ :t :v |
			let [x, y, z] = v;
			[
				sigma * (y - x),
				x * (rho - z) - y,
				(x * y) - (beta * z)
			]
		}
	}

	lotkaVolterraEquations { :alpha :beta :gamma :delta |
		{ :t :v |
			let [x, y] = v;
			[
				(alpha * x) - (beta * x * y),
				0 - (gamma * y) + (delta * x * y)
			]
		}
	}

	/*
	noseHooverEquation { :alpha |
		{ :t :v |
			let [x, y, z] = v;
			[
				y,
				0 - x + (y * z),
				alpha - (y * y)
			]
		}
	}
	*/

	noseHooverEquation { :alpha |
		{ :t :v |
			let [x, y, z] = v;
			[
				0 - y + (x * z),
				x,
				alpha * ((x * x) - 1)
			]
		}
	}

	rosslerEquation { :a :b :c |
		{ :t :v |
			let [x, y, z] = v;
			[
				0 - y - z,
				x + (a * y),
				b + (z * (x - c))
			]
		}
	}

	rucklidgeEquation { :k :a |
		{ :t :v |
			let [x, y, z] = v;
			[
				0 - (k * x) + (a * y) - (y * z),
				x,
				0 - z + (y * y)
			]
		}
	}

	vanDerPolEquation { :mu |
		{ :t :v |
			let [x, y] = v;
			[
				y,
				(mu * (1 - (x ^ 2)) * y) - x
			]
		}
	}

}

+Block {

	eulerMethod { :self:/2 :y0 :x0 :x1 :h |
		let x = x0;
		let y = y0;
		let vx = [x0];
		let vy = [y0];
		{
			x < x1
		}.whileTrue {
			x := x + h;
			y := y + (h * self(x, y));
			vx.add(x);
			vy.add(y)
		};
		[vx, vy]
	}

	rungeKuttaMethod { :self:/2 :y0 :x0 :x1 :h |
		let f:/2 = self:/2;
		let x = x0;
		let y = y0;
		let vx = [x0];
		let vy = [y0];
		{
			x < x1
		}.whileTrue {
			let k1 = h * f(x, y);
			let k2 = h * f(x + (0.5 * h), y + (0.5 * k1));
			let k3 = h * f(x + (0.5 * h), y + (0.5 * k2));
			let k4 = h * f(x + h, y + k3);
			x := x + h;
			y := y + ((k1 + k2 + k2 + k3 + k3 + k4) / 6);
			vx.add(x);
			vy.add(y)
		};
		[vx, vy]
	}

}
