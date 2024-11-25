/* Requires: SmallKansas Window */

TextEditor : [Object, UserEventTarget, View] {

	| smallKansas editorPane editorText mimeType title clientMenuItems eventListeners |

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
		system.window.insertStringAtCaret(aString)
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
				self.editorText.innerHtml := aString
			},
			'text/markdown' -> {
				self.editorText.innerHtml := aString.markdownToHtml
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
				self.browserOn(
					system.window.selectedTextOrWordAtCaret,
					event
				)
			},
			MenuItem('Do It', 'd') { :event |
				let text = system.window.selectedTextOrParagraphAtCaret;
				self.evaluate(text, event)
			},
			MenuItem('Help For It', 'h') { :event |
				self.helpFor(
					system.window.selectedTextOrWordAtCaret.asMethodName,
					event
				)
			},
			MenuItem('Implementors Of It', 'm') { :event |
				self.implementorsOf(
					system.window.selectedTextOrWordAtCaret.asMethodName,
					event
				)
			},
			MenuItem('Inspect It', 'i') { :event |
				self.inspectorOn(
					self.evaluate(
						system.window.selectedTextOrWordAtCaret,
						event
					),
					event
				)
			},
			MenuItem('Play It', 'Enter') { :event |
				let text = system.window.selectedTextOrParagraphAtCaret;
				let decoratedText = ['{', text, '}.value.play'].unwords;
				self.evaluate(decoratedText, event)
			},
			MenuItem('Print It', 'p') { :event |
				let text = system.window.selectedTextOrParagraphAtCaret;
				let answer = self.evaluate(text, event).asString;
				subject.insertText(' ' ++ answer)
			},
			MenuItem('References To It', nil) { :event |
				self.referencesTo(
					system.window.selectedTextOrWordAtCaret.asMethodName,
					event
				)
			},
			MenuItem('Require It', nil) { :event |
				system.package(
					system.window.selectedTextOrWordAtCaret
				).require.then { :unused |
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
