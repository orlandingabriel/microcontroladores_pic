#line 1 "C:/Users/Administrador/Desktop/Trabalhos Luis - Gabriel/Multiplex 4 digitos/GrauB.c"
sbit LCD_RS at RE1_bit;
sbit LCD_EN at RE0_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISE1_bit;
sbit LCD_EN_Direction at TRISE0_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;

char segundo, minuto, aux, aux2, hora, dia, diasemana, mes;
char txt[7], contador, contador2, coluna, coluna2, coluna3, coluna4;
int valor, media, tensao, ano, cont;
int flag, i, lim, j;
const char character[] = {0,7,5,7,0,0,0,0};

 void CustomChar(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(64);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 0);
}



 void escrevemes(int num){
 if(num == 1){
 lcd_out(1,4,"JAN");
 }
 if(num == 2){
 lcd_out(1,4,"FEV");
 }
 if(num == 3){
 lcd_out(1,4,"MAR");
 }
 if(num == 4){
 lcd_out(1,4,"ABR");
 }
 if(num == 5){
 lcd_out(1,4,"MAI");
 }
 if(num == 6){
 lcd_out(1,4,"JUN");
 }
 if(num == 7){
 lcd_out(1,4,"JUL");
 }
 if(num == 8){
 lcd_out(1,4,"AGO");
 }
 if(num == 9){
 lcd_out(1,4,"SET");
 }
 if(num == 10){
 lcd_out(1,4,"OUT");
 }
 if(num == 11){
 lcd_out(1,4,"NOV");
 }
 if(num == 12){
 lcd_out(1,4,"DEZ");
 }
 }

 void interrupt(){
 if(tmr0if_bit==1){
 contador ++;
 if (contador == 76){
 segundo++;
 contador = 0;
 }
 tmr0if_bit=0;
 }
 }

 void temperatura(){
 valor = adc_read(1);
 media = media + valor;
 contador2 ++;
 if (contador2 == 20){
 tensao = media / contador2;
 contador2 = 0;
 media = 0;
 tensao = 5 * tensao * 100 / 1023 ;
 inttostr (tensao, txt);
 lcd_out(1,13,ltrim(txt));
 }
 }
 void escreveDigitosBasicos(){
 lcd_out(2,11, ":");
 lcd_out(2,14, ":");
 CustomChar(1,15);
 lcd_out(1,16,"C");
 lcd_out(1,3,"/");
 lcd_out(1,7,"/");
 }

 void escreveDigitosAlarme(){
 lcd_out(2,11, ":");
 lcd_out(2,14, ":");
 }
 void escreveDiaSemana(){

 if(diasemana == 1){
 lcd_out(2,1,"DOMINGO");
 }
 if(diasemana == 2){
 lcd_out(2,1,"SEGUNDA");
 }
 if(diasemana == 3){
 lcd_out(2,1,"TERCA  ");
 }
 if(diasemana == 4){
 lcd_out(2,1,"QUARTA ");
 }
 if(diasemana == 5){
 lcd_out(2,1,"QUINTA ");
 }
 if(diasemana == 6){
 lcd_out(2,1,"SEXTA  ");
 }
 if(diasemana == 7){
 lcd_out(2,1,"SABADO");
 }

 }
 void escreveRelogio(){

 if(segundo < 10){
 lcd_out(2,15,"0");
 coluna=16;
 }else
 coluna = 15;
 IntToStr(segundo,txt);
 lcd_out(2,coluna,Ltrim(txt));
 if(minuto < 10){
 lcd_out(2,12,"0");
 coluna2=13;
 }else
 coluna2 = 12;
 IntToStr(minuto,txt);
 lcd_out(2,coluna2,Ltrim(txt));
 if(hora < 10){
 lcd_out(2,9,"0");
 coluna3=10;
 }else
 coluna3 = 9;
 IntToStr(hora,txt);
 lcd_out(2,coluna3,Ltrim(txt));

 }
 int bissexto(int mes){
 if(mes == 1){
 lim = 32;
 }
 if(mes == 2){
 if(ano % 4 == 0){
 lim = 30;
 }
 else
 lim = 29;
 }
 if(mes == 3){
 lim = 32;
 }
 if(mes == 4){
 lim = 31;
 }
 if(mes == 5){
 lim = 32;
 }
 if(mes == 6){
 lim = 31;
 }
 if(mes == 7){
 lim = 32;
 }
 if(mes == 8){
 lim = 32;
 }
 if(mes == 9){
 lim = 31;
 }
 if(mes == 10){
 lim = 32;
 }
 if(mes == 11){
 lim = 31;
 }
 if(mes == 12){
 lim = 32;
 }
 return lim;
 }

void main() {
 adcon1 = 13;
 intcon2 = 0;
 intcon = 0;
 t0con = 0;
 tmr0on_bit = 1;
 psa_bit = 1;
 tmr0ie_bit = 1;
 gie_bit = 1;
 adc_init();
 trisa = 49;
 trisb = 15;
 trisc = 0;
 trisd = 0;
 porta = 0;
 portb = 0;
 portc = 0;
 portd = 0;
 lcd_init();
 lcd_cmd(_lcd_clear);
 lcd_cmd(_lcd_cursor_off);
 segundo = 0;
 minuto = 30;
 hora = 19;
 dia = 3;
 diasemana = 1;
 mes = 5;
 ano = 2017;
 contador = 0;
 contador2 = 0;
 media = 0;
 valor = 0;
 coluna = 15;
 coluna2 = 12;
 coluna3 = 9;
 coluna4 = 1;
 tensao = 0;
 flag = 0;
 cont = 0;
 escreveDigitosBasicos();
 for(i=0;i<=20;i++){
 temperatura();}

 for(;;){
 if(segundo % 1 == 0){
 temperatura();
 }
 escreveRelogio();

 lim = bissexto(mes);



 if(segundo == 60){
 minuto++;
 segundo = 0;
 }
 if(minuto == 60){
 minuto = 0;
 hora ++;
 }
 if(hora == 24){
 hora = 0;
 dia ++;
 diasemana++;
 }
 if(dia == lim){
 dia = 1;
 mes ++;
 }
 if(diasemana == 8){
 diasemana=1;
 }
 if(mes == 13){
 mes = 1;
 ano ++;
 }


 if(dia < 10){
 lcd_out(1,1,"0");
 coluna4 = 2;
 }else
 coluna4 = 1;
 IntToStr(dia,txt);
 lcd_out(1,coluna4,Ltrim(txt));

 escrevemes(mes);
 intToStr(ano,txt);
 lcd_out(1,8,Ltrim(txt));


 escreveDiaSemana();


 if(rb3_bit == 0){
 while(rb3_bit == 0)
 delay_ms(100);
 diasemana ++;
 dia ++;
 if(dia == lim){
 dia = 1;
 mes++;
 }
 }

 if(ra4_bit == 1){
 while(ra4_bit == 1)
 delay_ms(100);
 for(i = 0; i<lim-1;i++){
 dia++;
 diasemana++;
 if(dia == lim){
 mes ++;
 dia = 1;
 }
 if(diasemana == 8){
 diasemana = 1;
 }
 if(mes == 13){
 mes = 1;
 ano++;
 }
 }
 }

 if(ra5_bit == 1){
 while(ra5_bit == 1)
 delay_ms(100);
 if(ano%4 != 0){
 ano++;
 diasemana++;
 }
 else
 {
 ano++;
 diasemana = diasemana+2;
 }
 }
 if(rb1_bit == 0){
 while(rb1_bit == 0)
 delay_ms(100);
 hora ++;
 if(hora == 24){
 hora = 0;
 dia++;
 diasemana++;
 }
 }

 if(rb2_bit == 0){
 while(rb2_bit == 0)
 delay_ms(100);
 minuto ++;
 if(minuto == 60){
 minuto = 0;
 hora++;
 }
 }

 if(rb0_bit == 0){
 lcd_cmd(_lcd_clear);
 lcd_out(1,1,"Modo Alarme");
 delay_ms(1500);
 lcd_cmd(_lcd_clear);
 escreveRelogio();
 escreveDigitosAlarme();
 delay_ms(1500);
 while (cont<2){
 }
 if(rb1_bit == 1){
 while(rb1_bit == 0)
 delay_ms(100);
 hora ++;
 if(hora == 24){
 hora = 0;
 dia++;
 diasemana++;
 }
 }

 if(rb2_bit == 0){
 while(rb2_bit == 0)
 delay_ms(100);
 minuto ++;
 if(minuto == 60){
 minuto = 0;
 hora++;
 }
 }
 }


 }
}
