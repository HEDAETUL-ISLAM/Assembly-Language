.model small
.stack 100h
.data
    msg1 db 0dh,0ah,'Do U want to convert or Exit?Press Y to convert or N: $'
    msg2 db 0dh,0ah,'How many digits your number has? $'
    msg3 db 0dh,0ah,'Enter the Decimal Number: $'
    msg4 db 0dh,0ah,'Enter the 1st digit: $ '
    msg5 db 0dh,0ah,'Enter the 2nd digit: $ '
    msg6 db 0dh,0ah,'Result in Octal Number: $'
    msg7 db 0dh,0ah,'Invalid $'
    msgn db 0dh,0ah,'Bye$'
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    option:
        mov ah,9
        lea dx,msg1
        int 21h
        
        mov ah,1         ;for yes or no
        int 21h
        
        cmp al,'Y'
        je input
        cmp al,'y'
        je input
        cmp al,'N'
        je nothing
        cmp al,'n'
        je nothing
        jmp invalid
        
        input:
             mov ah,9
             lea dx,msg2
             int 21h
             
             mov ah,1       ;for take how many
             int 21h
             
             cmp al,'1'
             je single_input
             cmp al,'2'
             je double_input
             jmp invalid
             
             
             single_input:
                 mov ah,9
                 lea dx,msg3
                 int 21h
                 
                 mov ah,1    ;for enter single number
                 int 21h  
                 
                 mov bh,al
                 cmp bh,'0'
                 jge from_one
                 jmp from_eight
                 
                 from_one:
                    cmp bh,'7'
                    jle to_seven
                    jmp from_eight
                    
                    to_seven:
                        mov ah,9
                        lea dx,msg6
                        int 21h 
                                      ;for 0-7
                        mov ah,2
                        mov dl,bh
                        int 21h
                        jmp option
                 
                    from_eight: 
                        cmp bh,'8'
                        je for_eifht_and_nine
                        cmp bh,'9'
                        je for_eifht_and_nine
                        jmp invalid
                    
                        for_eifht_and_nine:
                            mov ah,9
                            lea dx,msg6
                            int 21h
                            
                            mov dl,'1'
                            mov ah,2            ;for 8-9
                            int 21h
                            
                            sub bh,8h
                            mov dl,bh
                            int 21h
                            jmp option
             double_input:
                     mov ah,9
                     lea dx,msg4
                     int 21h
                     
                     mov ah,1
                     int 21h           ;take 1st number
                     mov bh,al
                     
                     mov ah,9
                     lea dx,msg5
                     int 21h 
                     
                     mov ah,1          ;take 2nd number
                     int 21h
                     mov ch,al
                     
                     cmp bh,'1'
                     je double_input_for_one
                     cmp bh,'2'
                     je double_input_for_two
                     jmp invalid
                     
                     double_input_for_one:
                         cmp ch,'0'
                         jge from_zero:
                         jmp from_six
                       
                          from_zero:
                              cmp ch,'5'
                              jle to_five
                              jmp from_six
                              
                          
                               to_five:
                                    mov ah,9
                                    lea dx,msg6
                                    int 21h
                                    
                                    mov ah,2
                                    mov dl,'1'
                                    int 21h
                                    
                                    add ch,2h
                                    mov dl,ch
                                    int 21h
                                    
                                    jmp option
                       
                           from_six:
                                cmp ch,'6'
                                jge from_16to19
                                jmp invalid
                            
                           from_16to19:
                                cmp ch,'9'
                                jle to_16to19
                                jmp invalid  
                                
                                to_16to19:
                                    mov ah,9
                                    lea dx,msg6
                                    int 21h
                                    
                                    mov ah,2
                                    mov dl,'2'
                                    int 21h
                                    
                                    sub ch,6h
                                    mov dl,ch
                                    int 21h
                                    
                                    jmp option
                     
                     double_input_for_two:    
                           cmp ch,'0'
                           jge for2_from_zero
                           jmp invalid
                           
                           for2_from_zero:
                               cmp ch,'3'
                               jle for2_to_three
                               jmp invalid
                           
                               for2_to_three:
                               
                                   mov ah,9
                                   lea dx,msg6
                                   int 21h
                                   mov ah,2
                                   
                                   mov dl,'2'
                                   int 21h
                                   add ch,4h
                                   mov dl,ch
                                   int 21h
                                   jmp option
            
        invalid:
                   mov ah,9
                   lea dx,msg7
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
                                                