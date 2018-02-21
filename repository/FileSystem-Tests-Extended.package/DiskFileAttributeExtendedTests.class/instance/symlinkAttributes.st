helper methods
symlinkAttributes
	| file |
	file := self tempFileResource symboliclink resolve.
	^ DiskDirectoryEntry reference: file