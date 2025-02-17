.386
.model flat, stdcall
option casemap :none   

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data
    firstSt db "   Dental Patient Information Form   ", 13, 10, 0
    secondSt db "Personal Information", 13, 10, 0

    namePrompt db "First Name: ", 0
    buffer db 256 dup(?)  

    initialPrompt db "Initial: ", 0  
    buffer2 db 10 dup(?)

    lastNamePrompt db "Last Name: ", 0
    buffer3 db 256 dup(?)

    homeAddressPrompt db "Home Address: ", 0
    buffer4 db 256 dup(?)

    phonePrompt db "Cell Number: ", 0
    buffer5 db 256 dup(?)

    addressPrompt db "Address: ", 0
    buffer6 db 256 dup(?)

    cityPrompt db "City: ", 0
    buffer7 db 256 dup(?)

    zipPrompt db "Zip Code: ", 0
    buffer8 db 256 dup(?)

    birthPrompt db "Birthdate: ", 0
    buffer9 db 256 dup(?)

    newLine db 13, 10, 0  

    promptChoice db "Try another [Y/N]: ", 0
    choice db 2 dup(?)

.code
start:
    main_loop:

        invoke ClearScreen
        invoke StdOut, addr firstSt
        invoke StdOut, addr secondSt
        
        invoke StdOut, addr namePrompt  
        invoke StdIn, addr buffer, 256  
     

        invoke StdOut, addr initialPrompt
        invoke StdIn, addr buffer2, 10

        invoke StdOut, addr lastNamePrompt  
        invoke StdIn, addr buffer3, 256

        invoke StdOut, addr homeAddressPrompt  
        invoke StdIn, addr buffer4, 256

        invoke StdOut, addr phonePrompt  
        invoke StdIn, addr buffer5, 256

        invoke StdOut, addr addressPrompt  
        invoke StdIn, addr buffer6, 256

        invoke StdOut, addr cityPrompt  
        invoke StdIn, addr buffer7, 256

        invoke StdOut, addr zipPrompt  
        invoke StdIn, addr buffer8, 256

        invoke StdOut, addr birthPrompt  
        invoke StdIn, addr buffer9, 256


        invoke StdOut, addr buffer 
        invoke StdOut, addr newLine


        invoke ClearScreen
        invoke StdOut, addr firstSt
        invoke StdOut, addr secondSt
        invoke StdOut, addr buffer2
        invoke StdOut, addr newLine
        invoke StdOut, addr buffer3
        invoke StdOut, addr newLine
        invoke StdOut, addr buffer4
        invoke StdOut, addr newLine
        invoke StdOut, addr buffer5
        invoke StdOut, addr newLine
        invoke StdOut, addr buffer6
        invoke StdOut, addr newLine
        invoke StdOut, addr buffer7
        invoke StdOut, addr newLine
        invoke StdOut, addr buffer8
        invoke StdOut, addr newLine
        invoke StdOut, addr buffer9


        invoke StdOut, addr promptChoice
        invoke StdIn, addr choice, 2
        invoke StdIn, addr buffer, 256  

        mov al, choice
        cmp al, 'Y'
        je main_loop
        cmp al, 'y'
        je main_loop

        invoke ClearScreen
        invoke ExitProcess, 0
       

END start
