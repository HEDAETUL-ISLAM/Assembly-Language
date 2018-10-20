.model small
.stack 100h
.code
.data
    msg1 db 0dh,0ah,'converd decimal number ? Yes 'y' or No 'n'  $'
    msg2 db 0dh,0ah,'how many number u wanna enter ? $'
    msg3 db 0dh,0ah,'enter ur single input : $'
    msg4 db 0dh,0ah,'enter ur First number : $'  
    msg5 db 0dh,0ah,'enter ur Second number : $'
    msg6 db 0dh,0ah,'invalid$'
    msgR db 0dh,0ah,'ur entered hexa number is : $'
    msgn db 0dh,0ah,'Bye$'
    
main proc
    mov ax,@data
    mov ds,ax
    
    option:
        mov ah,9
        lea dx,msg1
        int 21h
        
        mov ah,1   ;for yes or no
        int 21h
        
        cmp al,'Y'
        je input
        cmp al,'y'
        je input
        jmp nothing
        
        input:
            mov ah,9
            lea dx,msg2
            int 21h
            
            mov ah,1 ; for take how many number
            int 21h
            
            cmp al,'1'
            je single_input
            cmp al,'2'
            je double_input
            jmp invalid_input
            
            single_input:
                mov ah,9
                lea dx,msg3
                int 21h
                
                mov ah,1 ; for enter single number
                int 21h
                
                mov bh,al
                mov ah,9
                lea dx,msgR
                int 21h
                
                mov ah,2
                mov dl,bh ; show single number
                int 21h
                jmp option 
                
            double_input:
                mov ah,9
                lea dx,msg4
                int 21h
                
                mov ah,1;
                int 21h
                mov bh,al ; fror take 1st number
                
                mov ah,9
                lea dx,msg5
                int 21h
                
                mov ah,1;
                int 21h
                mov ch,al
                
                cmp bh,'1'
                je for_one
                cmp bh,'2'
                je for_two
                jmp invalid_input
                
                for_one:
                    cmp ch,'0'
                    jge from_zero
                    jmp from_six
                    
                    from_zero:
                        cmp ch,'5'
                        jle to_five
                        jmp from_six
                        
                        to_five:
                            add ch,11h
                            mov ah,9
                            lea dx,msgR    ; for number between 10-15
                            int 21h
                            mov dl,ch
                            mov ah,2
                            int 21h
                            jmp option
                        
                    from_six:
                            cmp ch,'6'
                            jge to_nine
                            jmp invalid_input
                            
                        to_nine:
                            mov ah,9
                            lea dx,msgR
                            int 21h         ; for number between 16-19
                            mov ah,2
                            mov dl,'1'
                            int 21h
                            sub ch,6h
                            mov dl,ch
                            int 21h
                            jmp option
                            
                for_two:
                    cmp ch,'0'
                    jge for2_from_zero
                    jmp invalid_input
                    
                    for2_from_zero:
                        cmp ch,'5'
                        jle for2_to_five
                        jmp invalid_input
                        
                        for2_to_five:
                            mov ah,9
                            lea dx,msgR
                            int 21h          ; for number between 20-25
                            mov ah,2
                            mov dl,'1'
                            int 21h
                            add ch,4h
                            mov dl,ch
                            int 21h
                            jmp option  
                invalid_input:
                    mov ah,9
                    lea dx,msg6
                    int 21h
                    jmp option
        nothing:
            mov ah,9
            lea dx,msgn
            int 21h
            mov ah,4ch
            int 21h

main endp
end main                                                       
