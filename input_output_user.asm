.model small
.stack 100h
.data
.code
main proc
    mov ah,1
    int 21h        ;input
    mov bl,al
    
    mov ah,2
    mov dl,bl
    int 21h        ;output
    
main endp
end main