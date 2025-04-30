Table : [Object] { | contents columnLabels columnTypes |

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

	at { :self :i :j |
		self.contents[i][self.columnIndex(j)]
	}

	columnIndex { :self :j |
		j.isString.if {
			let i = self.columnLabels.indexOf(j);
			(i = 0).if {
				self.error('columnIndex: invalid column label')
			} {
				i
			}
		} {
			j.isInteger.if {
				j
			} {
				self.error('columnIndex: invalid column index')
			}
		}
	}

	columnIndices { :self :j |
		j.collect { :each |
			self.columnIndex(each)
		}
	}

	columns { :self :j |
		let i = self.columnIndices(j);
		Table(
			self.contents.columns(i),
			self.columnLabels.atAll(i),
			self.columnTypes.atAll(i)
		)
	}

	rank { :unused |
		2
	}

	rows { :self :i |
		Table(
			self.contents.rows(i),
			self.columnLabels,
			self.columnTypes
		)
	}

	shape { :self |
		self.contents.shape
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+Record {

	asTable { :self |
		let c = self.keys;
		let r = c.collect { :each |
			self.at(each)
		}.transposed;
		Table(r, c)
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
		self.isMatrix.if {
			let n = self.anyOne.size;
			Table(self, [1 .. n].collect(printString:/1))
		} {
			self.allSatisfy(isDictionary:/1).if {
				let c = self.anyOne.keys;
				let r = self.collect { :each |
					c.collect { :k | each.at(k) }
				};
				Table(r, c)
			} {
				self.error('Table: invalid data')
			}
		}
	}

}

