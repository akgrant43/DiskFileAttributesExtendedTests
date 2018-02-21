helper methods
symlinkLinkAttributes
	| file |
	file := self tempFileResource symboliclink resolve.
	^ DiskSymlinkDirectoryEntry reference: file