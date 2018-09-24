.model small
.stack 100h
.data
.code

msg1 db 'enter number: $'
msg2 db ' greater$ '
msg3 db ' smaller$ '
msg4 db ' equal$ '
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx, msg1
    mov ah,9     ;Load the address of a '$'-terminated( print string) 
    int 21h      ;string into DX, then call the interrupt with function code 9 in AH. 
    
    mov ah,1
    int 21h
    mov bl,al
    sub bl,48
    
    mov ah,2
    
    cmp bl,5     ;here 5 is our initial number
    JG L1        ;greater
    JL L2        ;less
    JE L3        ;equal
    
    L1:
    lea dx,msg2
    mov ah,9
    int 21h
    JMP exit 
    
    L2:
    lea dx,msg3
    mov ah,9
    int 21h
    JMP exit
    
    L3:
    lea dx,msg4
    mov ah,9
    int 21h
    JMP exit 
    
    exit:
    
main endp
end main