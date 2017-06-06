helper methods
commonAttributeNames
	"Answer the attribute names supported by FileReference and FileAttributes"

	^#(#accessTime #changeTime #creationTime #deviceId #gid #inode #isBlock #isCharacter
	#isDirectory #isExecutable #isFIFO #isFile #isReadable #isRegular #isSocket #isSymlink
	#isWritable #modificationTime #numberOfHardLinks #permissions #uid)
