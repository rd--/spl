Frame : [Object] { | framePane titlePane titleText inMove x y x0 y0 |

	createElements { :self :contents |
		self.framePane := 'div'.createElement;
		self.titlePane :=  'div'.createElement;
		self.titleText := 'pre'.createElement;
		self.titlePane.appendChild(self.titleText);
		self.framePane.appendChildren([
			self.titlePane,
			contents
		]);
		self.inMove := false
	}

	initialize { :self :title :kind :contents |
		self.createElements(contents);
		self.setTitle(title);
		self.setAttributes(kind);
		self.setEventHandlers;
		self
	}

	outerElement { :self |
		self.framePane
	}

	setAttributes { :self :kind |
		self.framePane.setAttribute('class', ['framePane', kind].unwords);
		self.titlePane.setAttribute('class', 'titlePane')
	}

	setEventHandlers { :self |
		self.titlePane.addEventListener('pointerdown', { :event |
			| titleRect = event.target.getBoundingClientRect; |
			event.target.setPointerCapture(event.pointerId);
			self.inMove := true;
			self.x0 := event.x - titleRect.x;
			self.y0 := event.y - titleRect.y;
			self.x := event.x;
			self.y := event.y
		});
		self.titlePane.addEventListener('pointermove', { :event |
			self.inMove.ifTrue {
				event.stopPropagation;
				event.cancelable.ifTrue {
					event.preventDefault;
				};
				self.x := event.x - self.x0;
				self.y := event.y- self.y0;
				self.framePane.style.setProperty('left', self.x.asString ++ 'px', '');
				self.framePane.style.setProperty('top', self.y.asString ++ 'px', '');
			}
		});
		self.titlePane.addEventListener('pointerup', { :event |
			event.target.releasePointerCapture(event.pointerId);
			self.inMove := false
		});
	}

	setTitle { :self :aString |
		self.titleText.textContent := aString
	}

}


+ @Object {

	Frame { :self |
		(* To frame a value it must answer title & outerElement *)
		newFrame().initialize(self.title, self.typeOf, self.outerElement)

	}

}
