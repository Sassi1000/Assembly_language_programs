cseg   segment
assume cs:cseg


start:  mov cx, 2c5fh
        mov dl, ch
        shr dl, 4
        cmp dl, 10
        jnc ItIsL
        add dl, 30h
        jmp Show
ItIsL:  add dl, 87
 Show:  mov ah, 2
        int 21h
        and ch, 0fh
        mov dl, ch
        cmp dl, 10
        jnc ItIsLt
        add dl, 30h
        jmp Show2
ItIsLt: add dl, 87
 Show2: int 21h

        mov dl, cl   ;5f
        shr dl, 4    ;5
        cmp dl, 10
        jnc text
        add dl, 30h
        jmp show3
  text: add dl, 87
 show3: int 21h
        and cl, 0fh
        mov dl, cl   ;f
        cmp dl, 10
        jnc text2
        add dl, 30h
        jmp show4
 text2: add dl, 87
 show4: int 21h

        int 3h

          
cseg ends 
end Start

