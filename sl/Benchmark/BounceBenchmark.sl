(* Requires: Benchmark SomRandom *)

Ball : [Object] { | x y xVel yVel |

	bounce { :self |
		let xLimit = 500;
		let yLimit = 500;
		let bounced = false;
		self.x +:= self.xVel;
		self.y +:= self.yVel;
		(self.x > xLimit).ifTrue {
			self.x := xLimit;
			self.xVel := 0 - self.xVel.abs;
			bounced := true
		};
		(self.x < 0).ifTrue {
			self.x := 0;
			self.xVel := self.xVel.abs;
			bounced := true
		};
		(self.y > yLimit).ifTrue {
			self.y := yLimit;
			self.yVel := 0 - self.yVel.abs;
			bounced := true
		};
		(self.y < 0).ifTrue {
			self.y := 0;
			self.yVel := self.yVel.abs;
			bounced := true
		};
		bounced
	}

}

+SomRandom {

	Ball { :self |
		newBall().initializeSlots(
			self.next % 500,
			self.next % 500,
			(self.next % 300) - 150,
			(self.next % 300) - 150
		)
	}

}

+Void {

	BounceBenchmark {
		Benchmark('Bounce', [100 -> 1331].asMap) { :ballCount |
			let random = SomRandom();
			let bounces = 0;
			let balls = Array(ballCount).fillWith { :unusedIndex |
				Ball(random)
			};
			1.toDo(50) { :i |
				balls.do { :ball |
					ball.bounce.ifTrue {
						bounces +:= 1
					}
				}
			};
			bounces
		}
	}

}
