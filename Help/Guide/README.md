# Help/Guide

Run documentation tests:

~~~spl
'Help/Guide'.splFilePath.terseReferenceSummary((verboseLevel: 0, pattern: '.*'))
~~~

Total => 1,006

Write image files:

~~~spl
system.helpFilesDo('Guide', '.*', 1, writeImageFiles/1)
~~~

Update indices:

- Integer Sequence Index
- Integer Sequence Method List

Lint files:

~~~sh
$ (cd ~/sw/spl/Help/Guide; make lint)
~~~

Linting: 295 file(s)
