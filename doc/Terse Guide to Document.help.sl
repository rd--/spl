document().getElementById('helpButton').click
document().querySelector('#oracleButton').click
document().createElement('div')
document().getElementById('documentContainer').addEventListener('mouseenter', { :event | [event.type, event.x, event.y].postLine })
TextButton('Begin', (id: 'beginButton', title: 'Begin (b)', accesskey: 'b', onclick: 'globalScSynth.boot()'))
TextButton('?', (id: 'helpButton', title: 'Help (?)', accesskey: '?', onclick: 'sh.loadInstructions()'))
document().getElementById('statusText').innerText('---')
document().getElementById('programMenu').options.length
document().getElementById('programMenu').selectedIndex
window().prompt('Integer: ', '23')

window().navigator.userAgent
window().navigator.maxTouchPoints

window().navigator.requestMidiAccess.thenElse { :midiAccess | workspace::midi := midiAccess } { :message | ('no midi: ' + message).postLine }
workspace::midi.inputs.do { :each | each.postLine; each.onmidimessage { :event | event.data.postLine } }
workspace::midi.sysexEnabled
