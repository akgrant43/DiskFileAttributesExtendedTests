tests - broken link
testDiskFileAttributesBrokenLink
	"Check the symlink attributes of a broken symlink"

	| fileReference attributes trueAttributes falseAttributes |
	
	fileReference := self tempFileResource brokenSymlink.
	attributes := fileReference symlinkEntry.

	trueAttributes := #(#isSymlink #isFile).
	falseAttributes := #(#isDirectory #isExecutable #isReadable #isWritable).
	self assert: attributes size equals: fileReference fullName size.
	trueAttributes do:
		[ :each | self assert: (each value: attributes) equals: true ].
	falseAttributes do:
		[ :each | self assert: (each value: attributes) equals: false ].
