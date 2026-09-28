TurtleGeometry : [Object, Equal, Store, Geometry] { | instructionList |

	add { :self :opcode :argument |
		self.instructionList.addInPlace([opcode, argument]);
		self
	}

	arc { :self :distance :degrees :angle |
		{ degrees > 0 }.whileTrue {
			let k = degrees.min(90);
			self.addInPlace('Arc', [distance, k, angle]);
			degrees := degrees - k
		}
	}

	arcLeft { :self :distance :degrees |
		self.arc(distance, degrees, -1)
	}

	arcRight { :self :distance :degrees |
		self.arc(distance, degrees, 1)
	}

	backward { :self :distance |
		self.addInPlace('Move', 0 - distance)
	}

	drawing { :self |
		self.geometryCollection.drawing
	}

	embeddingDimension { :unused |
		2
	}

	forEach { :self :aCollection :aBlock/2 |
		aCollection.do { :each |
			aBlock(self, each)
		};
		self
	}

	forward { :self :distance |
		self.addInPlace('Move', distance)
	}

	geometryCollection { :self |
		let answer = [];
		let heading = 0;
		let penDown = true;
		let position = [0 0];
		self.instructionList.do { :i |
			let [opcode, argument] = i;
			opcode.caseOf(
				[
					'Arc' -> {
						let [distance, degrees, angle] = argument;
						let halfDegrees = degrees // 2;
						let initialPosition = position;
						halfDegrees.timesRepeat {
							position := position + [distance, heading.degree].fromPolarCoordinates;
							heading := (heading + angle) % 360
						};
						let middlePosition = position;
						(degrees - halfDegrees).timesRepeat {
							position := position + [distance, heading.degree].fromPolarCoordinates;
							heading := (heading + angle) % 360
						};
						penDown.ifTrue {
							answer.addInPlace(
								[
									initialPosition,
									middlePosition,
									position
								].circularArcThrough
							)
						}
					},
					'Move' -> {
						let distance = argument;
						let nextPosition = position + [distance, heading.degree].fromPolarCoordinates;
						penDown.ifTrue {
							answer.addInPlace(
								Line([position, nextPosition])
							)
						};
						position := nextPosition
					},
					'Pen' -> {
						penDown := argument
					},
					'SetHeading' -> {
						heading := argument
					},
					'Turn' -> {
						let angle = argument;
						heading := (heading + angle) % 360
					}
				]
			)
		};
		GeometryCollection(answer)
	}

	left { :self :angle |
		self.addInPlace('Turn', 360 - angle)
	}

	penDown { :self |
		self.addInPlace('Pen', true)
	}

	penUp { :self |
		self.addInPlace('Pen', false)
	}

	repeat { :self :count :aBlock/1 |
		count.timesRepeat {
			aBlock(self)
		};
		self
	}

	right { :self :angle |
		self.addInPlace('Turn', angle)
	}

	setHeading { :self :angle |
		self.addInPlace('SetHeading', angle)
	}

	vector { :self :angle :length |
		self.setHeading(angle);
		self.forward(length)
	}

}

+Void {

	TurtleGeometry {
		newTurtleGeometry().initializeSlots([])
	}

}
