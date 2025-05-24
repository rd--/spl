+String {

	inferSchemaType { :self |
		[
			{ self.isBooleanString } -> { 'Boolean' },
			{ self.isDecimalIntegerString } -> { 'Integer' },
			{ self.isFractionString } -> { 'Fraction' },
			{ self.isComplexString } -> { 'Complex' },
			{ self.isFloatString } -> { 'Real' },
			{ self.isDateString } -> { 'Date' },
			{ self.isDateAndTimeString } -> { 'DateAndTime' },
			{ self.isIso8601DurationString } -> { 'Duration' },
			{ self.isTimeString } -> { 'Time' },
			true -> 'String'
		].which
	}

	schemaTypeParser { :self |
		self.caseOf(
			[
				'Boolean' -> { parseBoolean:/2 },
				'Integer' -> { parseDecimalInteger:/2 },
				'Fraction' -> { parseFraction:/2 },
				'Complex' -> { parseComplex:/2 },
				'Real' -> { parseNumber:/2 },
				'Date' -> { parseDate:/2 },
				'DateAndTime' -> { parseDateAndTime:/2 },
				'Duration' -> { parseDuration:/2 },
				'Time' -> { parseTime:/2 },
				'String' -> { { :s :f:/0 | s } }
			]
		) {
			self.error('schemaTypeParser: unknown type')
		}
	}

	schemaTypePredicate { :self |
		self.caseOf(
			[
				'Boolean' -> { isBoolean:/1 },
				'Integer' -> { isInteger:/1 },
				'Fraction' -> { isFraction:/1 },
				'Complex' -> { isComplex:/1 },
				'Real' -> { isSmallFloat:/1 },
				'Date' -> { isDate:/1 },
				'DateAndTime' -> { isDateAndTime:/1 },
				'Duration' -> { isDuration:/1 },
				'Time' -> { isTime:/1 },
				'String' -> { isString:/1 }
			]
		) {
			self.error('schemaTypePredicate: unknown type')
		}
	}

}

+@Object {

	isSchemaType { :self :schemaType |
		schemaType.schemaTypePredicate.value(self)
	}

}

+List {

	parseSchemaType { :self :schemaType :elseClause:/0 |
		let parser:/2 = schemaType.schemaTypeParser;
		self.collect { :each |
			parser(each, elseClause:/0)
		}
	}

	parseSchemaType { :self :schemaType |
		self.parseSchemaType(schemaType) {
			self.error('parseSchemeType: unknown type or invalid input')
		}
	}

}
