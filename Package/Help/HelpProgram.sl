HelpProgram : [Object] { | topic language commentary annotations programText |

	annotation { :self :key |
		self.annotations.at(key)
	}

	condensedProgramText { :self |
		self.programText.splCondenseProgramText
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
		self.hasAnnotation('oeis') & {
			self.hasAnnotation('variant').not
		}
	}

	markdownImageReference { :self :options |
		let imageTitleText = options['imageProgramText'].if {
			' "%"'.format([self.condensedProgramText])
		} {
			''
		};
		'![](Help/Image/%%)'.format(
			[
				self.imageFileName,
				imageTitleText
			]
		)
	}

	markdownImageReference { :self |
		self.markdownImageReference (
			imageProgramText: false
		)
	}

	markdownText { :self :options |
		[
			self.commentary,
			options['programText'].if {
				[
					'',
					self.fencedCodeBlock
				].unlines
			} {
				nil
			},
			self.isImageProgram.if {
				[
					'',
					self.markdownImageReference(options)
				].unlines
			} {
				nil
			}
		].deleteMissing.unlines
	}

	markdownText { :self |
		self.markdownText (
			programText: true,
			imageProgramText: false
		)
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
