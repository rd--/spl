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

	initialize { :self :title :isRichText :contents |
		self.title := title;
		self.isRichText := isRichText;
		self.createElements;
		self.setAttributes;
		self.setEventHandlers;
		self.setEditorText(contents);
		self
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
			event.ctrlKey.ifTrue {
				event.key.caseOfOtherwise([
					'Enter' -> {
						| text = system.window.getSelectedText; |
						text.isEmpty.ifTrue {
							text := event.target.textContent
						};
						('{ ' ++  text ++ ' }.play').eval
					},
					'.' -> {
						workspace::clock.clear;
						system.defaultScSynth.reset;
					},
					'?' -> {
						workspace::smallKansas.helpFor(system.window.getSelectedText)
					}
				], { :key |
					('TextEditor>keydown: not handled: ' ++ key).postLine
				})
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
