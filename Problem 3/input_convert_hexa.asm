.model small
.stack 100h
.data
.code

msg1 db 'Enter a alphabet: $'
msg2 db 'Your result: $'

main proc
    mov ax,@data
    mov ds,ax
               
    mov ah,9           
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    sub bl,11h
    
    mov ah,2
    mov dl,0Dh
    int 21h
    mov dl,0Ah
    int 21h
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    mov ah,2 
    mov dl,'1'
    int 21h 
    
    mov dl,bl
    int 21h 
    
main endp
end main
     