tests
testTargetFile

	| resource |
	
	resource := self tempFileResource.
	self should: [ self fileAttributes targetFileReference ] raise: FileAttributeNotSupported.
	self should: [ self targetFileAttributes targetFileReference ] raise: FileAttributeNotSupported.
	self should: [ self symlinkAttributes targetFileReference ] raise: FileAttributeNotSupported.
	self assert: self symlinkLinkAttributes targetFileReference equals: resource targetFile resolve.
