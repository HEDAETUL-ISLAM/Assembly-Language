.model small
.stack 100h
.code
.data
msg1 db 'enter two int number: $'
msg2 db 'sum of $'
msg3 db ' & $'
msg4 db ' is $'
main proc
    
    mov ax, @data
    mov ds,ax
    
    mov ah,9        ;print 1st mess
    lea dx,msg1
    int 21h
            
    mov ah,1
    int 21h
    mov bl,al
    mov ch,al
    int 21h
    mov cl,al
    sub bl,cl 
    
    mov ah,2
    mov dl,0Dh
    int 21h         ;newline
    mov dl,0Ah
    int 21h
    
    add bl,48
    
    mov ah,9        ;print 2nd mess
    lea dx,msg2
    int 21h 
    
    mov ah,2
    mov dl,ch
    int 21h
    
    mov ah,9        ;print 3rd mess
    lea dx,msg3
    int 21h
    
    mov ah,2
    mov dl,cl
    int 21h
    
    mov ah,9        ;print 4th mess
    lea dx,msg4
    int 21h
    
    mov ah,2
    mov dl,'1'
    int 21h
    mov dl,bl
    int 21h 
    
main endp
end main