helper methods
fileAttributes

	| file |
	
	file := self tempFileResource file resolve.
	^DiskFileAttributes store: file fileSystem store path: file path.