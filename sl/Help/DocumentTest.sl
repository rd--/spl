DocumentTest : [Object] { | prefix program expectedAnswer |

	= { :self :anObject |
		self.hasEqualSlots(anObject)
	}

	evaluate { :self |
		{
			system.evaluate(self.format)
		}.ifError {
			false
		}
	}

	format { :self |
		(self.prefix = '>>>').if {
			self.program.unwords ++ ' ~ (' ++ self.expectedAnswer.unwords ++ ')'
		} {
			(self.prefix = '>>').if {
				[
					'(',
					self.program.unwords,
					').printString.utf8ByteArray = ',
					self.expectedAnswer.unlines.utf8ByteArray.storeString
				].stringJoin
			} {
				self.error('format: unknown prefix: ' ++ self.prefix)
			}
		}
	}

	storeString { :self |
		self.storeStringAsInitializeSlots
	}

}

+List {

	asDocumentTest { :self |
		let prefix = RegExp('>+').match(self[1]);
		let program = self.select { :each |
			each.beginsWith(prefix)
		}.collect { :each |
			each.drop(prefix.size + 1)
		};
		let expectedAnswer = self.reject { :each |
			each.beginsWith(prefix)
		};
		DocumentTest(prefix, program, expectedAnswer)
	}

	extractDocumentTests { :self |
		let answer = [];
		let inBlock = false;
		let block = [];
		self.do { :currentLine |
			(
				currentLine.beginsWithAnyOf(['>> ', '>>> ']) & {
					inBlock.not
				}
			).ifTrue {
				inBlock := true
			};
			(
				(
					currentLine.isEmpty | {
						currentLine.isCodeFence
					}
				) & {
					inBlock
				}
			).ifTrue {
				answer.add(block.asDocumentTest);
				block.removeAll;
				inBlock := false
			};
			inBlock.ifTrue {
				block.add(currentLine)
			}
		};
		answer
	}

}

+String {

	DocumentTest { :prefix :program :expectedAnswer |
		newDocumentTest().initializeSlots(prefix, program, expectedAnswer)
	}

}
