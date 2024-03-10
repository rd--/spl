DocumentTest : [Object] { | program expectedAnswer |

	= { :self :anObject |
		anObject.isDocumentTest & {
			self.program = anObject.program & {
				self.expectedAnswer = anObject.expectedAnswer
			}
		}
	}

	evaluate { :self |
		{
			system.evaluate(self.format)
		}.ifError {
			false
		}
	}

	format { :self |
		self.program ++ ' ~ (' ++ self.expectedAnswer ++ ')'
	}

}

+List {

	asDocumentTest { :self |
		let program = self.select { :each |
			each.beginsWith('>>> ')
		}.collect { :each |
			each.drop(4)
		}.unwords;
		let expectedAnswer = self.reject { :each |
			each.beginsWith('>>> ')
		}.unwords;
		DocumentTest(program, expectedAnswer)
	}

	extractDocumentTests { :self |
		let answer = [];
		let inBlock = false;
		let block = [];
		self.do { :currentLine |
			(
				currentLine.beginsWith('>>> ') & {
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

	DocumentTest { :program :expectedAnswer |
		newDocumentTest().initializeSlots(program, expectedAnswer)
	}

}
