{- Requires: SmallKansas Window -}

TextEditor : [Object, UserEventTarget, View] { | smallKansas editorPane editorText mimeType title clientMenuItems eventListeners |

	addMenuItems { :self :aCollection |
		self.clientMenuItems.addAll(aCollection)
	}

	createElements { :self |
		self.editorPane := 'div'.createElement(
			class: 'editorPane'
		);
		self.editorText := (self.mimeType = 'text/plain').if {
			'pre'.createElement
		} {
			'div'.createElement
		};
		self.editorText.setAttributes((
			class: 'editorText',
			contentEditable: 'true',
			spellcheck: 'false'
		));
		self.editorPane.appendChild(self.editorText)
	}

	currentText { :self |
		self.editorText.textContent
	}

	editable { :self :aBoolean |
		self.editorText.setAttribute('contentEditable', aBoolean.printString)
	}

	initialize { :self :smallKansas :title :mimeType :contents |
		self.smallKansas := smallKansas;
		self.title := title;
		self.mimeType := mimeType;
		self.clientMenuItems := [];
		self.createElements;
		self.setEventHandlers;
		self.setEditorText(contents);
		self.eventListeners := Record();
		self
	}

	insertText { :self :aString |
		aString.insertAtCursor
	}

	menuItems { :self |
		self.smallKansas.standardTextEditorMenuItems(self) ++ self.clientMenuItems
	}

	outerElement { :self |
		self.editorPane
	}

	setEventHandlers { :self |
		self.editorText.addEventListener('contextmenu') { :event |
			event.preventDefault;
			self.textEditorMenu(event)
		};
		self.editorText.addEventListener('keydown') { :event |
			let bindings = self.menuItems.collect { :each |
				each.keyBinding(event)
			};
			event.ctrlKey.ifTrue {
				event.key.caseOfOtherwise(
					bindings,
					{ :key | nil }
				)
			}
		}
	}

	setEditorText { :self :aString |
		self.mimeType.caseOfOtherwise([
			'text/html' -> {
				self.editorText.innerHTML := aString
			},
			'text/markdown' -> {
				self.editorText.innerHTML := aString.markdownToHtml
			},
			'text/plain' -> {
				self.editorText.textContent := aString
			}
		]) {
			self.warning('setEditorText: unkown mimeType: ' ++ self.mimeType)
		}
	}

	textEditorMenu { :self :event |
		self.smallKansas.menu(
			'Text Editor Menu',
			self.menuItems,
			true,
			event
		)
	}

}

+SmallKansas {

	standardTextEditorMenuItems { :self :subject |
		let currentSelection = {
			let text = system.window.getSelectedText;
			text.isEmpty.ifTrue {
				text := subject.currentText
			};
			text
		};
		[
			MenuItem('Accept It', 's') { :event |
				subject.dispatchEvent(
					CustomEvent(
						'accept',
						(
							detail: subject.currentText
						)
					)
				)
			},
			MenuItem('Browse It', 'b') { :event |
				self.browserOn([system.window.currentWord], event)
			},
			MenuItem('Do It', 'd') { :event |
				self.evaluate(currentSelection(), event)
			},
			MenuItem('Help For It', 'h') { :event |
				self.helpFor(system.window.currentWord.asMethodName, event)
			},
			MenuItem('Implementors Of It', 'm') { :event |
				self.implementorsOf(system.window.currentWord.asMethodName, event)
			},
			MenuItem('Inspect It', 'i') { :event |
				self.inspectorOn(self.evaluate(system.window.currentWord, event), event)
			},
			MenuItem('Play It', 'Enter') { :event |
				let text = '{ ' ++ currentSelection() ++ ' }.value.play';
				text.postLine;
				self.evaluate(text, event)
			},
			MenuItem('Print It', 'p') { :event |
				subject.insertText(' ' ++ self.evaluate(currentSelection(), event).asString)
			},
			MenuItem('References To It', nil) { :event |
				self.referencesTo(system.window.currentWord.asMethodName, event)
			},
			MenuItem('Require It', nil) { :event |
				system.package(system.window.currentWord).require.then { :unused |
					subject.insertText('*Package loaded*')
				}
			},
			MenuItem('Reset Synthesiser', '.') { :event |
				system.clock.removeAll;
				system.scSynth.reset
			}
		]
	}

	TextEditor { :self :title :mimeType :contents |
		newTextEditor().initialize(self, title, mimeType, contents)
	}

}
