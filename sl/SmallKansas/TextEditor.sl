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

	currentText { :self |
		| text = system.window.getSelectedText; |
		text.isEmpty.ifTrue {
			text := self.editorText.textContent
		};
		text
	}

	currentWord { :self |
		| text = system.window.getSelectedText; |
		text.isEmpty.ifTrue {
			(* This should get the word at point, but it doesn't! *)
			nil
		};
		text
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
		[
			MenuItem('Accept It', 's') { :event |
				self.dispatchEvent(
					CustomEvent(
						'accept',
						(
							detail: self.editorText.textContent
						)
					)
				)
			},
			MenuItem('Browse It', 'b') { :event |
				self.smallKansas.browserOn([self.currentWord], event)
			},
			MenuItem('Do It', 'd') { :event |
				self.smallKansas.evaluate(self.currentText, event)
			},
			MenuItem('Help For It', 'h') { :event |
				self.smallKansas.helpFor(self.currentWord.asMethodName, event)
			},
			MenuItem('Implementors Of It', 'm') { :event |
				self.smallKansas.implementorsOf(self.currentWord.asMethodName, event)
			},
			MenuItem('Inspect It', 'i') { :event |
				self.smallKansas.inspectorOn(self.smallKansas.evaluate(self.currentWord, event), event)
			},
			MenuItem('Play It', 'Enter') { :event |
				self.smallKansas.evaluate('{ ' ++ self.currentText ++ ' }.play', event)
			},
			MenuItem('Print It', 'p') { :event |
				self.insertText(' ' ++ self.smallKansas.evaluate(self.currentText, event).asString)
			},
			MenuItem('References To It', nil) { :event |
				self.smallKansas.referencesTo(self.currentWord.asMethodName, event)
			},
			MenuItem('Require It', nil) { :event |
				system.package(self.currentWord).require.then {
					self.insertText('*Package loaded*')
				}
			},
			MenuItem('Reset Synthesiser', '.') { :event |
				system.clock.removeAll;
				system.defaultScSynth.reset
			}
		] ++ self.clientKeyBindings
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

	TextEditor { :self :title :mimeType :contents |
		newTextEditor().initialize(self, title, mimeType, contents)
	}

}
