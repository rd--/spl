# terseReferenceSummary

- _terseReferenceSummary(d, o)_

Read all files at the directory _d_,
extract all `Documentation Tests`,
evaluate each and summarise the results using the options _o_.

Run reference file documentation tests:

~~~spl console
'Help/Reference'
.splFilePath
.terseReferenceSummary(
	(
		verbose: false,
		pattern: '.*'
	)
)
~~~

Run guide file documentation tests:

~~~spl console
'Help/Guide'
.splFilePath
.terseReferenceSummary(
	(
		verbose: false,
		pattern: '.*'
	)
)
~~~

* * *

See also: HelpFile, terseGuideSummary, terseReferenceEntry

Guides: Documentation Tests

Categories: Help
