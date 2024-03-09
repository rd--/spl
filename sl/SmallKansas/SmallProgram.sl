{- Requires: SmallKansas Window -}

SmallProgram : [Object, UserEventTarget, View, SmallKansan] { | smallKansas outerElement program answer historyCursor eventListeners |

	addToAnswer { :self :result |
		let answerText = 'pre'.createElement(class: 'answerText');
		answerText.textContent := result.printString;
		self.answer.appendChild(answerText);
		result.isPromise.ifTrue {
			result.then { :nextResult |
				self.addToAnswer(nextResult)
			}
		}
	}

	adjustRows { :self |
		self.program.rows := self.program.value.lineCount
	}

	clearAnswer { :self |
		self.answer.removeAllChildren
	}

	clearProgram { :self |
		self.program.value := ''
	}

	currentText { :self |
		self.program.value
	}

	focus { :self |
		self.program.focus
	}

	initialize { :self :smallKansas |
		self.smallKansas := smallKansas;
		self.outerElement := 'div'.createElement(class: 'smallProgram');
		self.program := 'textarea'.createElement(class: 'program');
		self.answer := 'div'.createElement(class: 'answer');
		self.historyCursor := nil;
		self.program.rows := 1;
		self.program.addEventListener('contextmenu') { :event |
			event.preventDefault;
			self.programMenu(event)
		};
		self.program.addEventListener('keydown') { :event |
			event.shiftKey.ifTrue {
				(event.key = 'Enter').ifTrue {
					let result = self.smallKansas.evaluate(self.program.value, nil);
					event.preventDefault;
					self.addToAnswer(result);
					self.onEvaluate;
					self.historyCursor := nil
				};
				(event.key = 'ArrowUp').ifTrue {
					event.preventDefault;
					self.readHistory(-1)
				};
				(event.key = 'ArrowDown').ifTrue {
					event.preventDefault;
					self.readHistory(1)
				}
			};
			self.adjustRows
		};
		self.outerElement.appendChild(self.program);
		self.outerElement.appendChild(self.answer);
		self.eventListeners := Record();
		self.focus;
		self
	}

	onEvaluate { :self |
		self.dispatchEvent(
			CustomEvent(
				'evaluate',
				(
					detail: self.currentText
				)
			)
		)
	}

	openIn { :self :smallKansas :event |
		smallKansas.addFrame(
			smallKansas.SmallProgram,
			event
		)
	}

	programMenu { :self :event |
		self.smallKansas.menu(
			'Small Program Menu',
			self.smallKansas.standardTextEditorMenuItems(self),
			true,
			event
		)
	}

	readHistory { :self :anInteger |
		let history = self.smallKansas.history;
		self.historyCursor.ifNil {
			self.historyCursor := history.size
		};
		self.historyCursor := self.historyCursor + anInteger;
		self.setProgramText(history.atWrap(self.historyCursor))
	}

	readOnly { :self :aBoolean |
		self.program.readOnly := aBoolean
	}

	setProgramText { :self :aString |
		let end = aString.size;
		self.program.value := aString;
		self.program.rows := aString.lineCount;
		self.program.focus;
		self.program.setSelectionRange(end, end)
	}

}

+SmallKansas {

	SmallProgram { :self |
		newSmallProgram().initialize(self)
	}

}
