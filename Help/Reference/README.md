# Help/Reference

Run documentation tests:

~~~spl
'Help/Reference'.splFilePath.terseReferenceSummary((verboseLevel: 0, pattern: '.*'))
~~~

Total => 19,562

Note: Requires LibraryItems be at the interpreter cache, i.e.

~~~spl
system.library.collect(request/1)
~~~

Write image files:

~~~spl
system.helpFilesDo('Reference', '.*', 1, writeImageFiles/1)
~~~

Update indices:

- helpImageIndex
- oeisImageIndex

Count image files:

~~~sh
ls ~/sw/spl/Help/Image/* | wc -l
~~~

=> 4,966

Count reference files:

~~~sh
$ (grep '!\[\](' ~/sw/spl/Help/Reference/* | wc -l)
~~~

=> 5,065

Run SuperCollider programs:

~~~spl
'Help/Reference'.splFilePath.terseSuperColliderGraphSummary((verbose: true, pattern: '.*'))
~~~

Total => 572

Lint reference files:

~~~sh
$ (cd ~/sw/spl/Help/Reference; make lint)
~~~

Linting: 4200 file(s)
