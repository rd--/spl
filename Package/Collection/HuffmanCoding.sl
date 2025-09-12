HuffmanCoding : [Object] { | symbolTable encoding |

	decode { :self |
		let codeTable = self.symbolTable.associations.sortOn { :x | x.value.size }.reverse;
		let codes = self.encoding;
		let symbols = [];
		{ codes.isEmpty }.whileFalse {
			let code = codeTable.detect { :each |
				codes.beginsWith(each.value)
			};
			symbols.add(code.key);
			codes.removeFirst(code.value.size)
		};
		symbols
	}

	decodeString { :self |
		self.decode.stringJoin
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+[Record, Map] {

	HuffmanCoding { :symbolTable :encoding |
		newHuffmanCoding().initializeSlots(symbolTable, encoding)
	}

}

+String {

	huffmanEncode { :self |
		self.contents.huffmanEncode
	}

}

+List {

	huffmanEncode { :self |
		let huffmanSymbolTable = { :weights |
			let heap = Heap();
			weights.sortedCounts.do { :each |
				heap.add(each.key -> [each.value -> []])
			};
			{ heap.size > 1 }.whileTrue {
				let low = heap.removeFirst;
				let high = heap.removeFirst;
				low.value.do { :each |
					each.value.addFirst(0)
				};
				high.value.do { :each |
					each.value.addFirst(1)
				};
				heap.add((low.key + high.key) -> (low.value ++ high.value))
			};
			heap.array.first.value.asMap
		};
		let symbolTable = self.asBag.huffmanSymbolTable;
		HuffmanCoding(
			symbolTable,
			self.collect { :each |
				symbolTable.at(each)
			}.catenate
		)
	}

}
