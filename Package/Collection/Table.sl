Table : [Object] { | contents columnLabels columnTypes |

	asHtmlTable { :self |
		self.asHtmlTable(asString:/1)
	}

	asHtml { :self |
		let h = '<tr><th></th>%</tr>'.format([
			self.columnLabels.collect { :each |
				'<th scope="col">%</th>'.format([each.asString])
			}.stringCatenate
		]);
		let r = self.contents.withIndexCollect { :a :i |
			'<tr><th scope="row">%</th>%<tr>'.format([
				i.asString,
				a.collect { :b |
					'<td>%</td>'.format([b.asString])
				}.stringCatenate
			])
		};
		'<table class="TableData">\n%\n%\n</table>'.format([h, r.unlines])
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+List {

	Table { :self :columnLabels :columnTypes |
		newTable().initializeSlots(self, columnLabels, columnTypes)
	}

	Table { :self :columnLabels |
		Table(self, columnLabels, self[1].collect(typeOf:/1))
	}

	Table { :self |
		Table(self, [1 .. self[1].size].collect(printString:/1))
	}

}

