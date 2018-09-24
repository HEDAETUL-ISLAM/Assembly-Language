.model small
.stack 100h
.data
.code
var1 db 4
var2 db ?

main proc
    
    mov ax, @data
    mov ds,ax
    
    mov ah,1
    int 21h
    mov var2
    add var1,var2
    mov dl,vr1
    
    
main endp
end main