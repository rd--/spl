# Terse Guide to Document

## System -- window (cli)
```
system.typeOf = 'System'
system.window.typeOf = 'Window'
system.window.navigator.typeOf = 'Navigator'
system.window.navigator.userAgent.typeOf = 'String'
system.window.document = nil {- cli -}
system.window.navigator.maxTouchPoints = nil {- cli -}
system.window.alert('An alert') {- cli -}
'Continue'
system.window.alert('A confirm') {- cli -}
'Continue'
system.window.prompt('A prompt ', '23') {- cli -}
'Continue'
```

## Window -- document
```
system.window.document.body
let b = system.window.document.body; let e = 'div'.createElement; e.append(['Some text']); b.append([e])
system.window.getSelectedText
'helpButton'.getElementById.click
'helpButton'.getElementById.style.getPropertyValue('font-size')
'helpButton'.getElementById.style.setProperty('font-size','24px','important')
'helpButton'.getElementById.style['font-size']
'helpButton'.getElementById.style['font-size'] := '24px'
'helpButton'.getElementById.style.setProperties(['font-size' -> '24px', 'font-style' -> 'italic', 'background-color' -> 'pink'])
'helpButton'.getElementById.style.cssText = ''
'helpButton'.getElementById.style.cssText := 'font-size: 24px; font-style: italic; background-color: pink'
'#oracleButton'.querySelector.click
'div'.createElement
'documentContainer'.getElementById.addEventListener('mouseenter', { :event | [event.type, event.x, event.y].postLine })
'statusText'.getElementById.innerText('---')
'programMenu'.getElementById.options.length
'programMenu'.getElementById.selectedIndex
```

## Navigator -- midi
```
system.window.navigator.requestMidiAccess.thenElse { :midiAccess | workspace::midi := midiAccess } { :message | ('no midi: ' + message).postLine }
workspace::midi.inputs.do { :each | each.postLine; each.onmidimessage { :event | event.data.postLine } }
workspace::midi.sysexEnabled
```

## TextButton
```
TextButton('Begin', (id: 'beginButton', title: 'Begin (b)', accesskey: 'b', onclick: 'globalScSynth.boot()'))
TextButton('?', (id: 'helpButton', title: 'Help (?)', accesskey: '?', onclick: 'sh.loadInstructions()'))
```

