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
    msg db "Positive or Negative: ", 0
    num db 2 dup(?)
    newLine db 13, 10, 0


.code
    start:
        main_loop:
        invoke ClearScreen
        invoke StdOut, addr message
        invoke StdOut, addr msg
        invoke StdIn, addr number, 10

        invoke ClearScreen
        invoke StdOut, addr number
        invoke StdOut, addr newLine

        second_loop:
        invoke ClearScreen
        invoke StdOut, addr message2
        invoke StdOut, addr msg
        invoke StdIn, addr number, 10

        invoke ClearScreen
        invoke StdOut, addr number
        invoke StdOut, addr newLine

        
        invoke ClearScreen
        invoke ExitProcess, 0

        mov al, num
        cmp al, '1'
        je main_loop
        cmp al, '2'
        je second_loop

        invoke ClearScreen
        invoke ExitProcess, 0
        
    end start
