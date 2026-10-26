# Help/Reference

Run documentation tests:

~~~spl
{ 'Help/Reference'.splFilePath.terseReferenceSummary((verboseLevel: 0, pattern: '.*')) }.timing
~~~

Total => 19,567 (200 seconds)

Note: Requires LibraryItems be at the interpreter cache, i.e.

~~~spl
system.library.collect(request/1)
~~~

Write image files:

~~~spl
{ system.helpFilesDo('Reference', '.*', 1, writeImageFiles/1) }.timing
~~~

Update indices:

- helpImageIndex
- oeisImageIndex
- HelpIndex

Count image files:

~~~sh
ls ~/sw/spl/Help/Image/* | wc -l
~~~

=> 5,089

Count reference files:

~~~sh
$ (grep '!\[\](' ~/sw/spl/Help/Reference/* | wc -l)
~~~

=> 5,079

Run SuperCollider programs:

~~~spl
'Help/Reference'.splFilePath.terseSuperColliderGraphSummary((verboseLevel: 2, pattern: '.*'))
~~~

Total => 572

Lint reference files:

~~~sh
$ (cd ~/sw/spl/Help/Reference; make lint)
~~~

Linting: 4,213 file(s)
