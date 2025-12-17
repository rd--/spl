# gitHubFileUrl

- _gitHubFileUrl(u, p, f)_

Answer a file `Url` for the file _f_ at the project _p_ of the user _u_.

```
>>> let u = 'rd--'.gitHubFileUrl(
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
	'raw.githubusercontent.com',
	'/rd--/spl/refs/heads/master',
	'README.md'
)
```

* * *

See also: gitLabFileUrl, Url

Guides: Network Functions
