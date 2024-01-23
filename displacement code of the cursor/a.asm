dseg segment
    x db 39
    y db 12
dseg ends
cseg segment
assume cs:cseg, ds:dseg

     Start: mov ax, dseg
            mov ds, ax
            mov cx, 25
            mov dl, 10
            mov ah, 2
     Shoov: int 21h
            loop Shoov
          
      Move: mov dl, x
            mov dh, y
            mov  ah, 2     
            mov  bh, 0            
            int  10h 
            mov ah, 7
            int 21h
            cmp al, 'd'
            jz MoveRight
            cmp al, 's'
            jz MoveDown
            cmp al, 'a'
            jz MoveLeft
            cmp al, 'w'
            jz MoveUp
            jmp sof
MoveRight:  inc x
            jmp Move
 MoveDown:  inc y
            jmp Move
 MoveLeft:  dec x
            jmp Move
  MoveUp:   dec y
            jmp Move
            
            
       Sof: int 3h

cseg ends
end Start

