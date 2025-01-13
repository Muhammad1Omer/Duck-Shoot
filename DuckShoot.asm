.MODEL SMALL
.STACK 100h
.DATA

msg1 DB " Welcome to the ULTIMATE DUCK SHOOTER ! $"
msg2 DB " This game will test your shooting skills.  $"
newline DB 13,10,'$'

msg3 DB	"Please enter your name and press Enter to Continue. $"
  
usernameBuffer DB 20  ; Maximum characters allowed for input
usernameLen DB ?      ; Actual number of characters input
username DB 20 DUP('$') ; Buffer for the username input
  
msgStart db " START GAME Mode 1 $"
msgMode2 db " START GAME Mode 2 $" 
msgExit db " EXIT $"
msgMode3 db " Check Score $"

Duck  DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,14,14,14,14,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,14,14,15,15,14,14,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,14,14,15,15,14,14,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,14,14,14,14,14,14,14,14,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,14,14,14,14,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,14,14,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh

DuckWidth  EQU 10
DuckHeight EQU 10

	Aim	DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh 	   ; -2
		DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh     ; -1 
		DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh 	   ;  0
		DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh     ;  1
		DB 0Bh,0Bh,0Bh,00h,00h,00h,00h,0Bh,00h,00h,00h,00h,0Bh,0Bh,0Bh     ;  2
		DB 0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh     ;  3
		DB 0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh     ;  4
		DB 0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh     ;  5
		DB 0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh     ;  6
		DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh     ;  7
		DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh     ;  8
		DB 0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh     ;  9
		DB 0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh     ;  10
		DB 0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh     ; 11
		DB 0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh     ; 12
		DB 0Bh,0Bh,0Bh,00h,00h,00h,00h,0Bh,00h,00h,00h,00h,0Bh,0Bh,0Bh     ; 13
		DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh     ; 14
		DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh     ; 15
		DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh     ; 16
		DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh     ; 17
		
	xi dw 0
	xf dw 0
	yi dw 0
	yf dw 0
	
	AimXi dw 0
	AimXf dw 0
	AimYi dw 0
	AimYf dw 0
	
	
	color db 0
	
	MenuSelect db 1
	
	TriangleColor db ?
	menu_x dw 70
	menu_y dw 59
	level dw 1
	
	lineLength dw 6
	
	msgscores db "Score ",'$'
	score dw 0
	temp_score dw 0
	len dw 0 
	
	xi2 dw 0
	xf2 dw 0
	yi2 dw 0
	yf2 dw 0
	
	lives db 0

	Filehandler dw ?
	TotalBytes dw 0
	filename db "BANKAISE.TXT",0
	buffer db 10000 dup ("$")
	
	;UserNameLEN dw 0
	scoreLEN dw 0
	
	digitCount db 0
	anotherCounter db 0
	temp1 dw 0
	counter db 0
	enteredNumber dw 0
	
	WeNeedSpace db '  $'
	
	msgPause db 'Continue $'
	
	
	Select db 1
.CODE
MOV AX, @DATA
MOV DS, AX

    CALL display_page1
	
ToTheMenu:
	call clear_screen
	
	MOV AX, 13h
	INT 10h
	
    CALL display_page2 
	
	

display_page1 PROC
    ; Set Video Mode for Scroll Up Window (25 x 80) To move up # of lines from Bottom
    MOV AH, 6   ; Scroll Up Window -> Function to change Background Color
    MOV AL, 0  ; Lines to Scroll -> AL = 0 or 25 will Scroll whole screen
    MOV BH, 0Eh ; Left Char for Background (4 ) & Right Char for Foreground (E)
    MOV CH, 0  ; CH Upper Row # minimum can be 0
    MOV CL, 0  ; CL Left column # minimum can be 0
    MOV DH, 24  ; Lower row # maximum can be 24
    MOV DL, 79  ; Right column # maximum can be 79
    INT 10h     ; Call interrupt 10h (BIOS video services)
    
    ; Set Cursor Position
    MOV AH, 02h ; function to set cursor position
    MOV BH, 0   ; Set 1st page number     
    MOV DL, 8  ; Set DL for cursor column position
    MOV DH, 3 ; Set DH for Cursor row position
    INT 10h     ; Call interrupt 10h (BIOS video services)
    
    ; Print String
    MOV DX, OFFSET msg1  ; Load the offset address of the string 'msg' into the DX register
    MOV AH, 09h         ; Set AH register to 09h (function to print a string)
    INT 21h             ; Call interrupt 21h (DOS services)
    
    ; Set Cursor Position for next message
    MOV AH, 02h ; function to set cursor position
    MOV BH, 0   ; Set 1st page number     
    MOV DL, 8  ; Set DL for cursor column position
    MOV DH, 9 ; Set DH for Cursor row position
    INT 10h     ; Call interrupt 10h (BIOS video services)
    
    ; Print String
    MOV DX, OFFSET msg2  ; Load the offset address of the string 'msg' into the DX register
    MOV AH, 09h         ; Set AH register to 09h (function to print a string)
	INT 21h ; Call interrupt 21h (DOS services)
	
		; Set Cursor Position for next message
    MOV AH, 02h ; function to set cursor position
    MOV BH, 0   ; Set 1st page number     
    MOV DL, 8  ; Set DL for cursor column position
    MOV DH, 12 ; Set DH for Cursor row position
    INT 10h     ; Call interrupt 10h (BIOS video services)

	
	;new line
	LEA DX,newline
    MOV AH,09h
    INT 21h
	
	;new line
	LEA DX,newline
    MOV AH,09h
    INT 21h
	
	; Set Cursor Position for next message
    MOV AH, 02h ; function to set cursor position
    MOV BH, 0   ; Set 1st page number     
    MOV DL, 8  ; Set DL for cursor column position
    MOV DH, 15  ; Set DH for Cursor row position
    INT 10h     ; Call interrupt 10h (BIOS video services)
	
	; Print String
    MOV DX, OFFSET msg3  ; Load the offset address of the string 'msg' into the DX register
    MOV AH, 09h         ; Set AH register to 09h (function to print a string)
	INT 21h ; Call interrupt 21h (DOS services)
	
	
	; Set Cursor Position for next message
    MOV AH, 02h ; function to set cursor position
    MOV BH, 0   ; Set 1st page number     
    MOV DL, 18  ; Set DL for cursor column position
    MOV DH, 18  ; Set DH for Cursor row position
    INT 10h     ; Call interrupt 10h (BIOS video services)
	
	
	;new line
	LEA DX,newline
    MOV AH,09h
    INT 21h
	
    ; Take username input
    LEA DX, usernameBuffer
    MOV AH, 0Ah
    INT 21h

    ; Display the entered username (for verification)
    LEA DX, username+2  ; Skip the length bytes
    MOV AH, 09h
    INT 21h
	

    
    ; Set Cursor Position out of Window
    MOV AH, 02h ; function to set cursor position
    MOV BH, 0   ; Set 1st page number , Welcome Page of Game for example    
    MOV DL, 0  ; Set DL for cursor column position
    MOV DH, 24  ; Set DH for Cursor row position
    INT 10h     ; Call interrupt 10h (BIOS video services)
    
    ; Take Input For Enter
page2_input:
    MOV AH, 08h ; input a character from Keyboard without displaying on the screen
    INT 21h
    
    CMP AL, 13
    JNE page2_input
    
    RET
display_page1 ENDP

display_page2 PROC
	call clear_screen

    ; Set Video Mode for Scroll Up Window II To move up # of lines from Bottom
    MOV AH, 6   ; Scroll Up Window -> Function to change Background Color
    MOV AL, 0  ; Lines to Scroll
    MOV BH, 01h ; Left Char for Background (4 ) & Right Char for Foreground (E) 
    
	MOV CH, 0  ; CH Upper Row # minimum can be 0
	MOV DH, 24  ; Lower row # maximum can be 24
    
	MOV CL, 0  ; CL Left column # minimum can be 0
    MOV DL, 79  ; Right column # maximum can be 79
    INT 10h     ; Call interrupt 10h (BIOS video services)
    
    ; Set Cursor Position
    MOV AH, 02h ; function to set cursor position
    MOV BH, 0   ; Set 1st page number 
    MOV DL, 8  ; Set DL for cursor column position
    MOV DH, 6  ; Set DH for Cursor row position
    INT 10h     ; Call interrupt 10h (BIOS video services)
	
	mov score, 0
	mov	menu_x, 70
	mov	menu_y, 59
	mov	lineLength, 6
	mov menuSelect, 1
loop_menu:
	call menu
	
	;call clear_screen
	cmp menuSelect, 1 
	jne bro2

	CALL start_game
bro2:
	cmp menuSelect, 2 
	jne bro3
	;ClearScreen
	CALL start_game2
	
bro3:
	cmp menuSelect, 3
	jne bro

	call clear_screen
	call ScoreReading
bro:
	cmp menuSelect, 4
	jne loop_menu

	je exit

exit::
MOV AH, 4Ch
INT 21h

    RET
display_page2 ENDP

Menu proc   
    mov al,0
    mov ah,02h
    mov dl,12
    mov dh,7
    int 10h

    mov dx,offset msgStart
	mov ah,09h
	int 21h
	
    mov ah,02h
    mov dl,12
    add dh,10
    int 10h
	
    mov dx,offset msgMode2
	mov ah,09h
	int 21h
	
	mov ah,02h
    mov dl,12
    add dh,13
    int 10h
	
    mov dx,offset msgMode3
	mov ah,09h
	int 21h
	
    mov ah,02h
	mov dl,12
    add dh,16
    int 10h
    
	mov dx,offset msgExit
	mov ah,09h
	int 21h

    l1:
        mov TriangleColor,0Bh 
        call DrawTriangle
		
        mov bl,dh
		
        mov ah,1
        int 16h 
		jz l1 
		
    mov ah,0
    int 16h
    .if(ah==48h)
        .if(menu_y > 59)
            mov TriangleColor, 01h ;if we are moving from exit to upward then it will remove the triangle in exit and move upward and fill the above with triangle
            call DrawTriangle
            sub menu_y,24 
            sub menuSelect,1
        .endif
    .elseif(ah==50h) ;down direction
        .if(menu_y<120)
            mov TriangleColor, 01h
            call DrawTriangle
            add menu_y,24
            add menuSelect,1 
        .endif
    .endif
    .if(al!=13)
        jmp l1
    .endif

    ret
Menu endp

DrawTriangle proc
    mov cx,menu_x   
    mov dx,menu_y   
    mov bx,0
    push Linelength
    
    .while( bx !=  4)
        sub LineLength,1
        inc bx
        push bx
        mov bx,0
        mov dx,menu_y
        .while(bx < Linelength)
            inc bx
            mov ah,0ch
            mov al,trianglecolor
            int 10h
            inc dx
        .endw
        inc cx
        pop bx
    .endw
    pop Linelength

    push Linelength
    mov cx,menu_x
    mov dx,menu_y
    mov bx,0
    .while( bx !=  6)
        sub LineLength,1
        inc bx
        push bx
        mov bx,0
        mov dx,menu_y
        .while(bx < Linelength)
            inc bx
            mov ah,0ch
            mov al,trianglecolor
            int 10h
            dec dx
        .endw
        inc cx
        pop bx
    .endw

    pop linelength
    ret
DrawTriangle endp

start_game PROC
MOV AX, 13h
INT 10h

	mov yi, 10
	mov yf, 140
	mov xi, 0
	mov xf, 320 
	mov color,0Bh	
	call draw
	
	mov yi, 140
	mov yf, 180
	mov xi, 0
	mov xf, 320 
	mov color,0Ah	
	call draw
	
	mov yi, 180
	mov yf, 200
	mov xi, 0
	mov xf, 320 
	mov color,06h	
	call draw
	
	call scoreproc


	mov yi, 30  ; from up to down
	mov yf, 42 ;from up to down
	mov xi, 30	; from left to right
	mov xf, 49 ; from left to right
	
	mov AimYi, 50  
	mov AimYf, 70 
	mov AimXi, 150	
	mov AimXf, 165
	
	mov lives,3
	
MovDuck:
	inc xi
    inc xf

	push bx
		mov bl,0
		cmp bl,lives
		je GameEnd	
	
		mov bx,337
		cmp bx,xf
		JA NoRestPos
	pop bx
	
	mov xi,10
	mov xf,29
	inc yi
	inc yf
	
NoRestPos:
	mov si, offset Duck	
    call drawObj
	
	mov si, offset Aim
    call drawObjII
	
	push cx
	mov cx, 0
	.repeat
		inc cx
	.until(cx==10000)
	pop cx
	
	mov ah, 01h
    int 16h
    jz MovDuck

	mov ah, 00h
    int 16h
	
    cmp ah, 48h  
    je updir
	
    cmp ah, 50h  
    je downdir
	
    cmp ah, 4dh  
    je rightdir
	
    cmp ah, 4bh 
    je leftdir
	
	cmp al,13
	je Shoot
	
	cmp al,70h
	je PausedGame
	
	cmp al,1Bh
	je GameEnd
	

	
leftdir:
	push bx
	
	mov bx,3
    sub AimXi,bx 
    sub AimXf,bx
	
	pop bx
    jmp MovDuck

rightdir:
	push bx
	
	mov bx,3
    add AimXi,bx 
    add AimXf,bx
	
	pop bx
    jmp MovDuck

updir:
	push bx
	
	mov bx,3
    sub AimYi,bx 
    sub AimYf,bx

	pop bx
    jmp MovDuck

downdir:
	push bx
	
	mov bx,3
    add AimYi,bx 
    add AimYf,bx

	pop bx
    jmp MovDuck
	
Shoot:
	push ax
	
	dec lives
	
	mov ax,xi
	.IF ax < AimXf
		jmp CheckXF
	.else
		pop ax
		jmp MovDuck
	.ENDIF
	
CheckXF:
	mov ax,xf
	.IF ax > AimXi
		jmp CheckY
	.else
		pop ax
		jmp MovDuck
	.ENDIF
	
CheckY:
	mov ax,yi
	.IF ax < AimYf
		jmp CheckYF
	.ELSE
		pop ax
		jmp MovDuck
	.ENDIF

CheckYF:
	mov ax,yf
	.IF ax > AimYi
		jmp Quit
	.ENDIF
	

	
Quit:
	pop ax
	inc score
	inc lives
	call scoreproc
	jmp MovDuck	
	
PausedGame:
	push xi
	push xf
	push yi
	push yf

	call DisplayPauseMenu
	
	mov yi, 10
	mov yf, 140
	mov xi, 0
	mov xf, 320 
	mov color,0Bh	
	call draw
	
	mov yi, 140
	mov yf, 180
	mov xi, 0
	mov xf, 320 
	mov color,0Ah	
	call draw
	
	mov yi, 180
	mov yf, 200
	mov xi, 0
	mov xf, 320 
	mov color,06h	
	call draw
	
	call scoreproc
	
	pop yf
	pop yi
	pop xf
	pop xi	

	
	jmp MovDuck	
	
GameEnd:
	call filewriting
	call clear_screen
	
	call display_page2
start_game ENDP

draw proc
	mov ah,0ch
	mov dx, yi		; y coordinate initial( up down)
y:
	mov cx, xi		;x coordinate initial (left right)
	x:
		mov al,color			; start array
		int 10h
		
		inc cx
		cmp cx, xf		; x coordinate final( left right)
		jb x
		
	inc dx				; jump to next row
	cmp dx, yf		; y coordinate final( up down)
	jb y
ret
draw endp


start_game2 PROC
MOV AX, 13h
INT 10h

	mov yi, 10
	mov yf, 140
	mov xi, 0
	mov xf, 320 
	mov color,0Bh	
	call draw
	
	mov yi, 140
	mov yf, 180
	mov xi, 0
	mov xf, 320 
	mov color,0Ah	
	call draw
	
	mov yi, 180
	mov yf, 200
	mov xi, 0
	mov xf, 320 
	mov color,06h	
	call draw
	
	call scoreproc


	mov yi, 30  ; from up to down
	mov yf, 42 ;from up to down
	mov xi, 30	; from left to right
	mov xf, 49 ; from left to right
	
	mov AimYi, 50  
	mov AimYf, 70 
	mov AimXi, 150	
	mov AimXf, 165
	
	
	mov yi2, 120  ; from up to down
	mov yf2, 132 ;from up to down
	mov xi2, 160	; from left to right
	mov xf2, 179 ; from left to right
	
	mov lives,3
	
MovDuck:
	add xi,2
    add xf,2
	
	sub yi2,2
    sub yf2,2
	
	
	
	push bx
		mov bl,0
		cmp bl,lives
		je GameEnd
	
		mov bx,337
		cmp bx,xf
		JA CheckDuck2
	pop bx
		
	mov xi,10
	mov xf,29
	inc yi
	inc yf
	
CheckDuck2:
	push bx
		mov bx,10
		cmp bx,yi2
		Jne NoRestPos
	pop bx
	
	mov yi2, 120 
	mov yf2, 132 
NoRestPos:
	mov si, offset Duck	
    call drawObj
	
	mov si, offset Duck	
    call drawObjD2
	
	mov si, offset Aim
    call drawObjII
	
	push cx
	mov cx, 0
	.repeat
		inc cx
	.until(cx==10000)
	pop cx
	
	mov ah, 01h
    int 16h
    jz MovDuck

	mov ah, 00h
    int 16h
	
    cmp ah, 48h  
    je updir
	
    cmp ah, 50h  
    je downdir
	
    cmp ah, 4dh  
    je rightdir
	
    cmp ah, 4bh 
    je leftdir
	
	cmp al,13
	je Shoot
	
	cmp al,70h
	je PausedGame
	
	cmp al,1Bh
	je GameEnd
	

	
leftdir:
	push bx
	
	mov bx,3
    sub AimXi,bx 
    sub AimXf,bx
	
	pop bx
    jmp MovDuck

rightdir:
	push bx
	
	mov bx,3
    add AimXi,bx 
    add AimXf,bx
	
	pop bx
    jmp MovDuck

updir:
	push bx
	
	mov bx,3
    sub AimYi,bx 
    sub AimYf,bx

	pop bx
    jmp MovDuck

downdir:
	push bx
	
	mov bx,3
    add AimYi,bx 
    add AimYf,bx

	pop bx
    jmp MovDuck
	
Shoot:
	push ax
	
	dec lives 
	
	mov ax,xi
	.IF ax < AimXf
		jmp CheckXF
	.else
		pop ax
		jmp Duck2Shoot
	.ENDIF
	
CheckXF:
	mov ax,xf
	.IF ax > AimXi
		jmp CheckY
	.else
		pop ax
		jmp Duck2Shoot
	.ENDIF
	
CheckY:
	mov ax,yi
	.IF ax < AimYf
		jmp CheckYF
	.ELSE
		pop ax
		jmp Duck2Shoot
	.ENDIF

CheckYF:
	mov ax,yf
	.IF ax > AimYi
		jmp Quit
	.ENDIF
	
Duck2Shoot:
	mov ax,xi2
	.IF ax < AimXf
		jmp CheckXF2
	.else
		pop ax
		jmp Skip
	.ENDIF
	
CheckXF2:
	mov ax,xf2
	.IF ax > AimXi
		jmp CheckY2
	.else
		pop ax
		jmp MovDuck
	.ENDIF
	
CheckY2:
	mov ax,yi2
	.IF ax < AimYf
		jmp CheckYF2
	.ELSE
		pop ax
		jmp MovDuck
	.ENDIF

CheckYF2:
	mov ax,yf2
	.IF ax > AimYi
		jmp Quit
	.ENDIF
	
Quit:
	pop ax
	inc score
	inc lives 
	call scoreproc
	
Skip:
	jmp MovDuck	
	
	
PausedGame:
	push xi
	push xf
	push yi
	push yf

	call DisplayPauseMenu
	
	mov yi, 10
	mov yf, 140
	mov xi, 0
	mov xf, 320 
	mov color,0Bh	
	call draw
	
	mov yi, 140
	mov yf, 180
	mov xi, 0
	mov xf, 320 
	mov color,0Ah	
	call draw
	
	mov yi, 180
	mov yf, 200
	mov xi, 0
	mov xf, 320 
	mov color,06h	
	call draw
	
	call scoreproc
	
	pop yf
	pop yi
	pop xf
	pop xi	

	
	jmp MovDuck	
	
GameEnd:
	call filewriting
	call clear_screen
	
    call display_page2
start_game2 ENDP

scoreproc proc
    ;Scores Position
    mov ah,2
    mov bh,00h
    mov dh,23
    mov dl,15
    int 10h

    lea dx, msgscores

    mov ah, 9
    int 21h

    mov ax, score
    mov temp_score,ax
    mov bx, 10

    multi_digit_3:
        mov ax,temp_score
        xor dx,dx
        div bx
        push dx
        mov temp_score, ax
        inc len
    cmp temp_score, 0
    jne multi_digit_3
        
    mov cx, len
print_3:
    pop dx
    add dx, 48
    mov ah, 02
    int 21h
    loop print_3
	
    mov len , 0
    ret
scoreproc endp


drawObj proc
	mov ah,0ch
	mov dx, yi		; y coordinate initial( up down)
y:
	mov cx, xi		;x coordinate initial (left right)
x:
	mov al,[si]			; start array
	int 10h
	inc si				; increment full row  (x axis)
	inc cx
	cmp cx, xf		; x coordinate final( left right)
	jb x
	inc dx				; jump to next row
	cmp dx, yf		; y coordinate final( up down)
	jb y
ret
drawObj endp

drawObjD2 proc
	mov ah,0ch
	mov dx, yi2		; y coordinate initial( up down)
y:
	mov cx, xi2		;x coordinate initial (left right)
	x:
		mov al,[si]			; start array
		int 10h
		inc si				; increment full row  (x axis)
		inc cx
		cmp cx, xf2		; x coordinate final( left right)
		jb x
	inc dx				; jump to next row
	cmp dx, yf2		; y coordinate final( up down)
	jb y
ret
drawObjD2 endp

drawObjII proc
	mov ah,0ch
	mov dx, AimYi		; y coordinate initial( up down)
y:
	mov cx, AimXi		;x coordinate initial (left right)
	x:
		mov al,[si]			; start array
		int 10h
		inc si				; increment full row  (x axis)
		inc cx
		cmp cx, AimXf		; x coordinate final( left right)
		jb x
	inc dx				; jump to next row
	cmp dx, AimYf		; y coordinate final( up down)
	jb y
ret
drawObjII endp

clear_screen PROC
    MOV AX, 0A000h
    MOV ES, AX
    XOR DI, DI
    MOV CX, 320*200 ; Total pixels on the screen
    XOR AX, AX
    REP STOSW
    RET
clear_screen ENDP


filewriting PROC
    MOV AH, 3DH
    MOV AL, 1      ; 2 for both reading and writing
    LEA DX, filename
    INT 21H
    MOV Filehandler, AX

    ; Move the file pointer to the end of the file
    MOV AH, 42H
    MOV AL, 2      ; 2 to move to end of file
    XOR CX, CX
    XOR DX, DX
    MOV BX, Filehandler
    INT 21H 


	call writeScore

    ; Write a space to the file
    MOV AH, 40H
    MOV BX, Filehandler
    MOV CX, 2
    MOV Dx, offset WeNeedSpace
    INT 21H
	
	MOV AH, 40H
    MOV BX, Filehandler
    mov ch, 0
    MOV Cl, UserNameLEN
    LEA DX, username+2
    INT 21H
    
    ; Write a newline to the file
    MOV AH, 40H
    MOV BX, Filehandler
    MOV CX, 1
    MOV DL, 0Ah
    INT 21H

    ; Close the file
    MOV AH, 3EH
    MOV BX, Filehandler
    INT 21H

    RET
filewriting ENDP


ScoreReading PROC
    CALL clear_screen
	
    ; Setting cursor position
    MOV AH, 02H
    MOV BH, 0
    MOV DH, 3   ; Row
    MOV DL, 10  ; Column
    INT 10H

    ; Open the file for reading
    MOV AH, 3DH
    MOV AL, 0      ; 0 for reading
    LEA DX, filename
    INT 21H
    MOV Filehandler, AX

    ; Read the file
    MOV AH, 3FH
    MOV BX, Filehandler
    MOV CX, 10000   ; Number of characters to read
    LEA DX, buffer
    INT 21H
	mov TotalBytes, ax

    ; Close the file
    MOV AH, 3EH
    MOV BX, Filehandler
    INT 21H

	lea si, buffer
    mov cx, TotalBytes
    mov di, 0   
CountLoop:
    cmp cx, 0
    je EndLoop      
	
    mov al, [si]
    inc si

    cmp al, "$"     
    je DontPrint
	
    ; Print the buffer content
    MOV AH, 02H
    mov dl, al
    INT 21H
	
	DontPrint:
		loop CountLoop
	
EndLoop:
page2_input:
    MOV AH, 08h ; input a character from Keyboard without displaying on the screen
    INT 21h
    
    CMP AL, 13
    JNE page2_input
	
	call clear_screen

    RET
ScoreReading ENDP

writeScore proc

	mov dx, 0
	MOV AX, score
	MOV Bx, 10
	L1:
	mov dx, 0
	CMP Ax, 0
	JE DISP
	DIV Bx
	MOV cx, dx
	PUSH CX
	inc counter
	MOV AH, 0
	JMP L1

	DISP:
	CMP counter, 0
	JE EXITWriting
	POP DX
	ADD DX, 48
	
	mov enteredNumber,dx 
	
	mov ah, 40H
	mov bx, Filehandler
	mov cx, 1
	mov dx, offset enteredNumber
	int 21h
	
	dec counter
	JMP DISP
	EXITWriting:
	ret 
writeScore endp

PausedMenu proc
    mov al,0
    mov ah,02h
    mov dl,12
    mov dh,7
    int 10h

    mov dx,offset msgPause
	mov ah,09h
	int 21h
	
    mov al,0
    mov ah,02h
    mov dl,12
    mov dh,10
    int 10h

	mov dx,offset msgExit
	mov ah,09h
	int 21h

    l1:
        mov TriangleColor,0Bh 
        call DrawTriangle
		
        mov bl,dh
		
        mov ah,1
        int 16h 
		jz l1 
		
    mov ah,0
    int 16h
    .if(ah==48h)
        .if(menu_y > 59)
            mov TriangleColor, 01h ;if we are moving from exit to upward then it will remove the triangle in exit and move upward and fill the above with triangle
            call DrawTriangle
            sub menu_y,24 
            sub Select,1
        .endif
    .elseif(ah==50h) ;down direction
        .if(menu_y<79)
            mov TriangleColor, 01h
            call DrawTriangle
            add menu_y,24
            add Select,1 
        .endif
    .endif
    .if(al!=13)
        jmp l1
    .endif

    ret
PausedMenu endp

DisplayPauseMenu proc
	call clear_screen

    ; Set Video Mode for Scroll Up Window II To move up # of lines from Bottom
    MOV AH, 6   ; Scroll Up Window -> Function to change Background Color
    MOV AL, 0  ; Lines to Scroll
    MOV BH, 01h ; Left Char for Background (4 ) & Right Char for Foreground (E) 
    
	MOV CH, 0  ; CH Upper Row # minimum can be 0
	MOV DH, 24  ; Lower row # maximum can be 24
    
	MOV CL, 0  ; CL Left column # minimum can be 0
    MOV DL, 79  ; Right column # maximum can be 79
    INT 10h     ; Call interrupt 10h (BIOS video services)
    
    ; Set Cursor Position
    MOV AH, 02h ; function to set cursor position
    MOV BH, 0   ; Set 1st page number 
    MOV DL, 8  ; Set DL for cursor column position
    MOV DH, 6  ; Set DH for Cursor row position
    INT 10h     ; Call interrupt 10h (BIOS video services)
	
	mov Select, 1
	
	mov	menu_x, 70
	mov	menu_y, 59
	mov	lineLength, 6
	
loop_menu:
	call PausedMenu
	
	cmp Select, 1 
	jne bro2
	jmp continueGame
	
bro2:
	cmp Select, 2
	jne loop_menu

	jmp ToTheMenu

continueGame:
    RET
DisplayPauseMenu endp

END.MODEL SMALL
.STACK 100h
.DATA

msg1 DB " Welcome to the ULTIMATE DUCK SHOOTER (^_^) ! $"
msg2 DB " This game will test your shooting skills.  $"
newline DB 13,10,'$'

msg3 DB	"Please enter your name and press Enter to Continue. $"
  
usernameBuffer DB 20  ; Maximum characters allowed for input
usernameLen DB ?      ; Actual number of characters input
username DB 20 DUP('$') ; Buffer for the username input
  
msgStart db " START GAME Mode 1 $"
msgMode2 db " START GAME Mode 2 $" 
msgExit db " EXIT $"
msgMode3 db " Check Score $"

Duck  DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,14,14,14,14,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,14,14,15,15,14,14,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,14,14,15,15,14,14,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,14,14,14,14,14,14,14,14,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,14,14,14,14,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,14,14,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
      DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh

DuckWidth  EQU 10
DuckHeight EQU 10

	Aim	DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh 	   ; -2
		DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh     ; -1 
		DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh 	   ;  0
		DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh     ;  1
		DB 0Bh,0Bh,0Bh,00h,00h,00h,00h,0Bh,00h,00h,00h,00h,0Bh,0Bh,0Bh     ;  2
		DB 0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh     ;  3
		DB 0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh     ;  4
		DB 0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh     ;  5
		DB 0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh     ;  6
		DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh     ;  7
		DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh     ;  8
		DB 0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh     ;  9
		DB 0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh     ;  10
		DB 0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh     ; 11
		DB 0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,00h,0Bh,0Bh,0Bh     ; 12
		DB 0Bh,0Bh,0Bh,00h,00h,00h,00h,0Bh,00h,00h,00h,00h,0Bh,0Bh,0Bh     ; 13
		DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh     ; 14
		DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh     ; 15
		DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh     ; 16
		DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh     ; 17
		
	xi dw 0
	xf dw 0
	yi dw 0
	yf dw 0
	
	AimXi dw 0
	AimXf dw 0
	AimYi dw 0
	AimYf dw 0
	
	
	color db 0
	
	MenuSelect db 1
	
	TriangleColor db ?
	menu_x dw 70
	menu_y dw 59
	level dw 1
	
	lineLength dw 6
	
	msgscores db "Score ",'$'
	score dw 0
	temp_score dw 0
	len dw 0 
	
	xi2 dw 0
	xf2 dw 0
	yi2 dw 0
	yf2 dw 0
	
	lives db 0

	Filehandler dw ?
	TotalBytes dw 0
	filename db "BANKAISE.TXT",0
	buffer db 10000 dup ("$")
	
	;UserNameLEN dw 0
	scoreLEN dw 0
	
	digitCount db 0
	anotherCounter db 0
	temp1 dw 0
	counter db 0
	enteredNumber dw 0
	
	WeNeedSpace db '  $'
	
	msgPause db 'Continue $'
	
	
	Select db 1
.CODE
MOV AX, @DATA
MOV DS, AX

    CALL display_page1
	
ToTheMenu:
	call clear_screen
	
	MOV AX, 13h
	INT 10h
	
    CALL display_page2 
	
	

display_page1 PROC
    ; Set Video Mode for Scroll Up Window (25 x 80) To move up # of lines from Bottom
    MOV AH, 6   ; Scroll Up Window -> Function to change Background Color
    MOV AL, 0  ; Lines to Scroll -> AL = 0 or 25 will Scroll whole screen
    MOV BH, 0Eh ; Left Char for Background (4 ) & Right Char for Foreground (E)
    MOV CH, 0  ; CH Upper Row # minimum can be 0
    MOV CL, 0  ; CL Left column # minimum can be 0
    MOV DH, 24  ; Lower row # maximum can be 24
    MOV DL, 79  ; Right column # maximum can be 79
    INT 10h     ; Call interrupt 10h (BIOS video services)
    
    ; Set Cursor Position
    MOV AH, 02h ; function to set cursor position
    MOV BH, 0   ; Set 1st page number     
    MOV DL, 8  ; Set DL for cursor column position
    MOV DH, 3 ; Set DH for Cursor row position
    INT 10h     ; Call interrupt 10h (BIOS video services)
    
    ; Print String
    MOV DX, OFFSET msg1  ; Load the offset address of the string 'msg' into the DX register
    MOV AH, 09h         ; Set AH register to 09h (function to print a string)
    INT 21h             ; Call interrupt 21h (DOS services)
    
    ; Set Cursor Position for next message
    MOV AH, 02h ; function to set cursor position
    MOV BH, 0   ; Set 1st page number     
    MOV DL, 8  ; Set DL for cursor column position
    MOV DH, 9 ; Set DH for Cursor row position
    INT 10h     ; Call interrupt 10h (BIOS video services)
    
    ; Print String
    MOV DX, OFFSET msg2  ; Load the offset address of the string 'msg' into the DX register
    MOV AH, 09h         ; Set AH register to 09h (function to print a string)
	INT 21h ; Call interrupt 21h (DOS services)
	
		; Set Cursor Position for next message
    MOV AH, 02h ; function to set cursor position
    MOV BH, 0   ; Set 1st page number     
    MOV DL, 8  ; Set DL for cursor column position
    MOV DH, 12 ; Set DH for Cursor row position
    INT 10h     ; Call interrupt 10h (BIOS video services)

	
	;new line
	LEA DX,newline
    MOV AH,09h
    INT 21h
	
	;new line
	LEA DX,newline
    MOV AH,09h
    INT 21h
	
	; Set Cursor Position for next message
    MOV AH, 02h ; function to set cursor position
    MOV BH, 0   ; Set 1st page number     
    MOV DL, 8  ; Set DL for cursor column position
    MOV DH, 15  ; Set DH for Cursor row position
    INT 10h     ; Call interrupt 10h (BIOS video services)
	
	; Print String
    MOV DX, OFFSET msg3  ; Load the offset address of the string 'msg' into the DX register
    MOV AH, 09h         ; Set AH register to 09h (function to print a string)
	INT 21h ; Call interrupt 21h (DOS services)
	
	
	; Set Cursor Position for next message
    MOV AH, 02h ; function to set cursor position
    MOV BH, 0   ; Set 1st page number     
    MOV DL, 18  ; Set DL for cursor column position
    MOV DH, 18  ; Set DH for Cursor row position
    INT 10h     ; Call interrupt 10h (BIOS video services)
	
	
	;new line
	LEA DX,newline
    MOV AH,09h
    INT 21h
	
    ; Take username input
    LEA DX, usernameBuffer
    MOV AH, 0Ah
    INT 21h

    ; Display the entered username (for verification)
    LEA DX, username+2  ; Skip the length bytes
    MOV AH, 09h
    INT 21h
	

    
    ; Set Cursor Position out of Window
    MOV AH, 02h ; function to set cursor position
    MOV BH, 0   ; Set 1st page number , Welcome Page of Game for example    
    MOV DL, 0  ; Set DL for cursor column position
    MOV DH, 24  ; Set DH for Cursor row position
    INT 10h     ; Call interrupt 10h (BIOS video services)
    
    ; Take Input For Enter
page2_input:
    MOV AH, 08h ; input a character from Keyboard without displaying on the screen
    INT 21h
    
    CMP AL, 13
    JNE page2_input
    
    RET
display_page1 ENDP

display_page2 PROC
	call clear_screen

    ; Set Video Mode for Scroll Up Window II To move up # of lines from Bottom
    MOV AH, 6   ; Scroll Up Window -> Function to change Background Color
    MOV AL, 0  ; Lines to Scroll
    MOV BH, 01h ; Left Char for Background (4 ) & Right Char for Foreground (E) 
    
	MOV CH, 0  ; CH Upper Row # minimum can be 0
	MOV DH, 24  ; Lower row # maximum can be 24
    
	MOV CL, 0  ; CL Left column # minimum can be 0
    MOV DL, 79  ; Right column # maximum can be 79
    INT 10h     ; Call interrupt 10h (BIOS video services)
    
    ; Set Cursor Position
    MOV AH, 02h ; function to set cursor position
    MOV BH, 0   ; Set 1st page number 
    MOV DL, 8  ; Set DL for cursor column position
    MOV DH, 6  ; Set DH for Cursor row position
    INT 10h     ; Call interrupt 10h (BIOS video services)
	
	mov score, 0
	mov	menu_x, 70
	mov	menu_y, 59
	mov	lineLength, 6
	mov menuSelect, 1
loop_menu:
	call menu
	
	;call clear_screen
	cmp menuSelect, 1 
	jne bro2

	CALL start_game
bro2:
	cmp menuSelect, 2 
	jne bro3
	;ClearScreen
	CALL start_game2
	
bro3:
	cmp menuSelect, 3
	jne bro

	call clear_screen
	call ScoreReading
bro:
	cmp menuSelect, 4
	jne loop_menu

	je exit

exit::
MOV AH, 4Ch
INT 21h

    RET
display_page2 ENDP

Menu proc   
    mov al,0
    mov ah,02h
    mov dl,12
    mov dh,7
    int 10h

    mov dx,offset msgStart
	mov ah,09h
	int 21h
	
    mov ah,02h
    mov dl,12
    add dh,10
    int 10h
	
    mov dx,offset msgMode2
	mov ah,09h
	int 21h
	
	mov ah,02h
    mov dl,12
    add dh,13
    int 10h
	
    mov dx,offset msgMode3
	mov ah,09h
	int 21h
	
    mov ah,02h
	mov dl,12
    add dh,16
    int 10h
    
	mov dx,offset msgExit
	mov ah,09h
	int 21h

    l1:
        mov TriangleColor,0Bh 
        call DrawTriangle
		
        mov bl,dh
		
        mov ah,1
        int 16h 
		jz l1 
		
    mov ah,0
    int 16h
    .if(ah==48h)
        .if(menu_y > 59)
            mov TriangleColor, 01h ;if we are moving from exit to upward then it will remove the triangle in exit and move upward and fill the above with triangle
            call DrawTriangle
            sub menu_y,24 
            sub menuSelect,1
        .endif
    .elseif(ah==50h) ;down direction
        .if(menu_y<120)
            mov TriangleColor, 01h
            call DrawTriangle
            add menu_y,24
            add menuSelect,1 
        .endif
    .endif
    .if(al!=13)
        jmp l1
    .endif

    ret
Menu endp

DrawTriangle proc
    mov cx,menu_x   
    mov dx,menu_y   
    mov bx,0
    push Linelength
    
    .while( bx !=  4)
        sub LineLength,1
        inc bx
        push bx
        mov bx,0
        mov dx,menu_y
        .while(bx < Linelength)
            inc bx
            mov ah,0ch
            mov al,trianglecolor
            int 10h
            inc dx
        .endw
        inc cx
        pop bx
    .endw
    pop Linelength

    push Linelength
    mov cx,menu_x
    mov dx,menu_y
    mov bx,0
    .while( bx !=  6)
        sub LineLength,1
        inc bx
        push bx
        mov bx,0
        mov dx,menu_y
        .while(bx < Linelength)
            inc bx
            mov ah,0ch
            mov al,trianglecolor
            int 10h
            dec dx
        .endw
        inc cx
        pop bx
    .endw

    pop linelength
    ret
DrawTriangle endp

start_game PROC
MOV AX, 13h
INT 10h

	mov yi, 10
	mov yf, 140
	mov xi, 0
	mov xf, 320 
	mov color,0Bh	
	call draw
	
	mov yi, 140
	mov yf, 180
	mov xi, 0
	mov xf, 320 
	mov color,0Ah	
	call draw
	
	mov yi, 180
	mov yf, 200
	mov xi, 0
	mov xf, 320 
	mov color,06h	
	call draw
	
	call scoreproc


	mov yi, 30  ; from up to down
	mov yf, 42 ;from up to down
	mov xi, 30	; from left to right
	mov xf, 49 ; from left to right
	
	mov AimYi, 50  
	mov AimYf, 70 
	mov AimXi, 150	
	mov AimXf, 165
	
	mov lives,3
	
MovDuck:
	inc xi
    inc xf

	push bx
		mov bl,0
		cmp bl,lives
		je GameEnd	
	
		mov bx,337
		cmp bx,xf
		JA NoRestPos
	pop bx
	
	mov xi,10
	mov xf,29
	inc yi
	inc yf
	
NoRestPos:
	mov si, offset Duck	
    call drawObj
	
	mov si, offset Aim
    call drawObjII
	
	push cx
	mov cx, 0
	.repeat
		inc cx
	.until(cx==10000)
	pop cx
	
	mov ah, 01h
    int 16h
    jz MovDuck

	mov ah, 00h
    int 16h
	
    cmp ah, 48h  
    je updir
	
    cmp ah, 50h  
    je downdir
	
    cmp ah, 4dh  
    je rightdir
	
    cmp ah, 4bh 
    je leftdir
	
	cmp al,13
	je Shoot
	
	cmp al,70h
	je PausedGame
	
	cmp al,1Bh
	je GameEnd
	

	
leftdir:
	push bx
	
	mov bx,3
    sub AimXi,bx 
    sub AimXf,bx
	
	pop bx
    jmp MovDuck

rightdir:
	push bx
	
	mov bx,3
    add AimXi,bx 
    add AimXf,bx
	
	pop bx
    jmp MovDuck

updir:
	push bx
	
	mov bx,3
    sub AimYi,bx 
    sub AimYf,bx

	pop bx
    jmp MovDuck

downdir:
	push bx
	
	mov bx,3
    add AimYi,bx 
    add AimYf,bx

	pop bx
    jmp MovDuck
	
Shoot:
	push ax
	
	dec lives
	
	mov ax,xi
	.IF ax < AimXf
		jmp CheckXF
	.else
		pop ax
		jmp MovDuck
	.ENDIF
	
CheckXF:
	mov ax,xf
	.IF ax > AimXi
		jmp CheckY
	.else
		pop ax
		jmp MovDuck
	.ENDIF
	
CheckY:
	mov ax,yi
	.IF ax < AimYf
		jmp CheckYF
	.ELSE
		pop ax
		jmp MovDuck
	.ENDIF

CheckYF:
	mov ax,yf
	.IF ax > AimYi
		jmp Quit
	.ENDIF
	

	
Quit:
	pop ax
	inc score
	inc lives
	call scoreproc
	jmp MovDuck	
	
PausedGame:
	push xi
	push xf
	push yi
	push yf

	call DisplayPauseMenu
	
	mov yi, 10
	mov yf, 140
	mov xi, 0
	mov xf, 320 
	mov color,0Bh	
	call draw
	
	mov yi, 140
	mov yf, 180
	mov xi, 0
	mov xf, 320 
	mov color,0Ah	
	call draw
	
	mov yi, 180
	mov yf, 200
	mov xi, 0
	mov xf, 320 
	mov color,06h	
	call draw
	
	call scoreproc
	
	pop yf
	pop yi
	pop xf
	pop xi	

	
	jmp MovDuck	
	
GameEnd:
	call filewriting
	call clear_screen
	
	call display_page2
start_game ENDP

draw proc
	mov ah,0ch
	mov dx, yi		; y coordinate initial( up down)
y:
	mov cx, xi		;x coordinate initial (left right)
	x:
		mov al,color			; start array
		int 10h
		
		inc cx
		cmp cx, xf		; x coordinate final( left right)
		jb x
		
	inc dx				; jump to next row
	cmp dx, yf		; y coordinate final( up down)
	jb y
ret
draw endp


start_game2 PROC
MOV AX, 13h
INT 10h

	mov yi, 10
	mov yf, 140
	mov xi, 0
	mov xf, 320 
	mov color,0Bh	
	call draw
	
	mov yi, 140
	mov yf, 180
	mov xi, 0
	mov xf, 320 
	mov color,0Ah	
	call draw
	
	mov yi, 180
	mov yf, 200
	mov xi, 0
	mov xf, 320 
	mov color,06h	
	call draw
	
	call scoreproc


	mov yi, 30  ; from up to down
	mov yf, 42 ;from up to down
	mov xi, 30	; from left to right
	mov xf, 49 ; from left to right
	
	mov AimYi, 50  
	mov AimYf, 70 
	mov AimXi, 150	
	mov AimXf, 165
	
	
	mov yi2, 120  ; from up to down
	mov yf2, 132 ;from up to down
	mov xi2, 160	; from left to right
	mov xf2, 179 ; from left to right
	
	mov lives,3
	
MovDuck:
	add xi,2
    add xf,2
	
	sub yi2,2
    sub yf2,2
	
	
	
	push bx
		mov bl,0
		cmp bl,lives
		je GameEnd
	
		mov bx,337
		cmp bx,xf
		JA CheckDuck2
	pop bx
		
	mov xi,10
	mov xf,29
	inc yi
	inc yf
	
CheckDuck2:
	push bx
		mov bx,10
		cmp bx,yi2
		Jne NoRestPos
	pop bx
	
	mov yi2, 120 
	mov yf2, 132 
NoRestPos:
	mov si, offset Duck	
    call drawObj
	
	mov si, offset Duck	
    call drawObjD2
	
	mov si, offset Aim
    call drawObjII
	
	push cx
	mov cx, 0
	.repeat
		inc cx
	.until(cx==10000)
	pop cx
	
	mov ah, 01h
    int 16h
    jz MovDuck

	mov ah, 00h
    int 16h
	
    cmp ah, 48h  
    je updir
	
    cmp ah, 50h  
    je downdir
	
    cmp ah, 4dh  
    je rightdir
	
    cmp ah, 4bh 
    je leftdir
	
	cmp al,13
	je Shoot
	
	cmp al,70h
	je PausedGame
	
	cmp al,1Bh
	je GameEnd
	

	
leftdir:
	push bx
	
	mov bx,3
    sub AimXi,bx 
    sub AimXf,bx
	
	pop bx
    jmp MovDuck

rightdir:
	push bx
	
	mov bx,3
    add AimXi,bx 
    add AimXf,bx
	
	pop bx
    jmp MovDuck

updir:
	push bx
	
	mov bx,3
    sub AimYi,bx 
    sub AimYf,bx

	pop bx
    jmp MovDuck

downdir:
	push bx
	
	mov bx,3
    add AimYi,bx 
    add AimYf,bx

	pop bx
    jmp MovDuck
	
Shoot:
	push ax
	
	dec lives 
	
	mov ax,xi
	.IF ax < AimXf
		jmp CheckXF
	.else
		pop ax
		jmp Duck2Shoot
	.ENDIF
	
CheckXF:
	mov ax,xf
	.IF ax > AimXi
		jmp CheckY
	.else
		pop ax
		jmp Duck2Shoot
	.ENDIF
	
CheckY:
	mov ax,yi
	.IF ax < AimYf
		jmp CheckYF
	.ELSE
		pop ax
		jmp Duck2Shoot
	.ENDIF

CheckYF:
	mov ax,yf
	.IF ax > AimYi
		jmp Quit
	.ENDIF
	
Duck2Shoot:
	mov ax,xi2
	.IF ax < AimXf
		jmp CheckXF2
	.else
		pop ax
		jmp Skip
	.ENDIF
	
CheckXF2:
	mov ax,xf2
	.IF ax > AimXi
		jmp CheckY2
	.else
		pop ax
		jmp MovDuck
	.ENDIF
	
CheckY2:
	mov ax,yi2
	.IF ax < AimYf
		jmp CheckYF2
	.ELSE
		pop ax
		jmp MovDuck
	.ENDIF

CheckYF2:
	mov ax,yf2
	.IF ax > AimYi
		jmp Quit
	.ENDIF
	
Quit:
	pop ax
	inc score
	inc lives 
	call scoreproc
	
Skip:
	jmp MovDuck	
	
	
PausedGame:
	push xi
	push xf
	push yi
	push yf

	call DisplayPauseMenu
	
	mov yi, 10
	mov yf, 140
	mov xi, 0
	mov xf, 320 
	mov color,0Bh	
	call draw
	
	mov yi, 140
	mov yf, 180
	mov xi, 0
	mov xf, 320 
	mov color,0Ah	
	call draw
	
	mov yi, 180
	mov yf, 200
	mov xi, 0
	mov xf, 320 
	mov color,06h	
	call draw
	
	call scoreproc
	
	pop yf
	pop yi
	pop xf
	pop xi	

	
	jmp MovDuck	
	
GameEnd:
	call filewriting
	call clear_screen
	
    call display_page2
start_game2 ENDP

scoreproc proc
    ;Scores Position
    mov ah,2
    mov bh,00h
    mov dh,23
    mov dl,15
    int 10h

    lea dx, msgscores

    mov ah, 9
    int 21h

    mov ax, score
    mov temp_score,ax
    mov bx, 10

    multi_digit_3:
        mov ax,temp_score
        xor dx,dx
        div bx
        push dx
        mov temp_score, ax
        inc len
    cmp temp_score, 0
    jne multi_digit_3
        
    mov cx, len
print_3:
    pop dx
    add dx, 48
    mov ah, 02
    int 21h
    loop print_3
	
    mov len , 0
    ret
scoreproc endp


drawObj proc
	mov ah,0ch
	mov dx, yi		; y coordinate initial( up down)
y:
	mov cx, xi		;x coordinate initial (left right)
x:
	mov al,[si]			; start array
	int 10h
	inc si				; increment full row  (x axis)
	inc cx
	cmp cx, xf		; x coordinate final( left right)
	jb x
	inc dx				; jump to next row
	cmp dx, yf		; y coordinate final( up down)
	jb y
ret
drawObj endp

drawObjD2 proc
	mov ah,0ch
	mov dx, yi2		; y coordinate initial( up down)
y:
	mov cx, xi2		;x coordinate initial (left right)
	x:
		mov al,[si]			; start array
		int 10h
		inc si				; increment full row  (x axis)
		inc cx
		cmp cx, xf2		; x coordinate final( left right)
		jb x
	inc dx				; jump to next row
	cmp dx, yf2		; y coordinate final( up down)
	jb y
ret
drawObjD2 endp

drawObjII proc
	mov ah,0ch
	mov dx, AimYi		; y coordinate initial( up down)
y:
	mov cx, AimXi		;x coordinate initial (left right)
	x:
		mov al,[si]			; start array
		int 10h
		inc si				; increment full row  (x axis)
		inc cx
		cmp cx, AimXf		; x coordinate final( left right)
		jb x
	inc dx				; jump to next row
	cmp dx, AimYf		; y coordinate final( up down)
	jb y
ret
drawObjII endp

clear_screen PROC
    MOV AX, 0A000h
    MOV ES, AX
    XOR DI, DI
    MOV CX, 320*200 ; Total pixels on the screen
    XOR AX, AX
    REP STOSW
    RET
clear_screen ENDP


filewriting PROC
    MOV AH, 3DH
    MOV AL, 1      ; 2 for both reading and writing
    LEA DX, filename
    INT 21H
    MOV Filehandler, AX

    ; Move the file pointer to the end of the file
    MOV AH, 42H
    MOV AL, 2      ; 2 to move to end of file
    XOR CX, CX
    XOR DX, DX
    MOV BX, Filehandler
    INT 21H 


	call writeScore

    ; Write a space to the file
    MOV AH, 40H
    MOV BX, Filehandler
    MOV CX, 2
    MOV Dx, offset WeNeedSpace
    INT 21H
	
	MOV AH, 40H
    MOV BX, Filehandler
    mov ch, 0
    MOV Cl, UserNameLEN
    LEA DX, username+2
    INT 21H
    
    ; Write a newline to the file
    MOV AH, 40H
    MOV BX, Filehandler
    MOV CX, 1
    MOV DL, 0Ah
    INT 21H

    ; Close the file
    MOV AH, 3EH
    MOV BX, Filehandler
    INT 21H

    RET
filewriting ENDP


ScoreReading PROC
    CALL clear_screen
	
    ; Setting cursor position
    MOV AH, 02H
    MOV BH, 0
    MOV DH, 3   ; Row
    MOV DL, 10  ; Column
    INT 10H

    ; Open the file for reading
    MOV AH, 3DH
    MOV AL, 0      ; 0 for reading
    LEA DX, filename
    INT 21H
    MOV Filehandler, AX

    ; Read the file
    MOV AH, 3FH
    MOV BX, Filehandler
    MOV CX, 10000   ; Number of characters to read
    LEA DX, buffer
    INT 21H
	mov TotalBytes, ax

    ; Close the file
    MOV AH, 3EH
    MOV BX, Filehandler
    INT 21H

	lea si, buffer
    mov cx, TotalBytes
    mov di, 0   
CountLoop:
    cmp cx, 0
    je EndLoop      
	
    mov al, [si]
    inc si

    cmp al, "$"     
    je DontPrint
	
    ; Print the buffer content
    MOV AH, 02H
    mov dl, al
    INT 21H
	
	DontPrint:
		loop CountLoop
	
EndLoop:
page2_input:
    MOV AH, 08h ; input a character from Keyboard without displaying on the screen
    INT 21h
    
    CMP AL, 13
    JNE page2_input
	
	call clear_screen

    RET
ScoreReading ENDP

writeScore proc

	mov dx, 0
	MOV AX, score
	MOV Bx, 10
	L1:
	mov dx, 0
	CMP Ax, 0
	JE DISP
	DIV Bx
	MOV cx, dx
	PUSH CX
	inc counter
	MOV AH, 0
	JMP L1

	DISP:
	CMP counter, 0
	JE EXITWriting
	POP DX
	ADD DX, 48
	
	mov enteredNumber,dx 
	
	mov ah, 40H
	mov bx, Filehandler
	mov cx, 1
	mov dx, offset enteredNumber
	int 21h
	
	dec counter
	JMP DISP
	EXITWriting:
	ret 
writeScore endp

PausedMenu proc
    mov al,0
    mov ah,02h
    mov dl,12
    mov dh,7
    int 10h

    mov dx,offset msgPause
	mov ah,09h
	int 21h
	
    mov al,0
    mov ah,02h
    mov dl,12
    mov dh,10
    int 10h

	mov dx,offset msgExit
	mov ah,09h
	int 21h

    l1:
        mov TriangleColor,0Bh 
        call DrawTriangle
		
        mov bl,dh
		
        mov ah,1
        int 16h 
		jz l1 
		
    mov ah,0
    int 16h
    .if(ah==48h)
        .if(menu_y > 59)
            mov TriangleColor, 01h ;if we are moving from exit to upward then it will remove the triangle in exit and move upward and fill the above with triangle
            call DrawTriangle
            sub menu_y,24 
            sub Select,1
        .endif
    .elseif(ah==50h) ;down direction
        .if(menu_y<79)
            mov TriangleColor, 01h
            call DrawTriangle
            add menu_y,24
            add Select,1 
        .endif
    .endif
    .if(al!=13)
        jmp l1
    .endif

    ret
PausedMenu endp

DisplayPauseMenu proc
	call clear_screen

    ; Set Video Mode for Scroll Up Window II To move up # of lines from Bottom
    MOV AH, 6   ; Scroll Up Window -> Function to change Background Color
    MOV AL, 0  ; Lines to Scroll
    MOV BH, 01h ; Left Char for Background (4 ) & Right Char for Foreground (E) 
    
	MOV CH, 0  ; CH Upper Row # minimum can be 0
	MOV DH, 24  ; Lower row # maximum can be 24
    
	MOV CL, 0  ; CL Left column # minimum can be 0
    MOV DL, 79  ; Right column # maximum can be 79
    INT 10h     ; Call interrupt 10h (BIOS video services)
    
    ; Set Cursor Position
    MOV AH, 02h ; function to set cursor position
    MOV BH, 0   ; Set 1st page number 
    MOV DL, 8  ; Set DL for cursor column position
    MOV DH, 6  ; Set DH for Cursor row position
    INT 10h     ; Call interrupt 10h (BIOS video services)
	
	mov Select, 1
	
	mov	menu_x, 70
	mov	menu_y, 59
	mov	lineLength, 6
	
loop_menu:
	call PausedMenu
	
	cmp Select, 1 
	jne bro2
	jmp continueGame
	
bro2:
	cmp Select, 2
	jne loop_menu

	jmp ToTheMenu

continueGame:
    RET
DisplayPauseMenu endp

END