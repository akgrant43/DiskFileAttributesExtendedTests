helper methods
symlinkLinkAttributes
	| file |
	file := self tempFileResource symboliclink resolve.
	^ DiskSymlinkAttributes store: file fileSystem store path: file path