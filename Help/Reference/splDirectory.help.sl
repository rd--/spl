# splDirectory

- _splDirectory(system)_

Answer the absolute file path of the Sᴘʟ directory.

```
>>> system.splDirectory
'/home/rohan/sw/spl'
```

This reads the 'SPL_DIR' environment variable:

```
>>> system.environmentVariable('SPL_DIR')
'/home/rohan/sw/spl'
```

`splFileName` locates files relative to this directory.

* * *

See also: environmentVariable, splFileName

Guides: Reflection Functions, System Functions
