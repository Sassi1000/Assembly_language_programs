dseg segment

d db 54h, 0b7h, 9fh, 46h, 0deh

dseg ends

cseg segment
assume cs:cseg, ds:dseg

     Start: mov ax, dseg
            mov ds, ax
            mov ah, 2
            mov si, 0
     Again: mov dh, d[si]
            mov ch, 8
    Again2: rcr dh, 1
            rcl dl, 1
            dec ch
            jnz Again2
            inc si
            cmp si, 5
            jc Again

      End: int 3h

cseg ends
end Start

