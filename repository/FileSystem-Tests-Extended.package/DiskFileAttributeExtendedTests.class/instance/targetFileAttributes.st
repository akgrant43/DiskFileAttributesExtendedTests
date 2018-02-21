helper methods
targetFileAttributes

	| file |
	
	file := self tempFileResource targetFile resolve.
	^DiskDirectoryEntry reference: file.