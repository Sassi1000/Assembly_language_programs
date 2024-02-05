
dseg	segment
	a		db	05h, 17h, 26h, 32h, 34h, 46h, 48h, 60h
	b		db	06h, 07h, 25h, 42h, 54h, 56h, 73h, 80h
	c		db	16 dup (?)
dseg	ends
cseg	segment
assume	cs:cseg, ds:dseg
ClearScreen	proc
									
				mov cl, 30
				mov dl, 10
				mov ah, 2
	Clear:		int 21h
				dec cl
				jnz Clear
				ret
ClearScreen	endp
ShowArrayC	proc
				mov si, 0
	ShowNextNum:mov bl, c[si]
				mov dl, bl
				shr dl, 4
				add dl, '0'
				mov ah, 2
				int 21h
				mov dl, bl
				and dl, 0fh
				add dl, 30h
				mov ah, 2
				int 21h
				mov dl, 'h'
				mov ah, 2
				int 21h
				mov dl, ','
				mov ah, 2
				int 21h
				inc si
				cmp si, 16
				jc ShowNextNum
				ret
ShowArrayC	endp
MergeArrays	proc
				mov di, 0
				mov bx, 0
				mov si, 0
	CheckNext:	mov al, a[di]
				cmp al, b[bx]
				jc CopyA
				mov al, b[bx]
				mov c[si], al
				inc si
				inc bx
				cmp bx, 8
				jc CheckNext
				jmp CopyJustA

	CopyA:		mov c[si], al
				inc si
				inc di
				cmp di, 8
				jc CheckNext
				
	CopyJustB:	mov al, b[bx]
				mov c[si], al
				inc si
				inc bx
				cmp bx, 8
				jc CopyJustB
				jmp SofProc

	CopyJustA:	mov al, b[di]
				mov c[si], al
				inc si
				inc di
				cmp di, 8
				jc CopyJustA
	SofProc:	ret
MergeArrays	endp
	Start:		mov ax, dseg
				mov ds, ax
				call ClearScreen
				call MergeArrays
				call ShowArrayC
				int 3h
cseg	ends
end		Start


