+String {

	parseMarkdownIndentedCodeBlocks { :self |
		let answer = [];
		let previous = '';
		let inBlock = false;
		let block = [];
		self.lines.do { :current |
			current.notEmpty.and {
				current.first.isTab.and {
					previous.isEmpty.and {
						inBlock.not
					}
				}
			}.ifTrue {
				inBlock := true
			};
			current.isEmpty.and {
				previous.notEmpty.and {
					previous.first.isTab.and {
						inBlock
					}
				}
			}.ifTrue {
				answer.add(block.copy);
				block.removeAll;
				inBlock := false
			};
			inBlock.ifTrue {
				block.add(current)
			};
			previous := current
		};
		answer
	}

}
