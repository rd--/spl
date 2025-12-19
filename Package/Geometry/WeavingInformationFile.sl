WeavingInformationFile : [Object] { | contents |

	drawdownMatrix { :self :m :n |
		self.hasLiftplan.if {
			self.liftplanMatrix.take(m).dot(
				self.threadingMatrix.collect { :each |
					each.take(n)
				}
			)
		} {
			drawdownMatrix(
				self.threadingMatrix.collect { :each |
					each.take(n)
				},
				self.tieupMatrix,
				self.treadlingMatrix.take(m)
			)
		}
	}

	drawdownMatrix { :self |
		self.hasLiftplan.if {
			self.liftplanMatrix.dot(
				self.threadingMatrix
			)
		} {
			drawdownMatrix(
				self.threadingMatrix,
				self.tieupMatrix,
				self.treadlingMatrix
			)
		}
	}

	hasLiftplan { :self |
		self.hasSection('LIFTPLAN')
	}

	hasSection { :self :sectionName |
		self.contents.keys.includes(sectionName)
	}

	liftplanMatrix { :self |
		self.hasLiftplan.if {
			let r = self.liftplanRecord;
			let m = r.size;
			let n = self.shafts;
			r.weavingInformationFileRecordToMatrix(m, n)
		} {
			liftplanMatrix(
				self.tieupMatrix,
				self.treadlingMatrix
			)
		}
	}

	liftplanRecord { :self |
		self.contents.at('LIFTPLAN')
	}

	shafts { :self |
		self.weaving.at('Shafts')
	}

	threadingMatrix { :self |
		let r = self.threadingRecord;
		let m = r.size;
		let n = self.shafts;
		r.weavingInformationFileRecordToMatrix(m, n).transpose
	}

	threadingRecord { :self |
		self.contents.at('THREADING')
	}

	tieupMatrix { :self |
		self.tieupRecord
		.weavingInformationFileRecordToMatrix(
			self.treadles,
			self.shafts
		).matrixRotate(1)
	}

	tieupRecord { :self |
		self.contents.at('TIEUP')
	}

	treadles { :self |
		self.weaving.at('Treadles')
	}

	treadlingMatrix { :self |
		let r = self.treadlingRecord;
		let m = r.size;
		let n = self.treadles;
		r.weavingInformationFileRecordToMatrix(m, n)
	}

	treadlingRecord { :self |
		self.contents.at('TREADLING')
	}

	warp { :self |
		self.contents.at('WARP')
	}

	warpThreads { :self |
		self.warp.at('Threads')
	}

	weaving { :self |
		self.contents.at('WEAVING')
	}

	weft { :self |
		self.contents.at('WEFT')
	}

	weftThreads { :self |
		self.weft.at('Threads')
	}

}

+Record {

	WeavingInformationFile { :self |
		newWeavingInformationFile().initializeSlots(self)
	}

}

+String {

	WeavingInformationFile { :self |
		WeavingInformationFile(self.parseIni)
	}

}

+String {

	parseWeavingInformationFileIntegerList { :self |
		self
		.splitBy(',')
		.reject(isEmpty:/1)
		.collect(parseDecimalInteger:/1)
	}

}

+SmallFloat {

	parseWeavingInformationFileIntegerList { :self |
		self.isZero.if {
			[]
		} {
			[self]
		}
	}

}

+Record {

	weavingInformationFileRecordToMatrix { :self :rowCount :columnCount |
		let p = self.keys.collect(parseDecimalInteger:/1);
		let q = self.values.collect(parseWeavingInformationFileIntegerList:/1);
		let matrix = [rowCount, columnCount].zeroMatrix;
		1.toDo(p.size) { :i |
			let r = p[i];
			q[i].do { :j |
				matrix[r][j] := 1
			}
		};
		matrix
	}

}
