SuperColliderSynthesiserStatusMonitor : [Object, SmallKansan] {

	openIn { :self :smallKansas :event |
		let textEditor = smallKansas.TextEditor(self.title, 'text/html', '---');
		let frame = smallKansas.addFrameWithAnimator(textEditor, event, 1) {
			textEditor.setEditorText(
				system.scSynth.isConnected.if {
					system.scSynth.status.asHtmlTable(asString:/1).outerHtml
				} {
					'---'
				}
			)
		};
		textEditor.editable := false;
		frame.outerElement.style.setProperties((height: '14em', width: '18em'));
		frame
	}

	title { :self |
		'SuperCollider Synthesiser Status Monitor'
	}

}
