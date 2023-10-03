ScSynthStatusMonitor : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		|(
			textEditor = smallKansas.TextEditor(self.title, 'text/html', '---'),
			frame = smallKansas.addFrameWithAnimator(textEditor, event, 1) {
				textEditor.setEditorText(
					system.defaultScSynth.isAlive.if {
						system.defaultScSynth.status.asHtmlTable(asString:/1).outerHTML
					} {
						'---'
					}
				)
			}
		)|
		textEditor.editable := false;
		frame.outerElement.style.setProperties((height: '14em', width: '18em'));
		frame
	}

	title { :self |
		'ScSynth Status Monitor'
	}

}
