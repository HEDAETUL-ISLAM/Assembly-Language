.model small
.stack 100h
.data
.code
main proc
    
    mov cx,5
    l1:
        mov bx,cx
        
    l2:
        mov dl,'*'
        mov ah,02
        int 21h
    loop l2
        mov dl,0Ah
        mov ah,02
        int 21h
        mov dl,0Dh
        mov ah,02
        int 21h
        mov cx,bx
            
    loop l1
    
main endp
end main