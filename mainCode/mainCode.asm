
_configMain:

;mainCode.c,51 :: 		void configMain(){
;mainCode.c,52 :: 		SSPCON.f5 = 0;
	BCF        SSPCON+0, 5
;mainCode.c,54 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;mainCode.c,56 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;mainCode.c,57 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;mainCode.c,58 :: 		Lcd_Out(1, 1, "Inicio");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_mainCode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;mainCode.c,59 :: 		Lcd_Out(2, 1, "do Programa");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_mainCode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;mainCode.c,60 :: 		Delay_ms(100);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_configMain0:
	DECFSZ     R13+0, 1
	GOTO       L_configMain0
	DECFSZ     R12+0, 1
	GOTO       L_configMain0
	NOP
;mainCode.c,62 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;mainCode.c,63 :: 		Lcd_Out(1, 1, "Carregando");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_mainCode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;mainCode.c,64 :: 		Lcd_Out(2, 1, "Configuracoes");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_mainCode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;mainCode.c,65 :: 		Delay_ms(100);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_configMain1:
	DECFSZ     R13+0, 1
	GOTO       L_configMain1
	DECFSZ     R12+0, 1
	GOTO       L_configMain1
	NOP
;mainCode.c,67 :: 		TRISA = 0b11111111;    //configura porta como entrada
	MOVLW      255
	MOVWF      TRISA+0
;mainCode.c,69 :: 		ADCON1 = 0b11001110;
	MOVLW      206
	MOVWF      ADCON1+0
;mainCode.c,70 :: 		ADCON0 = 0b10000000;
	MOVLW      128
	MOVWF      ADCON0+0
;mainCode.c,71 :: 		TRISA = 0b11111111;
	MOVLW      255
	MOVWF      TRISA+0
;mainCode.c,73 :: 		TRISB = 0b11111100;   //configura portb.b0 e b1 como saida
	MOVLW      252
	MOVWF      TRISB+0
;mainCode.c,74 :: 		PORTB = 0b00000000;    //limpa data latchs do portb
	CLRF       PORTB+0
;mainCode.c,75 :: 		INTCON.f4 = 0;          //desabilitada funçao de interrupcao externa no pino RB0
	BCF        INTCON+0, 4
;mainCode.c,77 :: 		TRISC = 0b11111011;   //configura portc.b2 como saida
	MOVLW      251
	MOVWF      TRISC+0
;mainCode.c,78 :: 		PORTC = 0b00000000;    //limpa data latchs do portc
	CLRF       PORTC+0
;mainCode.c,80 :: 		SSPCON.f5 = 0;
	BCF        SSPCON+0, 5
;mainCode.c,82 :: 		PWM1_Init(500);   //inicializa modulo PWM1 com 500Hz
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;mainCode.c,84 :: 		TRISD.f7 = 0;
	BCF        TRISD+0, 7
;mainCode.c,85 :: 		PORTD.f7 = 0;
	BCF        PORTD+0, 7
;mainCode.c,86 :: 		PORTD.f7 = 1;
	BSF        PORTD+0, 7
;mainCode.c,88 :: 		SSPCON.f5 = 0;
	BCF        SSPCON+0, 5
;mainCode.c,89 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;mainCode.c,90 :: 		Lcd_Out(1, 1, "Configuracoes");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_mainCode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;mainCode.c,91 :: 		Lcd_Out(2, 1, "Carregadas");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_mainCode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;mainCode.c,92 :: 		Delay_ms(100);
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_configMain2:
	DECFSZ     R13+0, 1
	GOTO       L_configMain2
	DECFSZ     R12+0, 1
	GOTO       L_configMain2
	NOP
;mainCode.c,93 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;mainCode.c,94 :: 		SSPCON.f5 = 0;
	BCF        SSPCON+0, 5
;mainCode.c,96 :: 		clockWiseDirection = PORTA.f3;
	MOVLW      0
	BTFSC      PORTA+0, 3
	MOVLW      1
	MOVWF      _clockWiseDirection+0
	CLRF       _clockWiseDirection+1
;mainCode.c,98 :: 		flag0 = false;
	CLRF       _flag0+0
	CLRF       _flag0+1
;mainCode.c,99 :: 		}
L_end_configMain:
	RETURN
; end of _configMain

_ADC_Read:

;mainCode.c,100 :: 		unsigned int ADC_Read(){
;mainCode.c,103 :: 		ADCON1 = 0b11001110;   //configura apenas AN0 como pino de entrada analógica
	MOVLW      206
	MOVWF      ADCON1+0
;mainCode.c,104 :: 		Delay_us(1000);
	MOVLW      83
	MOVWF      R13+0
L_ADC_Read3:
	DECFSZ     R13+0, 1
	GOTO       L_ADC_Read3
;mainCode.c,105 :: 		ADCON0 = 0b10000101;
	MOVLW      133
	MOVWF      ADCON0+0
;mainCode.c,106 :: 		while(ADCON0.f2);
L_ADC_Read4:
	BTFSS      ADCON0+0, 2
	GOTO       L_ADC_Read5
	GOTO       L_ADC_Read4
L_ADC_Read5:
;mainCode.c,107 :: 		adcvalue = ((ADRESH<<8)|(ADRESL));
	MOVF       ADRESH+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       ADRESL+0, 0
	IORWF      R0+0, 1
	MOVLW      0
	IORWF      R0+1, 1
;mainCode.c,108 :: 		return adcvalue;
;mainCode.c,109 :: 		}
L_end_ADC_Read:
	RETURN
; end of _ADC_Read

_main:

;mainCode.c,110 :: 		void main() {
;mainCode.c,113 :: 		configMain();
	CALL       _configMain+0
;mainCode.c,115 :: 		while(true){
L_main6:
;mainCode.c,117 :: 		if (!clockWiseDirection) Lcd_Out(2, 1, "Horario");
	MOVF       _clockWiseDirection+0, 0
	IORWF      _clockWiseDirection+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main8
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_mainCode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main9
L_main8:
;mainCode.c,118 :: 		else Lcd_Out(2, 1, "Antihorario");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_mainCode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_main9:
;mainCode.c,120 :: 		if(!PORTA.f3 && !flag0){
	BTFSC      PORTA+0, 3
	GOTO       L_main12
	MOVF       _flag0+0, 0
	IORWF      _flag0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main12
L__main39:
;mainCode.c,121 :: 		Delay_ms(debounceTime);
	MOVLW      17
	MOVWF      R12+0
	MOVLW      58
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	NOP
;mainCode.c,122 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;mainCode.c,123 :: 		Lcd_Out(2, 1, "Horario");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_mainCode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;mainCode.c,125 :: 		clockWiseDirection = false;
	CLRF       _clockWiseDirection+0
	CLRF       _clockWiseDirection+1
;mainCode.c,126 :: 		flag0 = true;
	MOVLW      1
	MOVWF      _flag0+0
	MOVLW      0
	MOVWF      _flag0+1
;mainCode.c,127 :: 		}
	GOTO       L_main14
L_main12:
;mainCode.c,128 :: 		else if (PORTA.f3 && flag0){
	BTFSS      PORTA+0, 3
	GOTO       L_main17
	MOVF       _flag0+0, 0
	IORWF      _flag0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main17
L__main38:
;mainCode.c,129 :: 		Delay_ms(debounceTime);
	MOVLW      17
	MOVWF      R12+0
	MOVLW      58
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	NOP
;mainCode.c,130 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;mainCode.c,131 :: 		Lcd_Out(2, 1, "AntiHorario");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_mainCode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;mainCode.c,133 :: 		clockWiseDirection = true;
	MOVLW      1
	MOVWF      _clockWiseDirection+0
	MOVLW      0
	MOVWF      _clockWiseDirection+1
;mainCode.c,134 :: 		flag0 = false;
	CLRF       _flag0+0
	CLRF       _flag0+1
;mainCode.c,135 :: 		}
L_main17:
L_main14:
;mainCode.c,136 :: 		potDutyCicle = ADC_Read();              //adquire o valor analógico de tensão do pino ra em binario
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _potDutyCicle+0
	MOVF       R0+1, 0
	MOVWF      _potDutyCicle+1
;mainCode.c,137 :: 		decScaleDutyCicle = floor((255L*potDutyCicle)/1024);
	MOVLW      0
	MOVWF      R0+2
	MOVWF      R0+3
	MOVLW      255
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      0
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      10
	MOVWF      R8+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       R8+0, 0
L__main43:
	BTFSC      STATUS+0, 2
	GOTO       L__main44
	RRF        R4+3, 1
	RRF        R4+2, 1
	RRF        R4+1, 1
	RRF        R4+0, 1
	BCF        R4+3, 7
	ADDLW      255
	GOTO       L__main43
L__main44:
	MOVF       R4+0, 0
	MOVWF      R0+0
	MOVF       R4+1, 0
	MOVWF      R0+1
	MOVF       R4+2, 0
	MOVWF      R0+2
	MOVF       R4+3, 0
	MOVWF      R0+3
	CALL       _longword2double+0
	MOVF       R0+0, 0
	MOVWF      FARG_floor_x+0
	MOVF       R0+1, 0
	MOVWF      FARG_floor_x+1
	MOVF       R0+2, 0
	MOVWF      FARG_floor_x+2
	MOVF       R0+3, 0
	MOVWF      FARG_floor_x+3
	CALL       _floor+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _decScaleDutyCicle+0
	MOVF       R0+1, 0
	MOVWF      _decScaleDutyCicle+1
;mainCode.c,138 :: 		IntToStr(floor((100L*decScaleDutyCicle/255)), txt0);
	MOVLW      0
	BTFSC      R0+1, 7
	MOVLW      255
	MOVWF      R0+2
	MOVWF      R0+3
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      0
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      255
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_S+0
	CALL       _longint2double+0
	MOVF       R0+0, 0
	MOVWF      FARG_floor_x+0
	MOVF       R0+1, 0
	MOVWF      FARG_floor_x+1
	MOVF       R0+2, 0
	MOVWF      FARG_floor_x+2
	MOVF       R0+3, 0
	MOVWF      FARG_floor_x+3
	CALL       _floor+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;mainCode.c,140 :: 		Lcd_Out(1, 7, strcat(txt0,"%"));
	MOVLW      _txt0+0
	MOVWF      FARG_strcat_to+0
	MOVLW      ?lstr11_mainCode+0
	MOVWF      FARG_strcat_from+0
	CALL       _strcat+0
	MOVF       R0+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	CALL       _Lcd_Out+0
;mainCode.c,141 :: 		Lcd_Out(1, 1, "Soft:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_mainCode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;mainCode.c,143 :: 		if (!PORTA.f1){
	BTFSC      PORTA+0, 1
	GOTO       L_main19
;mainCode.c,144 :: 		Delay_ms(debounceTime);
	MOVLW      17
	MOVWF      R12+0
	MOVLW      58
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	NOP
;mainCode.c,146 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;mainCode.c,147 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;mainCode.c,148 :: 		softStart = false;
	BCF        _softStart+0, BitPos(_softStart+0)
;mainCode.c,150 :: 		if (clockWiseDirection){
	MOVF       _clockWiseDirection+0, 0
	IORWF      _clockWiseDirection+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main21
;mainCode.c,151 :: 		PORTB.f0 = false;
	BCF        PORTB+0, 0
;mainCode.c,152 :: 		PORTB.f1 = true;
	BSF        PORTB+0, 1
;mainCode.c,153 :: 		}
	GOTO       L_main22
L_main21:
;mainCode.c,155 :: 		PORTB.f0 = true;
	BSF        PORTB+0, 0
;mainCode.c,156 :: 		PORTB.f1 = false;
	BCF        PORTB+0, 1
;mainCode.c,157 :: 		}
L_main22:
;mainCode.c,158 :: 		SSPCON.f5 = 0;
	BCF        SSPCON+0, 5
;mainCode.c,159 :: 		while(true){
L_main23:
;mainCode.c,160 :: 		potDutyCicle = ADC_Read();              //adquire o valor analógico de tensão do pino ra em binario
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _potDutyCicle+0
	MOVF       R0+1, 0
	MOVWF      _potDutyCicle+1
;mainCode.c,161 :: 		decScaleDutyCicle = floor((255L*potDutyCicle)/1024);
	MOVLW      0
	MOVWF      R0+2
	MOVWF      R0+3
	MOVLW      255
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      0
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      10
	MOVWF      R8+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       R8+0, 0
L__main45:
	BTFSC      STATUS+0, 2
	GOTO       L__main46
	RRF        R4+3, 1
	RRF        R4+2, 1
	RRF        R4+1, 1
	RRF        R4+0, 1
	BCF        R4+3, 7
	ADDLW      255
	GOTO       L__main45
L__main46:
	MOVF       R4+0, 0
	MOVWF      R0+0
	MOVF       R4+1, 0
	MOVWF      R0+1
	MOVF       R4+2, 0
	MOVWF      R0+2
	MOVF       R4+3, 0
	MOVWF      R0+3
	CALL       _longword2double+0
	MOVF       R0+0, 0
	MOVWF      FARG_floor_x+0
	MOVF       R0+1, 0
	MOVWF      FARG_floor_x+1
	MOVF       R0+2, 0
	MOVWF      FARG_floor_x+2
	MOVF       R0+3, 0
	MOVWF      FARG_floor_x+3
	CALL       _floor+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _decScaleDutyCicle+0
	MOVF       R0+1, 0
	MOVWF      _decScaleDutyCicle+1
;mainCode.c,163 :: 		while(!softStart){
L_main25:
	BTFSC      _softStart+0, BitPos(_softStart+0)
	GOTO       L_main26
;mainCode.c,165 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;mainCode.c,166 :: 		Lcd_Out(1, 2, "Partindo Motor");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_mainCode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;mainCode.c,168 :: 		for(i = 0; (i < decScaleDutyCicle) && (!softStart); i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main27:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _decScaleDutyCicle+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVF       _decScaleDutyCicle+0, 0
	SUBWF      _i+0, 0
L__main47:
	BTFSC      STATUS+0, 0
	GOTO       L_main28
	BTFSC      _softStart+0, BitPos(_softStart+0)
	GOTO       L_main28
L__main37:
;mainCode.c,169 :: 		PWM1_Set_Duty(i);
	MOVF       _i+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;mainCode.c,170 :: 		for(j = 0; j < ((100*softStarterTime)/decScaleDutyCicle); j++) Delay_ms(10);
	CLRF       _j+0
	CLRF       _j+1
L_main32:
	MOVF       _decScaleDutyCicle+0, 0
	MOVWF      R4+0
	MOVF       _decScaleDutyCicle+1, 0
	MOVWF      R4+1
	MOVLW      244
	MOVWF      R0+0
	MOVLW      1
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      128
	XORWF      _j+1, 0
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVF       R0+0, 0
	SUBWF      _j+0, 0
L__main48:
	BTFSC      STATUS+0, 0
	GOTO       L_main33
	MOVLW      4
	MOVWF      R12+0
	MOVLW      61
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
	NOP
	NOP
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
	GOTO       L_main32
L_main33:
;mainCode.c,168 :: 		for(i = 0; (i < decScaleDutyCicle) && (!softStart); i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;mainCode.c,171 :: 		}
	GOTO       L_main27
L_main28:
;mainCode.c,173 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;mainCode.c,174 :: 		softStart = true;
	BSF        _softStart+0, BitPos(_softStart+0)
;mainCode.c,176 :: 		Lcd_Cmd(_LCD_TURN_OFF);
	MOVLW      8
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;mainCode.c,177 :: 		Lcd_Cmd(_LCD_TURN_ON);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;mainCode.c,178 :: 		Lcd_Out(1, 1, "Duty:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr14_mainCode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;mainCode.c,179 :: 		}
	GOTO       L_main25
L_main26:
;mainCode.c,181 :: 		PWM1_Set_Duty(decScaleDutyCicle);
	MOVF       _decScaleDutyCicle+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;mainCode.c,183 :: 		IntToStr(floor((100L*decScaleDutyCicle/255)), txt1);
	MOVLW      100
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVLW      0
	MOVWF      R0+3
	MOVF       _decScaleDutyCicle+0, 0
	MOVWF      R4+0
	MOVF       _decScaleDutyCicle+1, 0
	MOVWF      R4+1
	MOVLW      0
	BTFSC      R4+1, 7
	MOVLW      255
	MOVWF      R4+2
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      255
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_S+0
	CALL       _longint2double+0
	MOVF       R0+0, 0
	MOVWF      FARG_floor_x+0
	MOVF       R0+1, 0
	MOVWF      FARG_floor_x+1
	MOVF       R0+2, 0
	MOVWF      FARG_floor_x+2
	MOVF       R0+3, 0
	MOVWF      FARG_floor_x+3
	CALL       _floor+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt1+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;mainCode.c,185 :: 		Lcd_Out(1, 6, txt1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;mainCode.c,187 :: 		if(!PORTA.f2){
	BTFSC      PORTA+0, 2
	GOTO       L_main36
;mainCode.c,188 :: 		PORTB.f0 = false;
	BCF        PORTB+0, 0
;mainCode.c,189 :: 		PORTB.f1 = false;
	BCF        PORTB+0, 1
;mainCode.c,190 :: 		break;
	GOTO       L_main24
;mainCode.c,191 :: 		}
L_main36:
;mainCode.c,192 :: 		}
	GOTO       L_main23
L_main24:
;mainCode.c,193 :: 		PWM1_Stop();
	CALL       _PWM1_Stop+0
;mainCode.c,194 :: 		}
L_main19:
;mainCode.c,195 :: 		}
	GOTO       L_main6
;mainCode.c,196 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
