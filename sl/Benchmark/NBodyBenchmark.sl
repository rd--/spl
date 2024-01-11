{- Requires: Benchmark -}

Body : [Object] { | x y z vx vy vz mass |

	offsetMomentumXYZ { :self :px :py :pz |
		let solarMass = 4 * pi * pi;
		self.vx := 0.0 - (px / solarMass);
		self.vy := 0.0 - (py / solarMass);
		self.vz := 0.0 - (pz / solarMass)
	}

}

+SmallFloat {

	Body { :x :y :z :vx :vy :vz :mass |
		let daysPerYear = 365.24;
		let solarMass = 4 * pi * pi;
		newBody().initializeSlots(
			x, y, z,
			vx * daysPerYear, vy * daysPerYear, vz * daysPerYear,
			mass * solarMass
		)
	}

}

+Void {

	Jupiter {
		Body(
			4.841431442464721,
			-1.1603200440274284,
			-0.10362204447112311,
			0.001660076642744037,
			0.007699011184197404,
			-0.0000690460016972063,
			0.0009547919384243266
		)
	}

	Saturn {
		Body(
			8.34336671824458,
			4.124798564124305,
			-0.4035234171143214,
			-0.002767425107268624,
			0.004998528012349172,
			0.000023041729757376393,
			0.0002858859806661308
		)
	}

	Uranus {
		Body(
			12.894369562139131,
			-15.111151401698631,
			-0.22330757889265573,
			0.002964601375647616,
			0.0023784717395948095,
			-0.000029658956854023756,
			0.00004366244043351563
		)
	}

	Neptune {
		Body(
			15.379697114850917,
			-25.919314609987964,
			0.17925877295037118,
			0.0026806777249038932,
			0.001628241700382423,
			-0.00009515922545197159,
			0.000051513890204661145
		)
	}

	Sun {
		Body(0, 0, 0, 0, 0, 0, 1)
	}

}

NBodySystem : [Object] { | bodies |

	advance { :self :dt |
		1.toDo(self.bodies.size) { :i |
			let iBody = self.bodies[i];
			(i + 1).toDo(self.bodies.size) { :j |
				let jBody = self.bodies[j];
				let dx = iBody:@x - jBody:@x;
				let dy = iBody:@y - jBody:@y;
				let dz = iBody:@z - jBody:@z;
				let dSquared = (dx * dx) + (dy * dy) + (dz * dz);
				let distance = dSquared.sqrt;
				let mag = dt / (dSquared * distance);
				iBody:@vx -:= dx * jBody:@mass * mag;
				iBody:@vy -:= dy * jBody:@mass * mag;
				iBody:@vz -:= dz * jBody:@mass * mag;
				jBody:@vx +:= dx * iBody:@mass * mag;
				jBody:@vy +:= dy * iBody:@mass * mag;
				jBody:@vz +:= dz * iBody:@mass * mag
			}
		};
		self.bodies.do { :body |
			body:@x +:= dt * body:@vx;
			body:@y +:= dt * body:@vy;
			body:@z +:= dt * body:@vz
		}
	}

	energy { :self |
		let e = 0.0;
		1.toDo(self.bodies.size) { :i |
			let iBody = self.bodies[i];
			e +:= (0.5 *
				iBody.mass *
				(
					(iBody.vx * iBody.vx) +
					(iBody.vy * iBody.vy) +
					(iBody.vz * iBody.vz)
				)
			);
			(i + 1).toDo(self.bodies.size) { :j |
				let jBody = self.bodies[j];
				let dx = iBody.x - jBody.x;
				let dy = iBody.y - jBody.y;
				let dz = iBody.z - jBody.z;
				let distance = ((dx * dx) + (dy * dy) + (dz * dz)).sqrt;
				e -:= (iBody.mass * jBody.mass) / distance
			}
		};
		e
	}

}

+Void {

	NBodySystem {
		let px = 0;
		let py = 0;
		let pz = 0;
		let bodies = [Sun(), Jupiter(), Saturn(), Uranus(), Neptune()];
		bodies.do { :b |
			px +:= b.vx * b.mass;
			py +:= b.vy * b.mass;
			pz +:= b.vz * b.mass
		};
		bodies[1].offsetMomentumXYZ(px, py, pz);
		newNBodySystem().initializeSlots(bodies)
	}

	NBodyBenchmark {
		Benchmark('NBody', [
			1 -> -0.16907495402506745,
			250000 -> -0.1690859889909308
		].asMap) { :iterations |
			let system = NBodySystem();
			iterations.timesRepeat {
				system.advance(0.01)
			};
			system.energy
		}
	}

}
