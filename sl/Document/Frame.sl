@View {

	onClose { :self |
	}

	outerElement { :self |
		self.subclassResponsibility
	}

	title { :self |
		'Untitled'
	}

}

Frame : [Object] { | framePane titlePane closeButton titleText inMove x y x0 y0 |

	bringToFront { :self |
		self.zIndex := workspace::smallKansas.zIndices.max + 1;
	}

	createElements { :self :contents |
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
			contents
		]);
		self.closeButton.textContent := '×';
		self.inMove := false
	}

	initialize { :self :title :kind :contents :onClose:/1 |
		self.createElements(contents);
		self.setAttributes(kind);
		self.setEventHandlers(onClose:/1);
		self.title := title;
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

	setEventHandlers { :self :onClose:/1 |
		self.closeButton.addEventListener('pointerup', { :unusedEvent |
			onClose(self)
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


+ @Object {

	Frame { :self :onClose:/1 |
		newFrame().initialize(
			self.title,
			self.typeOf,
			self.outerElement, onClose:/1
		)

	}

}
