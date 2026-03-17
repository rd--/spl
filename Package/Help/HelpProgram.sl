HelpProgram : [Object] { | topic language commentary annotations programText |

	annotation { :self :key |
		self.annotations.at(key)
	}

	fencedCodeBlock { :self |
		[
			'~~~spl',
			self.programText,
			'~~~'
		].unlines
	}

	hasAnnotation { :self :key |
		self.annotations.includesKey(key)
	}

	hasAnnotation { :self :key :value |
		let a = self.annotations;
		a.includesKey(key) & {
			a.at(key) = value
		}
	}

	imageFileName { :self |
		'%-%.%'.format(
			[
				self.topic,
				self.imageIdentifier,
				self.imageType
			]
		)
	}

	imageIdentifier { :self |
		self.annotation(self.imageType)
	}

	imageType { :self |
		['png' 'svg'].detect { :each |
			self.hasAnnotation(each)
		}
	}

	isDefinitionProgram { :self |
		self.hasAnnotation('define')
	}

	isImageProgram { :self |
		['png' 'svg'].anySatisfy { :each |
			self.hasAnnotation(each)
		}
	}

	isOeisProgram { :self |
		self.hasAnnotation('oeis')
	}

	markdownText { :self |
		[
			self.commentary,
			'',
			self.fencedCodeBlock,
			self.isImageProgram.if {
				[
					'',
					'![](sw/spl/Help/Image/%)'.format(
						[
							self.imageFileName
						]
					)
				].unlines
			} {
				nil
			}
		].deleteMissing.unlines
	}

	oeisIdentifier { :self |
		self.annotation('oeis')
	}

}

+String {

	HelpProgram { :topic :language :commentary :annotations :programText |
		newHelpProgram()
		.initializeSlots(topic, language, commentary, annotations, programText)
	}

}
