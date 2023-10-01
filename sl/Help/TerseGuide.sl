(* Requires: Url *)

+String {

	terseGuideSummary { :self |
		self.terseGuideSummary (verbose: false)
	}

	terseGuideSummary { :self :options |
		| totalTestCount = 0, totalPassCount = 0, areas = self.paragraphs; |
		('Terse Guide Summary: Areas = ' ++ areas.size).postLine;
		areas.do { :area |
			|(
				entries = area.lines.reject { :line |
					line.isEmpty | {
						line = '```'
					}
				},
				testCount = entries.size - 1,
				failCount = 0,
				passCount = 0
			)|
			entries[1].postLine;
			2.to(testCount + 1).collect { :index |
				| test = entries[index]; |
				options.atIfAbsent('verbose', false).ifTrue {
					test.postLine
				};
				(system.evaluate(test) = true).if {
					passCount +:= 1
				} {
					failCount +:= 1;
					('	Error: ' ++ test).postLine
				}
			};
			totalTestCount +:= testCount;
			totalPassCount +:= passCount;
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
