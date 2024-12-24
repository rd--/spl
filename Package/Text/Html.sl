Html : [Object] { | contents |

	asHtmlElement { :self :document |
		document.parseHtml(self.contents)
	}

	isDocument { :self |
		self.contents.beginsWith('<!DOCTYPE html>')
	}

	isFragment { :self |
		self.isDocument.not
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+String {

	Html { :self |
		newHtml().initializeSlots(self)
	}

}

+List {

	integerPartitionsTable { :self |
		let period = self.anyOne.sum;
		let cell = { :c |
			c.isInteger.ifFalse {
				self.error('integerPartitionsTable: not integer')
			};
			(c = 1).if {
				'<td>1</td>'
			} {
				'<td colspan="%">%</td>'.format([c, c])
			}
		};
		let row = { :r |
			(r.sum = period).ifFalse {
				self.error('integerPartitionsTable: row does not sum to period')
			};
			'<tr>%</tr>'.format([
				r.collect(cell:/1).join('')
			])
		};
		Html(
			'<table style="%"><tbody>\n%\n</tbody></table>'.format([
				'width: 100%; border: solid 1px black',
				self.collect(row:/1).join('\n')
			])
		)
	}

}
