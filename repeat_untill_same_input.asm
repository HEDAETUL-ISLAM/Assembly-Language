.model small
.stack 100h
.code
.data
msg1 db 'enter a number: $'
msg2 db 'not matched agein: $'

main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,9
    int 21h
     
    L:

    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,2
    mov dl,bl
    int 21h
    
    mov dl,0DH
    int 21h
    mov dl,0AH
    int 21h
    
    cmp bl,082
    lea dx,msg2
    mov ah,9
    int 21h
    JMP L
    JE exit
    
    exit:
    
main endp
end main