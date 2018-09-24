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
    mov var2  ,al
    
    mov ah,2
    add var1,48
    mov dl,var1
    int 21h
    mov dl,var2
    int 21h
    
    
main endp
end main
