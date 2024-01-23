
cseg segment
assume cs:cseg

     start: mov cx, 2c5fh
            mov dl, ch
            shr dl, 4
            cmp dl, 10
            jnc Text
            add dl, 30h
            jmp Show
     Text:  add dl, 87
     Show:  mov ah, 2
            int 21h
            and ch, 0fh
            mov dl, ch
            cmp dl, 10
            jnc Text2
            add dl, 30h
            jmp Show2
     text2: add dl, 87
     Show2: int 21h

            mov dl, cl   
            shr dl, 4   
            cmp dl, 10
            jnc text3
            add dl, 30h
            jmp show3
     text3: add dl, 87
     show3: int 21h
            and cl, 0fh
            mov dl, cl  
            cmp dl, 10
            jnc text4
            add dl, 30h
            jmp show4
     text4: add dl, 87
     show4: int 21h

            int 3h


cseg ends
end Start
