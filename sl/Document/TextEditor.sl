TextEditor : [Object, View] { | editorPane editorText isRichText title |

	contextMenuEntries { :self |
		| k = self.keyBindings; |
		k.keys.withCollect(k.values) { :aString :anAssociation |
			aString -> anAssociation.value
		}
	}


	createElements { :self |
		self.editorPane := 'div'.createElement;
		self.editorText := self.isRichText.if {
			'div'.createElement
		} {
			'pre'.createElement
		};
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

	font { :self :fontName|
		self.editorPane.style.setProperty('--font-family', fontName, '')
	}

	fontSize { :self :fontSize |
		self.editorPane.style.setProperty('--font-size', fontSize.asString ++ 'em', '')
	}

	initialize { :self :title :isRichText :contents |
		self.title := title;
		self.isRichText := isRichText;
		self.createElements;
		self.setAttributes;
		self.setEventHandlers;
		self.setEditorText(contents);
		self
	}

	keyBindings { :self |
		(
			'Browse It (b)': 'b' -> { :event |
				workspace::smallKansas.browserOn([self.currentWord], event)
			},
			'Do It (d)': 'd' -> { :event |
				self.currentText.eval
			},
			'Font Menu (f)' : 'f' -> { :event |
				workspace::smallKansas.fontMenuOn(self, true, event)
			},
			'Font Size Menu (s)' : 's' -> { :event |
				workspace::smallKansas.fontSizeMenuOn(self, true, event)
			},
			'Help For It (h)': 'h' -> { :event |
				workspace::smallKansas.helpFor(self.currentWord.asMethodName, event)
			},
			'Implementors Of It (m)': 'm' -> { :event |
				workspace::smallKansas.implementorsOf(self.currentWord.asMethodName, event)
			},
			'Play It (Enter)': 'Enter' -> { :event |
				('{ ' ++ self.currentText ++ ' }.play').eval
			},
			'Reset Synthesiser (.)': '.' -> { :event |
				workspace::clock.clear;
				system.defaultScSynth.reset
			}
		)
	}


	outerElement { :self |
		self.editorPane
	}

	setAttributes { :self |
		self.editorPane.setAttribute('class', 'editorPane');
		self.editorText.setAttribute('class', 'editorText');
		self.editorText.setAttributes((contentEditable: 'true', spellcheck: 'false'))
	}

	setEventHandlers { :self |
		self.editorText.addEventListener('contextmenu') { :event |
			event.preventDefault;
			self.textEditorMenu(event)
		};
		self.editorText.addEventListener('keydown') { :event |
			| bindingsArray = self.keyBindings.values.collect { :each |
				each.key -> {
					event.preventDefault;
					each.value.value(nil)
				}
			}; |
			event.ctrlKey.ifTrue {
				event.key.caseOfOtherwise(
					bindingsArray,
					{ :key |
						('TextEditor>keydown: not handled: ' ++ key).postLine
					}
				)
			}
		}
	}

	setEditorText { :self :aString |
		| isMarkdown = aString.isEmpty | { aString[1] = '#' }; |
		self.isRichText.if {
			self.editorText.innerHTML := isMarkdown.if {
				aString.markdownToHtml
			} {
				'<pre>' ++ aString ++ '</pre>'
			}
		} {
			self.editorText.textContent := aString
		}
	}

	textEditorMenu { :self :event |
		workspace::smallKansas.menu(
			'Text Editor Menu',
			self.contextMenuEntries,
			true,
			event
		)
	}

}

+ String {

	TextEditor { :title :isRichText :contents |
		newTextEditor().initialize(title, isRichText, contents)
	}

}
