TurtleGeometry : [Object, Equatable, Storeable, Geometry] { | instructionList |

	add { :self :opcode :argument |
		self.instructionList.add([opcode, argument]);
		self
	}

	arc { :self :distance :degrees :angle |
		{ degrees > 0 }.whileTrue {
			let k = degrees.min(90);
			self.add('Arc', [distance, k, angle]);
			degrees := degrees - k
		}
	}

	arcLeft { :self :distance :degrees |
		self.arc(distance, degrees, 1)
	}

	arcRight { :self :distance :degrees |
		self.arc(distance, degrees, -1)
	}

	backward { :self :distance |
		self.add('Move', 0 - distance)
	}

	drawing { :self |
		self.geometryCollection.drawing
	}

	embeddingDimension { :unused |
		2
	}

	forEach { :self :aCollection :aBlock:/2 |
		aCollection.do { :each |
			aBlock(self, each)
		};
		self
	}

	forward { :self :distance |
		self.add('Move', distance)
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
						let middlePosition = nil;
						halfDegrees.timesRepeat {
							position := position + [distance, heading.degree].fromPolarCoordinates;
							heading := (heading + angle) % 360
						};
						middlePosition := position;
						(degrees - halfDegrees).timesRepeat {
							position := position + [distance, heading.degree].fromPolarCoordinates;
							heading := (heading + angle) % 360
						};
						penDown.ifTrue {
							answer.add(
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
							answer.add(
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
		self.add('Turn', 360 - angle)
	}

	penDown { :self |
		self.add('Pen', true)
	}

	penUp { :self |
		self.add('Pen', false)
	}

	repeat { :self :count :aBlock:/1 |
		count.timesRepeat {
			aBlock(self)
		};
		self
	}

	right { :self :angle |
		self.add('Turn', angle)
	}

	setHeading { :self :angle |
		self.add('SetHeading', angle)
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
