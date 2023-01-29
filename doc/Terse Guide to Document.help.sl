document().getElementById('helpButton').click
document().querySelector('#oracleButton').click
document().createElement('div')
document().getElementById('documentContainer').addEventListener('mouseenter', { :event | [event.type, event.x, event.y].postLine })
TextButton('Begin', (id: 'beginButton', title: 'Begin (b)', accesskey: 'b', onclick: 'globalScsynth.boot()'))
TextButton('?', (id: 'helpButton', title: 'Help (?)', accesskey: '?', onclick: 'sh.loadInstructions()')).postLine
document().getElementById('statusText').innerText('---')
document().getElementById('programMenu').options.length.postLine
document().getElementById('programMenu').selectedIndex
window().prompt('Integer: ', '23')
