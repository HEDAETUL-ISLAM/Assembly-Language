.model small
.stack 100h
.data
.code
var db ?
main proc
    mov ax, @data
    mov ds,ax
    
    mov ah,1
    int 21h
    mov var,al
    
    mov ah,2
    mov dl,'1'             ;for char to hexadecimal conversion
    int 21h
    
    mov ah,2
    sub var,17
    mov dl,var
    int 21h
    
main endp
end main    