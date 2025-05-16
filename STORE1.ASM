.model small
.code
org 100h
start:jmp main

        a db       " ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป$"
        b db 10,13," บ                         Pasta House                       บ$"
        c db 10,13," บ        ษอออออป     ษอออออป     ษอออออป     ษอออออป        บ$"
        d db 10,13," บ        บ  9  บ     บ  9  บ     บ  9  บ     บ  9  บ        บ$"
        e db 10,13," บ        ศอออออผ     ศอออออผ     ศอออออผ     ศอออออผ        บ$"
        f db 10,13," บ    [c]carbonara   [f]farro  [t]fetuccini [l]lasagnia      บ$"
        g db 10,13," ฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน$"
        h db 10,13," บ                                                           บ$"
        i db 10,13," บ       what? [_]       qty? [_]      Buy again:y/n[_]      บ$"
        j db 10,13," ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ$"
k db" Invalid transaction...        $"
l db" zero! $"
m db" Invalid command (press 'q' to exit) $"
n db"Sorry! Product unavailable..           $"
o db"                                         $"
p db" Answer should be 'y','Y' or 'n','N'   $"
q db"Sorry! We're Closed.$"
underscore db "_$"


w db ?
x db ?
y db ?
z db ?

string proc near
        mov ah,9
        int 21h
        ret
        string endp


down proc near
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        ret
        down endp

position proc near
        mov ah,2
        mov bh,0
        int 10h
        ret
        position endp

input proc near
        mov ah,1
        int 21h
        ret
        input endp

output proc near
        mov ah,2
        int 21h
        ret
        output endp

main proc near
        mov w, 39h
        mov x, 39h
        mov y, 39h 
        mov z, 39h 

        mov ax,3
        int 10h

        lea dx,a
        call string
        ;call down

        lea dx,b
        call string
        ;call down

        lea dx,c
        call string
        ;call down

        lea dx,d
        call string
        ;call down

        lea dx,e
        call string
        ;call down

        lea dx,f
        call string
        ;call down

        lea dx,g
        call string
        ;call down

        lea dx,h
        call string
        ;call down

        lea dx,g
        call string
        ;call down

        lea dx,i
        call string
        ;call down

        lea dx,j
        call string

buyagain:
    mov dl,16
    mov dh,9
    call position
    call input

    cmp al,'c'
    je part1
    cmp al,'f'
    je part2
    cmp al,'t'
    je part3
    cmp al,'l'
    je part4

gomain:
    jmp main

part1:
    jmp p1
part2:
    jmp p2
part3:
    jmp p3
part4:
    jmp p4


p1:
    mov dl,31
    mov dh,9
    call position
    call input

    sub w, al
    add w, 30h        
   
    mov dl,13
    mov dh,3
    call position
    mov dl, w
    call output

    cmp w, 30h
    je empty

    call l1

p2:
    mov dl,31
    mov dh,9
    call position
    call input

    sub x, al
    add x, 30h

    mov dl,25
    mov dh,3
    call position
    mov dl, x
    call output

    cmp x, 30h
    je empty

    call l1

empty:
    jmp pasta_empty 

p3:
    mov dl,31
    mov dh,9
    call position
    call input

    sub y, al
    add y, 30h

    mov dl,37
    mov dh,3
    call position
    mov dl, y
    call output

    cmp y, 30h
    je empty

    call l1


p4:
    mov dl,31
    mov dh,9
    call position
    call input

    sub z, al
    add z, 30h

    mov dl,49
    mov dh,3
    call position
    mov dl, z
    call output

    cmp z, 30h
    je empty

    call l1

l1:
    mov dl,53
    mov dh,9
    call position
    call input

    cmp al, 'N'
    je exit
    cmp al, 'n'
    je exit

    cmp al, 'Y'
    je clear
    cmp al, 'y'
    je clear

    jmp inv_p

inv_p:
    mov dl,13
    mov dh,7
    call position
    lea dx, p
    call string
    jmp l1  ; Retry input instead of infinite loop

pasta_empty:
    mov dl,21
    mov dh,7
    call position
    lea dx, n
    call string
    
    jmp l1

clear:
    mov dl,16
    mov dh,9
    call position
    mov dl, '_'
    int 21h

    mov dl,31
    mov dh,9
    call position
    mov dl, '_'
    int 21h

    mov dl,53
    mov dh,9
    call position
    mov dl, '_'
    int 21h

    jmp buyagain


exit:
    mov ah, 4Ch
    int 21h

main endp
end start
