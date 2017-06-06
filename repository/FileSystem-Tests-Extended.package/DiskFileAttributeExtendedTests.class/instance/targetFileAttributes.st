helper methods
targetFileAttributes

	| file |
	
	file := self tempFileResource targetFile resolve.
	^DiskFileAttributes store: file fileSystem store path: file path.