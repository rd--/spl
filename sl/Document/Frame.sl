@View {

	contextMenu { :self :event |
		['View>>contextMenu', self.title].postLine
	}

	frame { :self :aFrame |
	}

	onFrameEvent { :self :frameEvent |
	}

	outerElement { :self |
		self.subclassResponsibility
	}

	title { :self |
		'Untitled'
	}

}

Frame : [Object] { | framePane titlePane closeButton titleText inMove x y x0 y0 listenerSet |

	addListener { :self :aProcedure:/1 |
		self.listenerSet.add(aProcedure:/1)
	}

	bringToFront { :self |
		self.zIndex := workspace::smallKansas.zIndices.max + 1;
	}

	close { :self |
		self.listenerSet.do { :each |
			each.value('close')
		};
		workspace::smallKansas.removeFrame(self)
	}

	createElements { :self :subject |
		self.framePane := 'div'.createElement;
		self.titlePane :=  'div'.createElement;
		self.closeButton := 'pre'.createElement;
		self.titleText := 'pre'.createElement;
		self.titlePane.appendChildren([
			self.closeButton,
			self.titleText
		]);
		self.framePane.appendChildren([
			self.titlePane,
			subject
		]);
		self.closeButton.textContent := '×';
		self.inMove := false
	}

	initialize { :self :subject |
		self.createElements(subject.outerElement);
		self.setAttributes(subject.typeOf);
		self.setEventHandlers(subject);
		self.title := subject.title;
		self.listenerSet := IdentitySet();
		self
	}

	outerElement { :self |
		self.framePane
	}

	moveTo { :self :x :y |
		self.x := x;
		self.y := y;
		self.framePane.style.setProperty('left', x.asString ++ 'px', '');
		self.framePane.style.setProperty('top', y.asString ++ 'px', '');
	}

	setAttributes { :self :kind |
		self.framePane.setAttribute('class', ['framePane', kind].unwords);
		self.titlePane.setAttribute('class', 'titlePane');
		self.closeButton.setAttribute('class', 'closeButton')
	}

	setEventHandlers { :self :subject |
		self.closeButton.addEventListener('pointerup', { :unusedEvent |
			self.close
		});
		self.titlePane.addEventListener('contextmenu', { :event |
			event.preventDefault;
			subject.contextMenu(event)
		});
		self.titlePane.addEventListener('pointerdown', { :event |
			| titleRect = event.target.getBoundingClientRect; |
			self.bringToFront;
			event.target.setPointerCapture(event.pointerId);
			self.inMove := true;
			self.x0 := event.x - titleRect.x;
			self.y0 := event.y - titleRect.y;
		});
		self.titlePane.addEventListener('pointermove', { :event |
			self.inMove.ifTrue {
				event.stopPropagation;
				event.cancelable.ifTrue {
					event.preventDefault;
				};
				self.moveTo(
					event.x - self.x0,
					event.y- self.y0
				);
			}
		});
		self.titlePane.addEventListener('pointerup', { :event |
			event.target.releasePointerCapture(event.pointerId);
			self.inMove := false
		});
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
