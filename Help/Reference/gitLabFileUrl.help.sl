# gitLabFileUrl

- _gitLabFileUrl(u, p, f)_

Answer a file `Url` for the file _f_ at the project _p_ of the user _u_.

```
>>> let u = 'rd--'.gitLabFileUrl(
>>> 	'spl',
>>> 	'README.md'
>>> );
>>> (
>>> 	u.protocol,
>>> 	u.host,
>>> 	u.directory,
>>> 	u.fileName
>>> )
(
	'https:',
	'gitlab.com',
	'/rd--/spl/-/raw/master',
	'README.md'
)
```

* * *

See also: gitHubFileUrl, Url

Guides: Network Functions
