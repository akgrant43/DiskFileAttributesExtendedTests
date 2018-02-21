tests - broken link
testFileReferenceBrokenLink
	"File attributes requested directly from a file reference to a broken symbolic link answer the links attribute value"

	| fileReference linkAttributes attributeNames |
	
	fileReference := self tempFileResource file resolve.
	linkAttributes := DiskSymlinkDirectoryEntry reference: fileReference.

	attributeNames := self commonAttributeNames asSet.
	attributeNames remove: #permissions.
	attributeNames do: 
		[ :each | self assert: (each value: fileReference) equals: (each value: linkAttributes) ].
	self assert: fileReference size equals: linkAttributes size.
	self assert: fileReference permissions posixPermission
			equals: linkAttributes permissions posixPermission