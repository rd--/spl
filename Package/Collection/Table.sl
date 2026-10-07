Table : [Object, Store, Equal] {

	| cellMatrix columnLabels columnTypes |

	asHtml { :self |
		let h = '<tr><th></th>%</tr>'.format([
			self.columnLabels.collect { :each |
				'<th scope="col">%</th>'.format([each])
			}.stringCatenate
		]);
		let r = self.cellMatrix.withIndexCollect { :a :i |
			'<tr><th scope="row">%</th>%<tr>'.format([
				i.printString,
				a.collect { :b |
					'<td>%</td>'.format([b])
				}.stringCatenate
			])
		};
		'<table class="TableData">\n%\n%\n</table>'.format([h, r.unlines])
	}

	atPath { :self :operand |
		let [i, j] = operand;
		let row = self.cellMatrix[i];
		row[self.columnIndex(j)]
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
			self.cellMatrix.columns(i),
			self.columnLabels.atAll(i),
			self.columnTypes.atAll(i)
		)
	}

	rank { :unused |
		2
	}

	rows { :self :i |
		Table(
			self.cellMatrix.rows(i),
			self.columnLabels,
			self.columnTypes
		)
	}

	shape { :self |
		self.cellMatrix.shape
	}

}

+Record {

	[Table, asTable] { :self |
		let c = self.keys;
		let r = c.collect { :each |
			self.at(each)
		}.transpose;
		Table(r, c)
	}

}

+List {

	Table { :self :columnLabels :columnTypes |
		self.assertIsMatrix('Table');
		newTable().initializeSlots(self, columnLabels, columnTypes)
	}

	Table { :self :columnLabels |
		Table(self, columnLabels, self[1].collect(typeOf/1))
	}

	Table { :self |
		self.isMatrix.if {
			let n = self.anyOne.size;
			Table(self, [1 .. n].collect(printString/1))
		} {
			self.allSatisfy(isDictionary/1).if {
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

