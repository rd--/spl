{- Requires: Url -}

+String {

	terseGuideSummary { :self |
		self.terseGuideSummary (verbose: false)
	}

	terseGuideSummary { :self :options |
		let totalTestCount = 0;
		let totalPassCount = 0;
		let areas = self.paragraphs;
		('Terse Guide Summary: Areas = ' ++ areas.size).postLine;
		areas.do { :area |
			let entries = area.lines.reject { :line |
				line.isEmpty | {
					line = '```'
				}
			};
			let testCount = entries.size - 1;
			let failCount = 0;
			let passCount = 0;
			entries[1].postLine;
			2.to(testCount + 1).collect { :index |
				let test = entries[index];
				options.atIfAbsent('verbose', false).ifTrue {
					test.postLine
				};
				(system.evaluate(test) = true).if {
					passCount := passCount + 1
				} {
					failCount := failCount + 1;
					('	Error: ' ++ test).postLine
				}
			};
			totalTestCount := totalTestCount + testCount;
			totalPassCount := totalPassCount + passCount;
			[
				'	=> ',
				passCount, ' / ', testCount,
				(failCount > 0).if {
					' (' ++ failCount ++ ' Failures)'
				} {
					''
				}
			].join.postLine
		};
		('Total => ' ++ totalPassCount ++ ' / ' ++ totalTestCount).postLine
	}

}

+@Url {

	terseGuideSummary { :self |
		self.asUrl.fetchText {
			self.error('terseGuideSummary: fetch failed')
		}.then { :text |
			text.terseGuideSummary
		}
	}

}
