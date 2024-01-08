org 100h

jmp start  

input_number_to_problem equ 25
max_input_number_to_problem equ 26

input_result_1 equ 65
input_result_2 equ 118
input_result_3 equ 224

pointer_1 dw 0
pointer_2 dw 0

welcome_message db 'Welcome to the mathematical safe!$'
game_over_lost db 'You lost! Try different input, maybe some math will help?$'
game_over_won db 'Well done! You cracked the safe and learnt about the 3x + 1 problem.$'

print_str:
    mov ah, 9
    int 21h
    
    mov ah, 2  
    mov dl, 0Dh 
    int 21h
    mov dl, 0Ah 
    int 21h
    ret

odd:
    mov bx, 3
    mul bx ; 3x
    inc ax ; + 1
    jmp continue_after_check

even:
    mov bx, 2
    mov dx, 0
    div bx ; / 2
    jmp continue_after_check

check_value:
    test ax, 1
    JNZ odd    ; jump if odd  = lowest bit set
    JZ  even    ; jump if even = lowest bit clear = zero
    continue_after_check:
        ret

run_game:
    ; Initalize pointer's values
    mov pointer_1, bx
    mov pointer_2, bx
    
    game_loop: 
        mov ax, [pointer_1]
        call check_value
        mov [pointer_1], ax
        
        mov cx, 2 ; Number of iterations of the loop
        pointer_2_loop: ; Second pointer goes forward by 2 steps 
            mov ax, [pointer_2]
            call check_value
            mov [pointer_2], ax
            loop pointer_2_loop
        
        mov bx, [pointer_1]
        mov dx, [pointer_2]
        cmp bx, dx
        jnz game_loop
    
    mov ax, bx
    mov dx, 53
    mul dx
    add ax, 12
    mov bx, ax
    
    mov dx,input_result_1    
    cmp dx, bx
    jz end
    
    mov dx,input_result_2    
    cmp dx, bx
    jz end
    
    mov dx,input_result_3    
    cmp dx, bx
    jz end
    
    
    mov dx, offset game_over_lost
    call print_str    
    ret


start:
    mov dx, offset welcome_message
    call print_str
                                                        
    ; Checking the input number limit
    mov bx, input_number_to_problem
    mov dx, max_input_number_to_problem  
    cmp bx, dx
    jg end
    
    jmp run_game

end:
    mov dx, offset game_over_won
    call print_str    
    ret
    
    mov ah, 0
    int 16h
    ret