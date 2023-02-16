TextEditor : [Object] { | editorPane editorText isRichText title |

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
			'Browse It': 'b' -> {
				workspace::smallKansas.browserOn([system.window.getSelectedText])
			},
			'Do It': 'd' -> {
				self.currentText.eval
			},
			'Help For It': 'h' -> {
				workspace::smallKansas.helpFor(system.window.getSelectedText.asMethodName)
			},
			'Implementors Of It': 'm' -> {
				workspace::smallKansas.implementorsOf(system.window.getSelectedText.asMethodName)
			},
			'Play It': 'Enter' -> {
				('{ ' ++ self.currentText ++ ' }.play').eval
			},
			'Reset': '.' -> {
				workspace::clock.clear;
				system.defaultScSynth.reset;
			}
		)
	}

	keyBindingsArray { :self |
		self.keyBindings.values.collect { :each |
				each.key -> {
					event.stopPropogation;
					event.preventDefault;
					each.value.value
				}
		}
	}


	outerElement { :self |
		self.editorPane
	}

	setAttributes { :self |
		self.editorPane.setAttribute('class', 'editorPane');
		self.editorText.setAttributes((contentEditable: 'true', spellcheck: 'false'))
	}

	setEventHandlers { :self |
		self.editorText.addEventListener('keydown', { :event |
			| bindingsArray = self.keyBindings.values.collect { :each |
				each.key -> {
					event.preventDefault;
					each.value.value
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
		})
	}

	setEditorText { :self :aString |
		self.isRichText.if {
			self.editorText.innerHTML := aString.markdownToHtml
		} {
			self.editorText.textContent := aString
		}
	}

}

+ String {

	TextEditor { :title :isRichText :contents |
		newTextEditor().initialize(title, isRichText, contents)
	}

}
