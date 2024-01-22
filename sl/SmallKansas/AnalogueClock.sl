{- Requires: Date PolarCoordinate SmallKansas -}

AnalogueClock : [Object, View, SmallKansan] { | clockPane hourHand minuteHand secondHand |

	createElements { :self |
		let svg = 'svg'.createSvgElement (
			viewBox: '0 0 200 200',
			preserveAspectRatio: 'xMidYMid meet'
		);
		let group = 'g'.createSvgElement (
			transform: 'translate(100, 100) scale(1, -1)'
		);
		self.clockPane := 'div'.createElement;
		self.hourHand := 'line'.createSvgElement (
			x1: '0',
			y1: '0',
			x2: '0',
			y2: '50',
			stroke: 'cornflowerblue',
			'stroke-width': '2'
		);
		self.minuteHand := 'line'.createSvgElement (
			x1: '0',
			y1: '0',
			x2: '0',
			y2: '80',
			stroke: 'coral',
			'stroke-width': '2'
		);
		self.secondHand := 'line'.createSvgElement (
			x1: '0',
			y1: '0',
			x2: '0',
			y2: '80',
			stroke: 'darkseagreen'
		);
		group.appendChildren([
			'circle'.createSvgElement (
				cx: '0',
				cy: '0',
				r: '90',
				fill: 'aquamarine'
			),
			self.hourHand,
			self.minuteHand,
			self.secondHand
		]);
		group.appendChildren([1 .. 12].collect { :each |
			let theta = each - 3 / 12 * 2 * pi;
			let point = PolarCoordinate(80, theta);
			let text = 'text'.createSvgElement (
				x: point.x,
				y: point.y,
				'font-size': '11pt',
				'text-anchor': 'middle',
				'dominant-baseline': 'middle',
				transform: 'scale(1, -1)'
			);
			text.textContent := each.printString;
			text
		});
		svg.appendChild(group);
		self.clockPane.appendChild(svg)
	}

	initialize { :self |
		self.createElements;
		self.tick;
		self
	}

	moveHourHand { :self :fractionalHour |
		let theta = fractionalHour - 3 / 12 * 2 * pi;
		self.hourHand.p2 := PolarCoordinate(55, theta.negated)
	}

	moveMinuteHand { :self :minute |
		let theta = minute - 15 / 60 * 2 * pi;
		self.minuteHand.p2 := PolarCoordinate(80, theta.negated)
	}

	moveSecondHand { :self :minute |
		let theta = minute - 15 / 60 * 2 * pi;
		self.secondHand.p2 := PolarCoordinate(85, theta.negated)
	}

	openIn { :self :smallKansas :event |
		smallKansas.addFrameWithAnimator(self, event, 1) {
			self.tick
		}
	}

	outerElement { :self |
		self.clockPane
	}

	tick { :self |
		let dateAndTime = system.Date;
		self.moveHourHand(dateAndTime.hours + (dateAndTime.minutes / 60));
		self.moveMinuteHand(dateAndTime.minutes);
		self.moveSecondHand(dateAndTime.seconds)
	}

	title { :self |
		'Analogue Clock'
	}

}

+Void {

	AnalogueClock {
		newAnalogueClock().initialize
	}

}
