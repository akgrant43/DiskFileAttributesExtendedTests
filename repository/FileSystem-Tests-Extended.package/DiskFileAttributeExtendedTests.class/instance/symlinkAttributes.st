helper methods
symlinkAttributes
	| file |
	file := self tempFileResource symboliclink resolve.
	^ DiskFileAttributes store: file fileSystem store path: file path