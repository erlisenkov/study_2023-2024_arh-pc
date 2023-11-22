%include 'in_out.asm'
section .data
msg db "Наименьшее число: ",0h
A dd '84'
B dd '77'
C dd '32'
section .bss
min resb 10
section .text
global _start
_start:
; ———- Записываем ‘A’ в переменную ‘min’
mov ecx,[A] ; ‘ecx = A’
mov [min],ecx ; ‘min = A’
; ———- Сравниваем ‘A’ и ‘С’ (как символы)
cmp ecx,[C] ; Сравниваем ‘A’ и ‘С’
jg check_B
mov ecx,[C] ; иначе ‘ecx = C’
mov [min],ecx ; ‘min = C’
; ———- Преобразование ‘min(A,C)’ из символа в число
check_B:
mov eax,min
call atoi ; Вызов подпрограммы перевода символа в число
mov [min],eax ; запись преобразованного числа в min
; ———- Сравниваем ‘min(A,C)’ и ‘B’ (как числа)
mov ecx,[min]
cmp ecx,[B] ; Сравниваем ‘min(A,C)’ и ‘B’
jl fin ; если ‘min(A,C)<B’, то переход на ‘fin’,
mov ecx,[B] ; иначе ‘ecx = B’
mov [min],ecx
; ———- Вывод результата
fin:
mov eax, msg
call sprint ; Вывод сообщения ‘Наименьшее число:’
mov eax,[min]
call iprintLF ; Вывод ‘min(A,B,C)’
call quit ; Выход