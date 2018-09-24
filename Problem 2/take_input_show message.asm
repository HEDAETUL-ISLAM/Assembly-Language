.model small
.stack 100h
.data
.code

msg1 db 'Enter 1st input: $'
msg2 db 'Enter 2nd input: $'
msg3 db 'Output: $'

main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,9        ;print 1st mess
    int 21h
    
    mov ah,1        ;take input
    int 21h
    mov bl,al
    
    mov ah,2
    
    mov dl,0Dh
    int 21h         ;newline
    mov dl,0Ah
    int 21h
           

    lea dx,msg2     ;print 2nd mess
    mov ah,9
    int 21h
    
    mov ah,1        ;take input
    int 21h
    mov cl,al
    
    
    mov ah,2
    
    mov dl,0Dh
    int 21h         ;newline
    mov dl,0Ah
    int 21h
           
           
    lea dx,msg3     ;print 3rd mess
    mov ah,9
    int 21h 
    
    mov ah,2
    
    mov dl,0Dh
    int 21h         ;newline
    mov dl,0Ah
    int 21h
    
    mov dl,bl
    int 21h         ;print numbers
    mov dl,cl
    int 21h
    
    
main endp
end main
    
    
         
    
    
    