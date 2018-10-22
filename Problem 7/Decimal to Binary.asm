.model small
.stack 100h
.data
     msg   db  'Enter a decimal number:$'
     msg1  db   0dh,0ah,'Invalid entry $'
     msg2  db   0dh,0ah,'Its equiavlent binary is:$' 
.code
main proc
   mov   ax,@data
   mov   ds,ax

   lea   dx,msg
   mov   ah,9     ;print message
   int   21h

   mov   ah,1
   int   21h      ;read data from user

   cmp   al,30h   ;check whether user enter number or something else
   jnge  invalid  ;jump if any invalid entry
   
   cmp   al,39h
   jnle  invalid 

   lea   dx,msg2  ;print message
   mov   ah,9
   int   21h

   and   al,0fh   ;clear upper four bits of al register
   mov   cl,3     ;cl used as counter in shifting bits 

   mov   bl,al    ;save value in bl register
   mov   bh,bl    ;move contents of bl into bh

   shr   bh,cl    ;right shift bh register three times by using cl as a counter
   add   bh,30h   ;make binary value visible as 0 or 1

   mov   ah,2     ;print binary value
   mov   dl,bh
   int   21h

   xor   bh,bh    ;clear bh register
   mov   bh,bl    

   mov   cl,2     ;make cl counter value equals to two
   and   bh,04h   ;clear all bits except third last bit

   shr   bh,cl
   add   bh,30h

   mov   ah,2     ;print binary value of third last bit 
   mov   dl,bh
   int   21h

   xor   bh,bh
   mov   bh,bl

   and   bh,02h   ;clear all bits except second last bit
   shr   bh,1

   add   bh,30h

   mov   ah,2     ;print second last bit 
   mov   dl,bh
   int   21h

   xor   bh,bh
   mov   bh,bl     

   and   bh,01h   ;clear all bits except the last bit
   add   bh,30h

   mov   ah,2     ;print last bit in binary
   mov   dl,bh
   int   21h

   jmp   exit

invalid:

   lea   dx,msg1   ;used to print message of invalid entry
   mov   ah,9
   int   21h

exit:

   mov   ah,4ch
   int   21h

main endp
         end main


