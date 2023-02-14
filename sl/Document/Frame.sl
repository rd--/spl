Frame : [Object] { | framePane titlePane contents titleText inMove x0 y0 xP yP |

	createElements { :self :contents |
		self.framePane := 'div'.createElement;
		self.titlePane :=  'div'.createElement;
		self.titleText := 'pre'.createElement;
		self.titlePane.appendChild(self.titleText);
		self.framePane.appendChildren([
			self.titlePane,
			contents
		]);
		self.contents := contents;
		self.inMove := false
	}

	outerElement { :self |
		self.framePane
	}

	setAttributes { :self |
		self.framePane.setAttribute('class', 'framePane');
		self.titlePane.setAttribute('class', 'titlePane')
	}

	setEventHandlers { :self |
		self.titlePane.addEventListener('pointerdown', { :event |
			| titleRect = event.target.getBoundingClientRect; |
			event.target.setPointerCapture(event.pointerId);
			self.inMove := true;
			self.xP := event.x;
			self.yP := event.y;
			self.x0 := event.x - titleRect.x;
			self.y0 := event.y - titleRect.y
		});
		self.titlePane.addEventListener('pointermove', { :event |
			self.inMove.ifTrue {
				| coarseness = 5; |
				event.stopPropagation;
				event.cancelable.ifTrue {
					event.preventDefault;
				};
				((event.x - self.xP).abs > coarseness | {
					(event.y - self.yP).abs > coarseness
				}).ifTrue {
					self.framePane.style.setProperty('left', (event.x - self.x0).asString ++ 'px', '');
					self.framePane.style.setProperty('top', (event.y- self.y0).asString ++ 'px', '');
					self.xP := event.x;
					self.yP := event.y
				};
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
		(* To frame a value it must answer outerElement & title *)
		| frame = newFrame(); |
		frame.createElements(self.outerElement);
		frame.setAttributes;
		frame.setEventHandlers;
		frame.setTitle(self.title);
		frame
	}

}
