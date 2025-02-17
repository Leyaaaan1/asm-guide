.386
.model flat, stdcall
option casemap :none   

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data
    message db "Number is positive", 13, 10, 0
    message2 db "Number is negative", 13, 10, 0
    number db 10 dup(?)
    msg db "Enter a number: ", 0
    num db 2 dup(?)
    newLine db 13, 10, 0

.code
start:

        invoke ClearScreen
        invoke StdOut, addr msg
        invoke StdIn, addr number, 10
        invoke StdOut, addr number

    main_loop:
        invoke StdOut, addr newLine
        invoke StdOut, addr message

    second_loop:
        invoke StdOut, addr newLine
        invoke StdOut, addr message2
    
        mov al, number
        cmp al, '1'
        je main_loop
        cmp al, '2'
        je second_loop

        invoke ExitProcess, 0
        


end start