(* Requires: SmallKansas Window *)

TextEditor : [Object, UserEventTarget, View] { | smallKansas editorPane editorText mimeType title clientKeyBindings eventListeners |

	addKeyBindings { :self :aCollection |
		self.clientKeyBindings.addAll(aCollection)
	}

	createElements { :self |
		self.editorPane := 'div'.createElement (
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

	currentSelection { :self |
		| text = system.window.getSelectedText; |
		text.isEmpty.ifTrue {
			text := self.editorText.textContent
		};
		text
	}

	currentText { :self |
		self.editorText.textContent
	}

	currentWord { :self |
		| text = system.window.getSelectedText; |
		text.isEmpty.if {
			system.window.wordAtCaret
		} {
			text
		}
	}

	editable { :self :aBoolean |
		self.editorText.setAttribute('contentEditable', aBoolean.printString)
	}

	initialize { :self :smallKansas :title :mimeType :contents |
		self.smallKansas := smallKansas;
		self.title := title;
		self.mimeType := mimeType;
		self.clientKeyBindings := [];
		self.createElements;
		self.setEventHandlers;
		self.setEditorText(contents);
		self.eventListeners := Record();
		self
	}

	insertText { :self :aString |
		aString.insertAtCursor
	}

	keyBindings { :self |
		self.smallKansas.standardTextEditorBindings(self) ++ self.clientKeyBindings
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
			|(
				bindingsArray = self.keyBindings.collect { :menuItem |
					menuItem.accessKey -> {
						event.preventDefault;
						menuItem.onSelect . (nil)
					}
				}
			)|
			event.ctrlKey.ifTrue {
				event.key.caseOfOtherwise(
					bindingsArray,
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
			self.keyBindings,
			true,
			event
		)
	}

}

+SmallKansas {

	standardTextEditorBindings { :self :subject |
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
				self.browserOn([subject.currentWord], event)
			},
			MenuItem('Do It', 'd') { :event |
				self.evaluate(subject.currentSelection, event)
			},
			MenuItem('Help For It', 'h') { :event |
				self.helpFor(subject.currentWord.asMethodName, event)
			},
			MenuItem('Implementors Of It', 'm') { :event |
				self.implementorsOf(subject.currentWord.asMethodName, event)
			},
			MenuItem('Inspect It', 'i') { :event |
				self.inspectorOn(self.evaluate(subject.currentWord, event), event)
			},
			MenuItem('Play It', 'Enter') { :event |
				self.evaluate('{ ' ++ subject.currentSelection ++ ' }.play', event)
			},
			MenuItem('Print It', 'p') { :event |
				subject.insertText(' ' ++ self.evaluate(subject.currentSelection, event).asString)
			},
			MenuItem('References To It', nil) { :event |
				self.referencesTo(subject.currentWord.asMethodName, event)
			},
			MenuItem('Require It', nil) { :event |
				system.package(subject.currentWord).require.then {
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
