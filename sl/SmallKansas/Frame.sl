Frame : [Object, UserEventTarget] { | smallKansas framePane titlePane closeButton menuButton titleText inMove x y x0 y0 subject eventListeners |

	bringToFront { :self |
		self.zIndex := self.smallKansas.zIndices.max + 1
	}

	close { :self |
		self.dispatchEvent(Event('close'));
		self.smallKansas.removeFrame(self)
	}

	colour { :self :aColour |
		self.framePane.style.setProperty('background-color', aColour.hexString, '')
	}

	createElements { :self |
		self.framePane := 'div'.createElement(
			class: ['framePane', self.subject.typeOf, self.subject.name].unwords
		);
		self.titlePane := 'div'.createElement(
			class: 'titlePane'
		);
		self.closeButton := 'span'.createElement(
			class: 'closeButton'
		);
		self.titleText := 'span'.createElement(
			class: 'titleText'
		);
		self.menuButton := 'span'.createElement(
			class: 'menuButton'
		);
		self.titlePane.appendChildren([
			self.closeButton,
			self.titleText,
			self.menuButton
		]);
		self.framePane.appendChildren([
			self.titlePane,
			self.subject.outerElement
		]);
		self.closeButton.textContent := '×';
		self.menuButton.textContent := '☰';
		self.inMove := false
	}

	font { :self :fontName |
		self.framePane.style.setProperty('--font-family', fontName, '')
	}

	fontSize { :self :fontSize |
		self.framePane.style.setProperty('--font-size', fontSize, '')
	}

	initialize { :self :smallKansas :subject |
		self.smallKansas := smallKansas;
		self.subject := subject;
		self.createElements;
		self.setEventHandlers;
		self.title := subject.title;
		self.eventListeners := Record();
		self
	}

	outerElement { :self |
		self.framePane
	}

	menuItems { :self |
		[
			MenuItem('Help', nil) { :event |
				self.smallKansas.helpFor(self.subject.name, event)
			},
			MenuItem('Colour Chooser', nil) { :event |
				self.smallKansas.colourChooserOn(self, event)
			},
			MenuItem('Font Menu', nil) { :event |
				self.smallKansas.fontMenuOn(self, true, event)
			},
			MenuItem('Font Size Menu', nil) { :event |
				self.smallKansas.fontSizeMenuOn(self, true, event)
			}
		]
	}

	moveTo { :self :x :y |
		self.x := x;
		self.y := y;
		self.framePane.style.setProperty('left', x.asString ++ 'px', '');
		self.framePane.style.setProperty('top', y.asString ++ 'px', '')
	}

	setEventHandlers { :self |
		let pointerBegin = { :event |
			let titleRect = event.target.getBoundingClientRect;
			event.stopPropagationAndPreventDefault;
			self.bringToFront;
			event.target.setPointerCapture(event.pointerId);
			self.inMove := true;
			self.x0 := event.x - titleRect.x;
			self.y0 := event.y - titleRect.y
		};
		let pointerMove = { :event |
			self.inMove.ifTrue {
				self.moveTo(
					event.x - self.x0,
					event.y- self.y0
				)
			}
		};
		let pointerEnd = { :event |
			event.target.releasePointerCapture(event.pointerId);
			self.inMove := false
		};
		self.closeButton.addEventListener('click') { :event |
			self.close
		};
		self.menuButton.addEventListener('click') { :event |
			self.smallKansas.menu('Frame Menu', self.subject.frameMenuItems ++ self.menuItems, true, event)
		};
		self.titlePane.addEventListener('contextmenu') { :event |
			{- ... -}
		};
		self.titlePane.addEventListener('pointerdown', pointerBegin:/1);
		self.titlePane.addEventListener('pointermove', pointerMove:/1, (capture: true, passive: true));
		self.titlePane.addEventListener('pointercancel', pointerEnd:/1);
		self.titlePane.addEventListener('pointerup', pointerEnd:/1);
		self.titlePane.addEventListener('pointerout', pointerEnd:/1);
		self.framePane.addEventListener('keydown') { :event |
			event.ctrlKey.ifTrue {
				(event.key = 'Escape').ifTrue {
					self.close
				}
			}
		}

	}

	title { :self |
		self.titleText.textContent
	}

	title { :self :aString |
		self.titleText.textContent := aString
	}

	zIndex { :self |
		self.framePane.style.getPropertyValue('z-index').parseInteger(10)
	}

	zIndex { :self :anInteger |
		self.framePane.style.setProperty('z-index', anInteger.asString, '')
	}

}

+SmallKansas {

	Frame { :self :subject |
		newFrame().initialize(self, subject)
	}

}
