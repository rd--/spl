document().getElementById('helpButton').click
document().querySelector('#oracleButton').click
document().createElement('div')
document().getElementById('documentContainer').addEventListener('mouseenter', { :event | [event.type, event.x, event.y].postLine })
TextButton('?', (id: 'helpButton', title: 'Help', accesskey: '?', onclick: 'sh.loadInstructions()')).postLine
