.model small
.stack 100h
.data
.code

var1 db 7
var2 db ?
var3 db ?

main proc
    
    mov ax, @data
    mov ds,ax
    
    mov ah,1
    int 21h
    mov bl,al
    int 21h
    mov cl,al
    
    
    mov ah,2
    
    mov dl,0Dh
    int 21h         ;newline
    mov dl,0Ah
    int 21h 
    
    add var1,48
    mov dl,var1
    int 21h
    mov dl,'*'
    int 21h
    int 21h
    int 21h
    int 21h
    
    mov dl,0Dh
    int 21h         ;newline
    mov dl,0Ah
    int 21h
           
    mov dl,'*'
    int 21h
    int 21h
    mov var2,bl
    mov dl,var2
    int 21h
    mov dl,'*'
    int 21h
    int 21h
    
           
    mov dl,0Dh
    int 21h         ;newline
    mov dl,0Ah
    int 21h
           
    mov dl,'*'
    int 21h
    int 21h
    mov var3,cl
    mov dl,var3
    int 21h
    mov dl,'*'
    int 21h
    int 21h
    
    mov dl,0Dh
    int 21h         ;newline
    mov dl,0Ah
    int 21h
    
    mov dl,'*'
    int 21h
    int 21h
    int 21h
    int 21h
    mov dl,var1
    int 21h           
    
main endp
end main
    