.model small
.stack 100h
.data
.code
 
msg1 db 'hello world $'
msg2 db 'welcome to assemble world $'
main proc
    
    mov ax,@data ;initial data statement
    mov ds,ax
    
    lea dx,msg1   ; load msg1 address
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    lea dx,msg2   ; load msg1 address
    mov ah,9      ; for string print used 9
    int 21h
    
main endp
end main
