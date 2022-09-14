
_CustomChar:

;GrauB.c,21 :: 		void CustomChar(char pos_row, char pos_char) {
;GrauB.c,23 :: 		Lcd_Cmd(64);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;GrauB.c,24 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
	CLRF        CustomChar_i_L0+0 
L_CustomChar0:
	MOVF        CustomChar_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar1
	MOVLW       _character+0
	ADDWF       CustomChar_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_character+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_character+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar_i_L0+0, 1 
	GOTO        L_CustomChar0
L_CustomChar1:
;GrauB.c,25 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;GrauB.c,26 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF        FARG_CustomChar_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_CustomChar_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;GrauB.c,27 :: 		}
L_end_CustomChar:
	RETURN      0
; end of _CustomChar

_escrevemes:

;GrauB.c,31 :: 		void escrevemes(int num){
;GrauB.c,32 :: 		if(num == 1){
	MOVLW       0
	XORWF       FARG_escrevemes_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escrevemes108
	MOVLW       1
	XORWF       FARG_escrevemes_num+0, 0 
L__escrevemes108:
	BTFSS       STATUS+0, 2 
	GOTO        L_escrevemes3
;GrauB.c,33 :: 		lcd_out(1,4,"JAN");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,34 :: 		}
L_escrevemes3:
;GrauB.c,35 :: 		if(num == 2){
	MOVLW       0
	XORWF       FARG_escrevemes_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escrevemes109
	MOVLW       2
	XORWF       FARG_escrevemes_num+0, 0 
L__escrevemes109:
	BTFSS       STATUS+0, 2 
	GOTO        L_escrevemes4
;GrauB.c,36 :: 		lcd_out(1,4,"FEV");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,37 :: 		}
L_escrevemes4:
;GrauB.c,38 :: 		if(num == 3){
	MOVLW       0
	XORWF       FARG_escrevemes_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escrevemes110
	MOVLW       3
	XORWF       FARG_escrevemes_num+0, 0 
L__escrevemes110:
	BTFSS       STATUS+0, 2 
	GOTO        L_escrevemes5
;GrauB.c,39 :: 		lcd_out(1,4,"MAR");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,40 :: 		}
L_escrevemes5:
;GrauB.c,41 :: 		if(num == 4){
	MOVLW       0
	XORWF       FARG_escrevemes_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escrevemes111
	MOVLW       4
	XORWF       FARG_escrevemes_num+0, 0 
L__escrevemes111:
	BTFSS       STATUS+0, 2 
	GOTO        L_escrevemes6
;GrauB.c,42 :: 		lcd_out(1,4,"ABR");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,43 :: 		}
L_escrevemes6:
;GrauB.c,44 :: 		if(num == 5){
	MOVLW       0
	XORWF       FARG_escrevemes_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escrevemes112
	MOVLW       5
	XORWF       FARG_escrevemes_num+0, 0 
L__escrevemes112:
	BTFSS       STATUS+0, 2 
	GOTO        L_escrevemes7
;GrauB.c,45 :: 		lcd_out(1,4,"MAI");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,46 :: 		}
L_escrevemes7:
;GrauB.c,47 :: 		if(num == 6){
	MOVLW       0
	XORWF       FARG_escrevemes_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escrevemes113
	MOVLW       6
	XORWF       FARG_escrevemes_num+0, 0 
L__escrevemes113:
	BTFSS       STATUS+0, 2 
	GOTO        L_escrevemes8
;GrauB.c,48 :: 		lcd_out(1,4,"JUN");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,49 :: 		}
L_escrevemes8:
;GrauB.c,50 :: 		if(num == 7){
	MOVLW       0
	XORWF       FARG_escrevemes_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escrevemes114
	MOVLW       7
	XORWF       FARG_escrevemes_num+0, 0 
L__escrevemes114:
	BTFSS       STATUS+0, 2 
	GOTO        L_escrevemes9
;GrauB.c,51 :: 		lcd_out(1,4,"JUL");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,52 :: 		}
L_escrevemes9:
;GrauB.c,53 :: 		if(num == 8){
	MOVLW       0
	XORWF       FARG_escrevemes_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escrevemes115
	MOVLW       8
	XORWF       FARG_escrevemes_num+0, 0 
L__escrevemes115:
	BTFSS       STATUS+0, 2 
	GOTO        L_escrevemes10
;GrauB.c,54 :: 		lcd_out(1,4,"AGO");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,55 :: 		}
L_escrevemes10:
;GrauB.c,56 :: 		if(num == 9){
	MOVLW       0
	XORWF       FARG_escrevemes_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escrevemes116
	MOVLW       9
	XORWF       FARG_escrevemes_num+0, 0 
L__escrevemes116:
	BTFSS       STATUS+0, 2 
	GOTO        L_escrevemes11
;GrauB.c,57 :: 		lcd_out(1,4,"SET");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,58 :: 		}
L_escrevemes11:
;GrauB.c,59 :: 		if(num == 10){
	MOVLW       0
	XORWF       FARG_escrevemes_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escrevemes117
	MOVLW       10
	XORWF       FARG_escrevemes_num+0, 0 
L__escrevemes117:
	BTFSS       STATUS+0, 2 
	GOTO        L_escrevemes12
;GrauB.c,60 :: 		lcd_out(1,4,"OUT");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr10_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr10_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,61 :: 		}
L_escrevemes12:
;GrauB.c,62 :: 		if(num == 11){
	MOVLW       0
	XORWF       FARG_escrevemes_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escrevemes118
	MOVLW       11
	XORWF       FARG_escrevemes_num+0, 0 
L__escrevemes118:
	BTFSS       STATUS+0, 2 
	GOTO        L_escrevemes13
;GrauB.c,63 :: 		lcd_out(1,4,"NOV");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr11_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr11_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,64 :: 		}
L_escrevemes13:
;GrauB.c,65 :: 		if(num == 12){
	MOVLW       0
	XORWF       FARG_escrevemes_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__escrevemes119
	MOVLW       12
	XORWF       FARG_escrevemes_num+0, 0 
L__escrevemes119:
	BTFSS       STATUS+0, 2 
	GOTO        L_escrevemes14
;GrauB.c,66 :: 		lcd_out(1,4,"DEZ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr12_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr12_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,67 :: 		}
L_escrevemes14:
;GrauB.c,68 :: 		}
L_end_escrevemes:
	RETURN      0
; end of _escrevemes

_interrupt:

;GrauB.c,70 :: 		void interrupt(){
;GrauB.c,71 :: 		if(tmr0if_bit==1){//se tmr0 if==1, ocorreu uma interrupção
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_interrupt15
;GrauB.c,72 :: 		contador ++;
	INCF        _contador+0, 1 
;GrauB.c,73 :: 		if (contador == 76){ // passou 1 segundo
	MOVF        _contador+0, 0 
	XORLW       76
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt16
;GrauB.c,74 :: 		segundo++;
	INCF        _segundo+0, 1 
;GrauB.c,75 :: 		contador = 0;
	CLRF        _contador+0 
;GrauB.c,76 :: 		}
L_interrupt16:
;GrauB.c,77 :: 		tmr0if_bit=0; // desliga os sinalizadores da interrupção tmr0
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;GrauB.c,78 :: 		}
L_interrupt15:
;GrauB.c,79 :: 		}
L_end_interrupt:
L__interrupt121:
	RETFIE      1
; end of _interrupt

_temperatura:

;GrauB.c,81 :: 		void temperatura(){
;GrauB.c,82 :: 		valor = adc_read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _valor+0 
	MOVF        R1, 0 
	MOVWF       _valor+1 
;GrauB.c,83 :: 		media = media + valor;
	MOVF        R0, 0 
	ADDWF       _media+0, 1 
	MOVF        R1, 0 
	ADDWFC      _media+1, 1 
;GrauB.c,84 :: 		contador2 ++;
	INCF        _contador2+0, 1 
;GrauB.c,85 :: 		if (contador2 == 20){
	MOVF        _contador2+0, 0 
	XORLW       20
	BTFSS       STATUS+0, 2 
	GOTO        L_temperatura17
;GrauB.c,86 :: 		tensao = media / contador2;
	MOVF        _contador2+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _media+0, 0 
	MOVWF       R0 
	MOVF        _media+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       _tensao+0 
	MOVF        R1, 0 
	MOVWF       _tensao+1 
;GrauB.c,87 :: 		contador2 = 0;
	CLRF        _contador2+0 
;GrauB.c,88 :: 		media = 0;
	CLRF        _media+0 
	CLRF        _media+1 
;GrauB.c,89 :: 		tensao = 5 * tensao * 100 / 1023 ;
	MOVLW       5
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       255
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       _tensao+0 
	MOVF        R1, 0 
	MOVWF       _tensao+1 
;GrauB.c,90 :: 		inttostr (tensao, txt);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;GrauB.c,91 :: 		lcd_out(1,13,ltrim(txt));
	MOVLW       _txt+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;GrauB.c,92 :: 		}
L_temperatura17:
;GrauB.c,93 :: 		}
L_end_temperatura:
	RETURN      0
; end of _temperatura

_escreveDigitosBasicos:

;GrauB.c,94 :: 		void escreveDigitosBasicos(){
;GrauB.c,95 :: 		lcd_out(2,11, ":");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr13_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr13_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,96 :: 		lcd_out(2,14, ":");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr14_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr14_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,97 :: 		CustomChar(1,15);
	MOVLW       1
	MOVWF       FARG_CustomChar_pos_row+0 
	MOVLW       15
	MOVWF       FARG_CustomChar_pos_char+0 
	CALL        _CustomChar+0, 0
;GrauB.c,98 :: 		lcd_out(1,16,"C");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       16
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr15_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr15_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,99 :: 		lcd_out(1,3,"/");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr16_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr16_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,100 :: 		lcd_out(1,7,"/");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr17_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr17_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,101 :: 		}
L_end_escreveDigitosBasicos:
	RETURN      0
; end of _escreveDigitosBasicos

_escreveDigitosAlarme:

;GrauB.c,103 :: 		void escreveDigitosAlarme(){
;GrauB.c,104 :: 		lcd_out(2,11, ":");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr18_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr18_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,105 :: 		lcd_out(2,14, ":");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr19_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr19_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,106 :: 		}
L_end_escreveDigitosAlarme:
	RETURN      0
; end of _escreveDigitosAlarme

_escreveDiaSemana:

;GrauB.c,107 :: 		void escreveDiaSemana(){
;GrauB.c,109 :: 		if(diasemana == 1){
	MOVF        _diasemana+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_escreveDiaSemana18
;GrauB.c,110 :: 		lcd_out(2,1,"DOMINGO");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr20_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr20_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,111 :: 		}
L_escreveDiaSemana18:
;GrauB.c,112 :: 		if(diasemana == 2){
	MOVF        _diasemana+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_escreveDiaSemana19
;GrauB.c,113 :: 		lcd_out(2,1,"SEGUNDA");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr21_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr21_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,114 :: 		}
L_escreveDiaSemana19:
;GrauB.c,115 :: 		if(diasemana == 3){
	MOVF        _diasemana+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_escreveDiaSemana20
;GrauB.c,116 :: 		lcd_out(2,1,"TERCA  ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr22_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr22_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,117 :: 		}
L_escreveDiaSemana20:
;GrauB.c,118 :: 		if(diasemana == 4){
	MOVF        _diasemana+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_escreveDiaSemana21
;GrauB.c,119 :: 		lcd_out(2,1,"QUARTA ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr23_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr23_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,120 :: 		}
L_escreveDiaSemana21:
;GrauB.c,121 :: 		if(diasemana == 5){
	MOVF        _diasemana+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_escreveDiaSemana22
;GrauB.c,122 :: 		lcd_out(2,1,"QUINTA ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr24_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr24_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,123 :: 		}
L_escreveDiaSemana22:
;GrauB.c,124 :: 		if(diasemana == 6){
	MOVF        _diasemana+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_escreveDiaSemana23
;GrauB.c,125 :: 		lcd_out(2,1,"SEXTA  ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr25_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr25_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,126 :: 		}
L_escreveDiaSemana23:
;GrauB.c,127 :: 		if(diasemana == 7){
	MOVF        _diasemana+0, 0 
	XORLW       7
	BTFSS       STATUS+0, 2 
	GOTO        L_escreveDiaSemana24
;GrauB.c,128 :: 		lcd_out(2,1,"SABADO");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr26_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr26_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,129 :: 		}
L_escreveDiaSemana24:
;GrauB.c,131 :: 		}
L_end_escreveDiaSemana:
	RETURN      0
; end of _escreveDiaSemana

_escreveRelogio:

;GrauB.c,132 :: 		void escreveRelogio(){
;GrauB.c,134 :: 		if(segundo < 10){
	MOVLW       10
	SUBWF       _segundo+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_escreveRelogio25
;GrauB.c,135 :: 		lcd_out(2,15,"0");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr27_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr27_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,136 :: 		coluna=16;
	MOVLW       16
	MOVWF       _coluna+0 
;GrauB.c,137 :: 		}else
	GOTO        L_escreveRelogio26
L_escreveRelogio25:
;GrauB.c,138 :: 		coluna = 15;
	MOVLW       15
	MOVWF       _coluna+0 
L_escreveRelogio26:
;GrauB.c,139 :: 		IntToStr(segundo,txt);
	MOVF        _segundo+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;GrauB.c,140 :: 		lcd_out(2,coluna,Ltrim(txt));
	MOVLW       _txt+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVF        _coluna+0, 0 
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;GrauB.c,141 :: 		if(minuto < 10){
	MOVLW       10
	SUBWF       _minuto+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_escreveRelogio27
;GrauB.c,142 :: 		lcd_out(2,12,"0");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr28_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr28_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,143 :: 		coluna2=13;
	MOVLW       13
	MOVWF       _coluna2+0 
;GrauB.c,144 :: 		}else
	GOTO        L_escreveRelogio28
L_escreveRelogio27:
;GrauB.c,145 :: 		coluna2 = 12;
	MOVLW       12
	MOVWF       _coluna2+0 
L_escreveRelogio28:
;GrauB.c,146 :: 		IntToStr(minuto,txt);
	MOVF        _minuto+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;GrauB.c,147 :: 		lcd_out(2,coluna2,Ltrim(txt));
	MOVLW       _txt+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVF        _coluna2+0, 0 
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;GrauB.c,148 :: 		if(hora < 10){
	MOVLW       10
	SUBWF       _hora+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_escreveRelogio29
;GrauB.c,149 :: 		lcd_out(2,9,"0");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr29_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr29_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,150 :: 		coluna3=10;
	MOVLW       10
	MOVWF       _coluna3+0 
;GrauB.c,151 :: 		}else
	GOTO        L_escreveRelogio30
L_escreveRelogio29:
;GrauB.c,152 :: 		coluna3 = 9;
	MOVLW       9
	MOVWF       _coluna3+0 
L_escreveRelogio30:
;GrauB.c,153 :: 		IntToStr(hora,txt);
	MOVF        _hora+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;GrauB.c,154 :: 		lcd_out(2,coluna3,Ltrim(txt));
	MOVLW       _txt+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVF        _coluna3+0, 0 
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;GrauB.c,156 :: 		}
L_end_escreveRelogio:
	RETURN      0
; end of _escreveRelogio

_bissexto:

;GrauB.c,157 :: 		int bissexto(int mes){
;GrauB.c,158 :: 		if(mes == 1){
	MOVLW       0
	XORWF       FARG_bissexto_mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__bissexto128
	MOVLW       1
	XORWF       FARG_bissexto_mes+0, 0 
L__bissexto128:
	BTFSS       STATUS+0, 2 
	GOTO        L_bissexto31
;GrauB.c,159 :: 		lim = 32;
	MOVLW       32
	MOVWF       _lim+0 
	MOVLW       0
	MOVWF       _lim+1 
;GrauB.c,160 :: 		}
L_bissexto31:
;GrauB.c,161 :: 		if(mes == 2){
	MOVLW       0
	XORWF       FARG_bissexto_mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__bissexto129
	MOVLW       2
	XORWF       FARG_bissexto_mes+0, 0 
L__bissexto129:
	BTFSS       STATUS+0, 2 
	GOTO        L_bissexto32
;GrauB.c,162 :: 		if(ano % 4 == 0){
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _ano+0, 0 
	MOVWF       R0 
	MOVF        _ano+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__bissexto130
	MOVLW       0
	XORWF       R0, 0 
L__bissexto130:
	BTFSS       STATUS+0, 2 
	GOTO        L_bissexto33
;GrauB.c,163 :: 		lim = 30;
	MOVLW       30
	MOVWF       _lim+0 
	MOVLW       0
	MOVWF       _lim+1 
;GrauB.c,164 :: 		}
	GOTO        L_bissexto34
L_bissexto33:
;GrauB.c,166 :: 		lim = 29;
	MOVLW       29
	MOVWF       _lim+0 
	MOVLW       0
	MOVWF       _lim+1 
L_bissexto34:
;GrauB.c,167 :: 		}
L_bissexto32:
;GrauB.c,168 :: 		if(mes == 3){
	MOVLW       0
	XORWF       FARG_bissexto_mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__bissexto131
	MOVLW       3
	XORWF       FARG_bissexto_mes+0, 0 
L__bissexto131:
	BTFSS       STATUS+0, 2 
	GOTO        L_bissexto35
;GrauB.c,169 :: 		lim = 32;
	MOVLW       32
	MOVWF       _lim+0 
	MOVLW       0
	MOVWF       _lim+1 
;GrauB.c,170 :: 		}
L_bissexto35:
;GrauB.c,171 :: 		if(mes == 4){
	MOVLW       0
	XORWF       FARG_bissexto_mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__bissexto132
	MOVLW       4
	XORWF       FARG_bissexto_mes+0, 0 
L__bissexto132:
	BTFSS       STATUS+0, 2 
	GOTO        L_bissexto36
;GrauB.c,172 :: 		lim = 31;
	MOVLW       31
	MOVWF       _lim+0 
	MOVLW       0
	MOVWF       _lim+1 
;GrauB.c,173 :: 		}
L_bissexto36:
;GrauB.c,174 :: 		if(mes == 5){
	MOVLW       0
	XORWF       FARG_bissexto_mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__bissexto133
	MOVLW       5
	XORWF       FARG_bissexto_mes+0, 0 
L__bissexto133:
	BTFSS       STATUS+0, 2 
	GOTO        L_bissexto37
;GrauB.c,175 :: 		lim = 32;
	MOVLW       32
	MOVWF       _lim+0 
	MOVLW       0
	MOVWF       _lim+1 
;GrauB.c,176 :: 		}
L_bissexto37:
;GrauB.c,177 :: 		if(mes == 6){
	MOVLW       0
	XORWF       FARG_bissexto_mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__bissexto134
	MOVLW       6
	XORWF       FARG_bissexto_mes+0, 0 
L__bissexto134:
	BTFSS       STATUS+0, 2 
	GOTO        L_bissexto38
;GrauB.c,178 :: 		lim = 31;
	MOVLW       31
	MOVWF       _lim+0 
	MOVLW       0
	MOVWF       _lim+1 
;GrauB.c,179 :: 		}
L_bissexto38:
;GrauB.c,180 :: 		if(mes == 7){
	MOVLW       0
	XORWF       FARG_bissexto_mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__bissexto135
	MOVLW       7
	XORWF       FARG_bissexto_mes+0, 0 
L__bissexto135:
	BTFSS       STATUS+0, 2 
	GOTO        L_bissexto39
;GrauB.c,181 :: 		lim = 32;
	MOVLW       32
	MOVWF       _lim+0 
	MOVLW       0
	MOVWF       _lim+1 
;GrauB.c,182 :: 		}
L_bissexto39:
;GrauB.c,183 :: 		if(mes == 8){
	MOVLW       0
	XORWF       FARG_bissexto_mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__bissexto136
	MOVLW       8
	XORWF       FARG_bissexto_mes+0, 0 
L__bissexto136:
	BTFSS       STATUS+0, 2 
	GOTO        L_bissexto40
;GrauB.c,184 :: 		lim = 32;
	MOVLW       32
	MOVWF       _lim+0 
	MOVLW       0
	MOVWF       _lim+1 
;GrauB.c,185 :: 		}
L_bissexto40:
;GrauB.c,186 :: 		if(mes == 9){
	MOVLW       0
	XORWF       FARG_bissexto_mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__bissexto137
	MOVLW       9
	XORWF       FARG_bissexto_mes+0, 0 
L__bissexto137:
	BTFSS       STATUS+0, 2 
	GOTO        L_bissexto41
;GrauB.c,187 :: 		lim = 31;
	MOVLW       31
	MOVWF       _lim+0 
	MOVLW       0
	MOVWF       _lim+1 
;GrauB.c,188 :: 		}
L_bissexto41:
;GrauB.c,189 :: 		if(mes == 10){
	MOVLW       0
	XORWF       FARG_bissexto_mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__bissexto138
	MOVLW       10
	XORWF       FARG_bissexto_mes+0, 0 
L__bissexto138:
	BTFSS       STATUS+0, 2 
	GOTO        L_bissexto42
;GrauB.c,190 :: 		lim = 32;
	MOVLW       32
	MOVWF       _lim+0 
	MOVLW       0
	MOVWF       _lim+1 
;GrauB.c,191 :: 		}
L_bissexto42:
;GrauB.c,192 :: 		if(mes == 11){
	MOVLW       0
	XORWF       FARG_bissexto_mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__bissexto139
	MOVLW       11
	XORWF       FARG_bissexto_mes+0, 0 
L__bissexto139:
	BTFSS       STATUS+0, 2 
	GOTO        L_bissexto43
;GrauB.c,193 :: 		lim = 31;
	MOVLW       31
	MOVWF       _lim+0 
	MOVLW       0
	MOVWF       _lim+1 
;GrauB.c,194 :: 		}
L_bissexto43:
;GrauB.c,195 :: 		if(mes == 12){
	MOVLW       0
	XORWF       FARG_bissexto_mes+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__bissexto140
	MOVLW       12
	XORWF       FARG_bissexto_mes+0, 0 
L__bissexto140:
	BTFSS       STATUS+0, 2 
	GOTO        L_bissexto44
;GrauB.c,196 :: 		lim = 32;
	MOVLW       32
	MOVWF       _lim+0 
	MOVLW       0
	MOVWF       _lim+1 
;GrauB.c,197 :: 		}
L_bissexto44:
;GrauB.c,198 :: 		return lim;
	MOVF        _lim+0, 0 
	MOVWF       R0 
	MOVF        _lim+1, 0 
	MOVWF       R1 
;GrauB.c,199 :: 		}
L_end_bissexto:
	RETURN      0
; end of _bissexto

_main:

;GrauB.c,201 :: 		void main() {
;GrauB.c,202 :: 		adcon1 = 13;    //2 canais analogicos
	MOVLW       13
	MOVWF       ADCON1+0 
;GrauB.c,203 :: 		intcon2 = 0;    //resistores pull up port b
	CLRF        INTCON2+0 
;GrauB.c,204 :: 		intcon = 0;     //desliga todas as interrupções
	CLRF        INTCON+0 
;GrauB.c,205 :: 		t0con = 0;      //desliga todos os controles do tmr0
	CLRF        T0CON+0 
;GrauB.c,206 :: 		tmr0on_bit = 1; // liga o tmr 0
	BSF         TMR0ON_bit+0, BitPos(TMR0ON_bit+0) 
;GrauB.c,207 :: 		psa_bit = 1;    //desliga o prescaler
	BSF         PSA_bit+0, BitPos(PSA_bit+0) 
;GrauB.c,208 :: 		tmr0ie_bit = 1; //liga interrupção do tmr0
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;GrauB.c,209 :: 		gie_bit = 1;    //liga o sistema de interrupções
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;GrauB.c,210 :: 		adc_init();     //inicializa o conversor ad
	CALL        _ADC_Init+0, 0
;GrauB.c,211 :: 		trisa = 49;     //ra4, ra5 como entrada
	MOVLW       49
	MOVWF       TRISA+0 
;GrauB.c,212 :: 		trisb = 15;     //rb3,2,1,0 como entrada
	MOVLW       15
	MOVWF       TRISB+0 
;GrauB.c,213 :: 		trisc = 0;      //portc como saida
	CLRF        TRISC+0 
;GrauB.c,214 :: 		trisd = 0;      //
	CLRF        TRISD+0 
;GrauB.c,215 :: 		porta = 0;      //coeficiente de cagaço
	CLRF        PORTA+0 
;GrauB.c,216 :: 		portb = 0;      //
	CLRF        PORTB+0 
;GrauB.c,217 :: 		portc = 0;      //
	CLRF        PORTC+0 
;GrauB.c,218 :: 		portd = 0;      //
	CLRF        PORTD+0 
;GrauB.c,219 :: 		lcd_init();                //inicia o lcd
	CALL        _Lcd_Init+0, 0
;GrauB.c,220 :: 		lcd_cmd(_lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;GrauB.c,221 :: 		lcd_cmd(_lcd_cursor_off);  //desliga o cursor
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;GrauB.c,222 :: 		segundo = 0;
	CLRF        _segundo+0 
;GrauB.c,223 :: 		minuto = 30;
	MOVLW       30
	MOVWF       _minuto+0 
;GrauB.c,224 :: 		hora = 19;
	MOVLW       19
	MOVWF       _hora+0 
;GrauB.c,225 :: 		dia = 3;
	MOVLW       3
	MOVWF       _dia+0 
;GrauB.c,226 :: 		diasemana = 1;
	MOVLW       1
	MOVWF       _diasemana+0 
;GrauB.c,227 :: 		mes = 5;
	MOVLW       5
	MOVWF       _mes+0 
;GrauB.c,228 :: 		ano = 2017;
	MOVLW       225
	MOVWF       _ano+0 
	MOVLW       7
	MOVWF       _ano+1 
;GrauB.c,229 :: 		contador = 0;
	CLRF        _contador+0 
;GrauB.c,230 :: 		contador2 = 0;
	CLRF        _contador2+0 
;GrauB.c,231 :: 		media = 0;
	CLRF        _media+0 
	CLRF        _media+1 
;GrauB.c,232 :: 		valor = 0;
	CLRF        _valor+0 
	CLRF        _valor+1 
;GrauB.c,233 :: 		coluna = 15;
	MOVLW       15
	MOVWF       _coluna+0 
;GrauB.c,234 :: 		coluna2 = 12;
	MOVLW       12
	MOVWF       _coluna2+0 
;GrauB.c,235 :: 		coluna3 = 9;
	MOVLW       9
	MOVWF       _coluna3+0 
;GrauB.c,236 :: 		coluna4 = 1;
	MOVLW       1
	MOVWF       _coluna4+0 
;GrauB.c,237 :: 		tensao = 0;
	CLRF        _tensao+0 
	CLRF        _tensao+1 
;GrauB.c,238 :: 		flag = 0;
	CLRF        _flag+0 
	CLRF        _flag+1 
;GrauB.c,239 :: 		cont = 0;
	CLRF        _cont+0 
	CLRF        _cont+1 
;GrauB.c,240 :: 		escreveDigitosBasicos();
	CALL        _escreveDigitosBasicos+0, 0
;GrauB.c,241 :: 		for(i=0;i<=20;i++){ //mostra temperatura
	CLRF        _i+0 
	CLRF        _i+1 
L_main45:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _i+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main142
	MOVF        _i+0, 0 
	SUBLW       20
L__main142:
	BTFSS       STATUS+0, 0 
	GOTO        L_main46
;GrauB.c,242 :: 		temperatura();}
	CALL        _temperatura+0, 0
;GrauB.c,241 :: 		for(i=0;i<=20;i++){ //mostra temperatura
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;GrauB.c,242 :: 		temperatura();}
	GOTO        L_main45
L_main46:
;GrauB.c,244 :: 		for(;;){
L_main48:
;GrauB.c,246 :: 		temperatura();
	CALL        _temperatura+0, 0
;GrauB.c,248 :: 		escreveRelogio();
	CALL        _escreveRelogio+0, 0
;GrauB.c,250 :: 		lim = bissexto(mes);
	MOVF        _mes+0, 0 
	MOVWF       FARG_bissexto_mes+0 
	MOVLW       0
	MOVWF       FARG_bissexto_mes+1 
	CALL        _bissexto+0, 0
	MOVF        R0, 0 
	MOVWF       _lim+0 
	MOVF        R1, 0 
	MOVWF       _lim+1 
;GrauB.c,254 :: 		if(segundo == 60){
	MOVF        _segundo+0, 0 
	XORLW       60
	BTFSS       STATUS+0, 2 
	GOTO        L_main52
;GrauB.c,255 :: 		minuto++;
	INCF        _minuto+0, 1 
;GrauB.c,256 :: 		segundo = 0;
	CLRF        _segundo+0 
;GrauB.c,257 :: 		}
L_main52:
;GrauB.c,258 :: 		if(minuto == 60){
	MOVF        _minuto+0, 0 
	XORLW       60
	BTFSS       STATUS+0, 2 
	GOTO        L_main53
;GrauB.c,259 :: 		minuto = 0;
	CLRF        _minuto+0 
;GrauB.c,260 :: 		hora ++;
	INCF        _hora+0, 1 
;GrauB.c,261 :: 		}
L_main53:
;GrauB.c,262 :: 		if(hora == 24){
	MOVF        _hora+0, 0 
	XORLW       24
	BTFSS       STATUS+0, 2 
	GOTO        L_main54
;GrauB.c,263 :: 		hora = 0;
	CLRF        _hora+0 
;GrauB.c,264 :: 		dia ++;
	INCF        _dia+0, 1 
;GrauB.c,265 :: 		diasemana++;
	INCF        _diasemana+0, 1 
;GrauB.c,266 :: 		}
L_main54:
;GrauB.c,267 :: 		if(dia == lim){
	MOVLW       0
	XORWF       _lim+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main143
	MOVF        _lim+0, 0 
	XORWF       _dia+0, 0 
L__main143:
	BTFSS       STATUS+0, 2 
	GOTO        L_main55
;GrauB.c,268 :: 		dia = 1;
	MOVLW       1
	MOVWF       _dia+0 
;GrauB.c,269 :: 		mes ++;
	INCF        _mes+0, 1 
;GrauB.c,270 :: 		}
L_main55:
;GrauB.c,271 :: 		if(diasemana == 8){
	MOVF        _diasemana+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_main56
;GrauB.c,272 :: 		diasemana=1;
	MOVLW       1
	MOVWF       _diasemana+0 
;GrauB.c,273 :: 		}
L_main56:
;GrauB.c,274 :: 		if(mes == 13){
	MOVF        _mes+0, 0 
	XORLW       13
	BTFSS       STATUS+0, 2 
	GOTO        L_main57
;GrauB.c,275 :: 		mes = 1;
	MOVLW       1
	MOVWF       _mes+0 
;GrauB.c,276 :: 		ano ++;
	INFSNZ      _ano+0, 1 
	INCF        _ano+1, 1 
;GrauB.c,277 :: 		}
L_main57:
;GrauB.c,280 :: 		if(dia < 10){
	MOVLW       10
	SUBWF       _dia+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main58
;GrauB.c,281 :: 		lcd_out(1,1,"0");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr30_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr30_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,282 :: 		coluna4 = 2;
	MOVLW       2
	MOVWF       _coluna4+0 
;GrauB.c,283 :: 		}else
	GOTO        L_main59
L_main58:
;GrauB.c,284 :: 		coluna4 = 1;
	MOVLW       1
	MOVWF       _coluna4+0 
L_main59:
;GrauB.c,285 :: 		IntToStr(dia,txt);
	MOVF        _dia+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;GrauB.c,286 :: 		lcd_out(1,coluna4,Ltrim(txt));
	MOVLW       _txt+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVF        _coluna4+0, 0 
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;GrauB.c,288 :: 		escrevemes(mes);
	MOVF        _mes+0, 0 
	MOVWF       FARG_escrevemes_num+0 
	MOVLW       0
	MOVWF       FARG_escrevemes_num+1 
	CALL        _escrevemes+0, 0
;GrauB.c,289 :: 		intToStr(ano,txt);
	MOVF        _ano+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _ano+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;GrauB.c,290 :: 		lcd_out(1,8,Ltrim(txt));
	MOVLW       _txt+0
	MOVWF       FARG_Ltrim_string+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Ltrim_string+1 
	CALL        _Ltrim+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;GrauB.c,293 :: 		escreveDiaSemana();
	CALL        _escreveDiaSemana+0, 0
;GrauB.c,296 :: 		if(rb3_bit == 0){//ajuste do dia
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main60
;GrauB.c,297 :: 		while(rb3_bit == 0)
L_main61:
	BTFSC       RB3_bit+0, BitPos(RB3_bit+0) 
	GOTO        L_main62
;GrauB.c,298 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main63:
	DECFSZ      R13, 1, 1
	BRA         L_main63
	DECFSZ      R12, 1, 1
	BRA         L_main63
	DECFSZ      R11, 1, 1
	BRA         L_main63
	NOP
	NOP
	GOTO        L_main61
L_main62:
;GrauB.c,299 :: 		diasemana ++;
	INCF        _diasemana+0, 1 
;GrauB.c,300 :: 		dia ++;
	INCF        _dia+0, 1 
;GrauB.c,301 :: 		if(dia == lim){
	MOVLW       0
	XORWF       _lim+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main144
	MOVF        _lim+0, 0 
	XORWF       _dia+0, 0 
L__main144:
	BTFSS       STATUS+0, 2 
	GOTO        L_main64
;GrauB.c,302 :: 		dia = 1;
	MOVLW       1
	MOVWF       _dia+0 
;GrauB.c,303 :: 		mes++;
	INCF        _mes+0, 1 
;GrauB.c,304 :: 		}
L_main64:
;GrauB.c,305 :: 		}
L_main60:
;GrauB.c,307 :: 		if(ra4_bit == 1){//ajuste do mes
	BTFSS       RA4_bit+0, BitPos(RA4_bit+0) 
	GOTO        L_main65
;GrauB.c,308 :: 		while(ra4_bit == 1)
L_main66:
	BTFSS       RA4_bit+0, BitPos(RA4_bit+0) 
	GOTO        L_main67
;GrauB.c,309 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main68:
	DECFSZ      R13, 1, 1
	BRA         L_main68
	DECFSZ      R12, 1, 1
	BRA         L_main68
	DECFSZ      R11, 1, 1
	BRA         L_main68
	NOP
	NOP
	GOTO        L_main66
L_main67:
;GrauB.c,310 :: 		for(i = 0; i<lim-1;i++){
	CLRF        _i+0 
	CLRF        _i+1 
L_main69:
	MOVLW       1
	SUBWF       _lim+0, 0 
	MOVWF       R1 
	MOVLW       0
	SUBWFB      _lim+1, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main145
	MOVF        R1, 0 
	SUBWF       _i+0, 0 
L__main145:
	BTFSC       STATUS+0, 0 
	GOTO        L_main70
;GrauB.c,311 :: 		dia++;
	INCF        _dia+0, 1 
;GrauB.c,312 :: 		diasemana++;
	INCF        _diasemana+0, 1 
;GrauB.c,313 :: 		if(dia == lim){
	MOVLW       0
	XORWF       _lim+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main146
	MOVF        _lim+0, 0 
	XORWF       _dia+0, 0 
L__main146:
	BTFSS       STATUS+0, 2 
	GOTO        L_main72
;GrauB.c,314 :: 		mes ++;
	INCF        _mes+0, 1 
;GrauB.c,315 :: 		dia = 1;
	MOVLW       1
	MOVWF       _dia+0 
;GrauB.c,316 :: 		}
L_main72:
;GrauB.c,317 :: 		if(diasemana == 8){
	MOVF        _diasemana+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_main73
;GrauB.c,318 :: 		diasemana = 1;
	MOVLW       1
	MOVWF       _diasemana+0 
;GrauB.c,319 :: 		}
L_main73:
;GrauB.c,320 :: 		if(mes == 13){
	MOVF        _mes+0, 0 
	XORLW       13
	BTFSS       STATUS+0, 2 
	GOTO        L_main74
;GrauB.c,321 :: 		mes = 1;
	MOVLW       1
	MOVWF       _mes+0 
;GrauB.c,322 :: 		ano++;
	INFSNZ      _ano+0, 1 
	INCF        _ano+1, 1 
;GrauB.c,323 :: 		}
L_main74:
;GrauB.c,310 :: 		for(i = 0; i<lim-1;i++){
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;GrauB.c,324 :: 		}
	GOTO        L_main69
L_main70:
;GrauB.c,325 :: 		}
L_main65:
;GrauB.c,327 :: 		if(ra5_bit == 1){//ajuste do ano
	BTFSS       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L_main75
;GrauB.c,328 :: 		while(ra5_bit == 1)
L_main76:
	BTFSS       RA5_bit+0, BitPos(RA5_bit+0) 
	GOTO        L_main77
;GrauB.c,329 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main78:
	DECFSZ      R13, 1, 1
	BRA         L_main78
	DECFSZ      R12, 1, 1
	BRA         L_main78
	DECFSZ      R11, 1, 1
	BRA         L_main78
	NOP
	NOP
	GOTO        L_main76
L_main77:
;GrauB.c,330 :: 		if(ano%4 != 0){
	MOVLW       4
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _ano+0, 0 
	MOVWF       R0 
	MOVF        _ano+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main147
	MOVLW       0
	XORWF       R0, 0 
L__main147:
	BTFSC       STATUS+0, 2 
	GOTO        L_main79
;GrauB.c,331 :: 		ano++;
	INFSNZ      _ano+0, 1 
	INCF        _ano+1, 1 
;GrauB.c,332 :: 		diasemana++;
	INCF        _diasemana+0, 1 
;GrauB.c,333 :: 		}
	GOTO        L_main80
L_main79:
;GrauB.c,336 :: 		ano++;
	INFSNZ      _ano+0, 1 
	INCF        _ano+1, 1 
;GrauB.c,337 :: 		diasemana = diasemana+2;
	MOVLW       2
	ADDWF       _diasemana+0, 1 
;GrauB.c,338 :: 		}
L_main80:
;GrauB.c,339 :: 		}
L_main75:
;GrauB.c,340 :: 		if(rb1_bit == 0){//ajuste da hora
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main81
;GrauB.c,341 :: 		while(rb1_bit == 0)
L_main82:
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main83
;GrauB.c,342 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main84:
	DECFSZ      R13, 1, 1
	BRA         L_main84
	DECFSZ      R12, 1, 1
	BRA         L_main84
	DECFSZ      R11, 1, 1
	BRA         L_main84
	NOP
	NOP
	GOTO        L_main82
L_main83:
;GrauB.c,343 :: 		hora ++;
	INCF        _hora+0, 1 
;GrauB.c,344 :: 		if(hora == 24){
	MOVF        _hora+0, 0 
	XORLW       24
	BTFSS       STATUS+0, 2 
	GOTO        L_main85
;GrauB.c,345 :: 		hora = 0;
	CLRF        _hora+0 
;GrauB.c,346 :: 		dia++;
	INCF        _dia+0, 1 
;GrauB.c,347 :: 		diasemana++;
	INCF        _diasemana+0, 1 
;GrauB.c,348 :: 		}
L_main85:
;GrauB.c,349 :: 		}
L_main81:
;GrauB.c,351 :: 		if(rb2_bit == 0){//ajuste do minuto
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main86
;GrauB.c,352 :: 		while(rb2_bit == 0)
L_main87:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main88
;GrauB.c,353 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main89:
	DECFSZ      R13, 1, 1
	BRA         L_main89
	DECFSZ      R12, 1, 1
	BRA         L_main89
	DECFSZ      R11, 1, 1
	BRA         L_main89
	NOP
	NOP
	GOTO        L_main87
L_main88:
;GrauB.c,354 :: 		minuto ++;
	INCF        _minuto+0, 1 
;GrauB.c,355 :: 		if(minuto == 60){
	MOVF        _minuto+0, 0 
	XORLW       60
	BTFSS       STATUS+0, 2 
	GOTO        L_main90
;GrauB.c,356 :: 		minuto = 0;
	CLRF        _minuto+0 
;GrauB.c,357 :: 		hora++;
	INCF        _hora+0, 1 
;GrauB.c,358 :: 		}
L_main90:
;GrauB.c,359 :: 		}
L_main86:
;GrauB.c,361 :: 		if(rb0_bit == 0){//mensagem
	BTFSC       RB0_bit+0, BitPos(RB0_bit+0) 
	GOTO        L_main91
;GrauB.c,362 :: 		lcd_cmd(_lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;GrauB.c,363 :: 		lcd_out(1,1,"Modo Alarme");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr31_GrauB+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr31_GrauB+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;GrauB.c,364 :: 		delay_ms(1500);
	MOVLW       39
	MOVWF       R11, 0
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       38
	MOVWF       R13, 0
L_main92:
	DECFSZ      R13, 1, 1
	BRA         L_main92
	DECFSZ      R12, 1, 1
	BRA         L_main92
	DECFSZ      R11, 1, 1
	BRA         L_main92
	NOP
;GrauB.c,365 :: 		lcd_cmd(_lcd_clear);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;GrauB.c,366 :: 		escreveRelogio();
	CALL        _escreveRelogio+0, 0
;GrauB.c,367 :: 		escreveDigitosAlarme();
	CALL        _escreveDigitosAlarme+0, 0
;GrauB.c,368 :: 		delay_ms(1500);
	MOVLW       39
	MOVWF       R11, 0
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       38
	MOVWF       R13, 0
L_main93:
	DECFSZ      R13, 1, 1
	BRA         L_main93
	DECFSZ      R12, 1, 1
	BRA         L_main93
	DECFSZ      R11, 1, 1
	BRA         L_main93
	NOP
;GrauB.c,369 :: 		while (cont<2){
L_main94:
	MOVLW       128
	XORWF       _cont+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main148
	MOVLW       2
	SUBWF       _cont+0, 0 
L__main148:
	BTFSC       STATUS+0, 0 
	GOTO        L_main95
;GrauB.c,370 :: 		}
	GOTO        L_main94
L_main95:
;GrauB.c,371 :: 		if(rb1_bit == 1){//ajuste da hora
	BTFSS       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main96
;GrauB.c,372 :: 		while(rb1_bit == 0)
L_main97:
	BTFSC       RB1_bit+0, BitPos(RB1_bit+0) 
	GOTO        L_main98
;GrauB.c,373 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main99:
	DECFSZ      R13, 1, 1
	BRA         L_main99
	DECFSZ      R12, 1, 1
	BRA         L_main99
	DECFSZ      R11, 1, 1
	BRA         L_main99
	NOP
	NOP
	GOTO        L_main97
L_main98:
;GrauB.c,374 :: 		hora ++;
	INCF        _hora+0, 1 
;GrauB.c,375 :: 		if(hora == 24){
	MOVF        _hora+0, 0 
	XORLW       24
	BTFSS       STATUS+0, 2 
	GOTO        L_main100
;GrauB.c,376 :: 		hora = 0;
	CLRF        _hora+0 
;GrauB.c,377 :: 		dia++;
	INCF        _dia+0, 1 
;GrauB.c,378 :: 		diasemana++;
	INCF        _diasemana+0, 1 
;GrauB.c,379 :: 		}
L_main100:
;GrauB.c,380 :: 		}
L_main96:
;GrauB.c,382 :: 		if(rb2_bit == 0){//ajuste do minuto
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main101
;GrauB.c,383 :: 		while(rb2_bit == 0)
L_main102:
	BTFSC       RB2_bit+0, BitPos(RB2_bit+0) 
	GOTO        L_main103
;GrauB.c,384 :: 		delay_ms(100);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main104:
	DECFSZ      R13, 1, 1
	BRA         L_main104
	DECFSZ      R12, 1, 1
	BRA         L_main104
	DECFSZ      R11, 1, 1
	BRA         L_main104
	NOP
	NOP
	GOTO        L_main102
L_main103:
;GrauB.c,385 :: 		minuto ++;
	INCF        _minuto+0, 1 
;GrauB.c,386 :: 		if(minuto == 60){
	MOVF        _minuto+0, 0 
	XORLW       60
	BTFSS       STATUS+0, 2 
	GOTO        L_main105
;GrauB.c,387 :: 		minuto = 0;
	CLRF        _minuto+0 
;GrauB.c,388 :: 		hora++;
	INCF        _hora+0, 1 
;GrauB.c,389 :: 		}
L_main105:
;GrauB.c,390 :: 		}
L_main101:
;GrauB.c,391 :: 		}
L_main91:
;GrauB.c,394 :: 		}
	GOTO        L_main48
;GrauB.c,395 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
