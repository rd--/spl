@View {

	frame { :self :aFrame |
	}

	frameMenuItems { :self |
		[]
	}

	name { :self |
		self.title.replaceAll(' ', '')
	}

	outerElement { :self |
		self.subclassResponsibility
	}

	title { :self |
		'Untitled'
	}

}

Frame : [Object] { | framePane titlePane closeButton menuButton titleText inMove x y x0 y0 eventListeners |

	addEventListener { :self :aString :aProcedure:/1 |
		self.eventListeners.atIfPresentIfAbsent(aString) { :aSet |
			aSet.add(aProcedure:/1)
		} {
			self.eventListeners[aString] := IdentitySet([aProcedure:/1])
		}
	}

	bringToFront { :self |
		self.zIndex := workspace::smallKansas.zIndices.max + 1
	}

	close { :self |
		self.eventListeners.atIfPresent('close') { :aSet |
			aSet.do { :each |
				each.value(Event('close'))
			}
		};
		workspace::smallKansas.removeFrame(self)
	}

	createElements { :self :subject |
		self.framePane := 'div'.createElement;
		self.titlePane :=  'div'.createElement;
		self.closeButton := 'span'.createElement;
		self.titleText := 'span'.createElement;
		self.menuButton := 'span'.createElement;
		self.titlePane.appendChildren([
			self.closeButton,
			self.titleText,
			self.menuButton
		]);
		self.framePane.appendChildren([
			self.titlePane,
			subject.outerElement
		]);
		self.closeButton.textContent := '×';
		self.menuButton.textContent := '☰';
		self.inMove := false
	}

	font { :self :fontName|
		self.framePane.style.setProperty('--font-family', fontName, '')
	}

	fontSize { :self :fontSize |
		self.framePane.style.setProperty('--font-size', fontSize, '')
	}

	initialize { :self :subject |
		self.createElements(subject);
		self.setAttributes(subject);
		self.setEventHandlers(subject);
		self.title := subject.title;
		self.eventListeners := IdentityDictionary();
		self
	}

	outerElement { :self |
		self.framePane
	}

	menuItems { :self |
		[
			MenuItem('Font Menu', nil) { :event |
				workspace::smallKansas.fontMenuOn(self, true, event)
			},
			MenuItem('Font Size Menu', nil) { :event |
				workspace::smallKansas.fontSizeMenuOn(self, true, event)
			}
		]
	}


	moveTo { :self :x :y |
		self.x := x;
		self.y := y;
		self.framePane.style.setProperty('left', x.asString ++ 'px', '');
		self.framePane.style.setProperty('top', y.asString ++ 'px', '')
	}

	setAttributes { :self :subject |
		self.framePane.setAttribute('class', ['framePane', subject.typeOf].unwords);
		self.titlePane.setAttribute('class', 'titlePane');
		self.closeButton.setAttribute('class', 'closeButton');
		self.titleText.setAttribute('class', 'titleText');
		self.menuButton.setAttribute('class', 'menuButton')
	}

	setEventHandlers { :self :subject |
		self.closeButton.addEventListener('pointerup') { :event |
			event.preventDefault;
			self.close
		};
		self.menuButton.addEventListener('pointerup') { :event |
			event.preventDefault;
			workspace::smallKansas.menu('Frame Menu', subject.frameMenuItems ++ self.menuItems, true, event)
		};
		self.titlePane.addEventListener('contextmenu') { :event |
			event.preventDefault;
			subject.titlePaneContextMenu(event)
		};
		self.titlePane.addEventListener('pointerdown') { :event |
			| titleRect = event.target.getBoundingClientRect; |
			event.preventDefault;
			self.bringToFront;
			event.target.setPointerCapture(event.pointerId);
			self.inMove := true;
			self.x0 := event.x - titleRect.x;
			self.y0 := event.y - titleRect.y
		};
		self.titlePane.addEventListener('pointermove') { :event |
			self.inMove.ifTrue {
				event.stopPropagation;
				event.cancelable.ifTrue {
					event.preventDefault
				};
				self.moveTo(
					event.x - self.x0,
					event.y- self.y0
				)
			}
		};
		self.titlePane.addEventListener('pointerup') { :event |
			event.target.releasePointerCapture(event.pointerId);
			self.inMove := false
		};
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


+ @View {

	Frame { :self |
		newFrame().initialize(self)
	}

}
