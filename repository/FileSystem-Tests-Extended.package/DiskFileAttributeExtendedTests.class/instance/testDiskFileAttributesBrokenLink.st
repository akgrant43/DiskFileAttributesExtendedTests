tests - broken link
testDiskFileAttributesBrokenLink
	"File attributes requested directly from a file reference to a broken symbolic link answer the links attribute value"

	| fileReference attributes attributeNames trueAttributes falseAttributes |
	
	fileReference := self tempFileResource brokenSymlink.
	attributes := fileReference attributes.

	attributeNames := self commonAttributeNames asSet.
	trueAttributes := #(#isSymlink).
	falseAttributes := #(#isDirectory #isFile #isExecutable #isReadable #isWritable).
	attributeNames removeAll: trueAttributes.
	attributeNames removeAll: falseAttributes.
	attributeNames do: 
		[ :each | self should: [each value: attributes] raise: FileDoesNotExist ].
	self should: [attributes fileSize] raise: FileDoesNotExist.
	trueAttributes do:
		[ :each | self assert: (each value: attributes) equals: true ].
	falseAttributes do:
		[ :each | self assert: (each value: attributes) equals: false ].
