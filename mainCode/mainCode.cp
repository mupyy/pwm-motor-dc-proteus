#line 1 "G:/Other computers/driveE/Drive/studies/fatec/2024_first_semester/courses/appliedPrograming/motorProject/mainCode/mainCode.c"
#line 21 "G:/Other computers/driveE/Drive/studies/fatec/2024_first_semester/courses/appliedPrograming/motorProject/mainCode/mainCode.c"
sbit LCD_RS at RD0_bit;
sbit LCD_EN at RD1_bit;
sbit LCD_D4 at RD2_bit;
sbit LCD_D5 at RD3_bit;
sbit LCD_D6 at RD4_bit;
sbit LCD_D7 at RD5_bit;


sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD2_bit;
sbit LCD_D5_Direction at TRISD3_bit;
sbit LCD_D6_Direction at TRISD4_bit;
sbit LCD_D7_Direction at TRISD5_bit;






const int debounceTime = 50;
const int softStarterTime = 5;

unsigned int potDutyCicle; decDutyCicle; decScaleDutyCicle; i; j; res; clockWiseDirection;

 bit softStart; flag0;

char txt0[] = "1234";
char txt1[] = "123456";

void configMain(){
 SSPCON.f5 = 0;

 Lcd_Init();

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, "Inicio");
 Lcd_Out(2, 1, "do Programa");
 Delay_ms(100);

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Carregando");
 Lcd_Out(2, 1, "Configuracoes");
 Delay_ms(100);

 TRISA = 0b11111111;

 ADCON1 = 0b11001110;
 ADCON0 = 0b10000000;
 TRISA = 0b11111111;

 TRISB = 0b11111100;
 PORTB = 0b00000000;
 INTCON.f4 = 0;

 TRISC = 0b11111011;
 PORTC = 0b00000000;

 SSPCON.f5 = 0;

 PWM1_Init(500);

 TRISD.f7 = 0;
 PORTD.f7 = 0;
 PORTD.f7 = 1;

 SSPCON.f5 = 0;
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Configuracoes");
 Lcd_Out(2, 1, "Carregadas");
 Delay_ms(100);
 Lcd_Cmd(_LCD_CLEAR);
 SSPCON.f5 = 0;

 clockWiseDirection = PORTA.f3;

 flag0 =  0 ;
}
unsigned int ADC_Read(){
 unsigned int adcvalue;

 ADCON1 = 0b11001110;
 Delay_us(1000);
 ADCON0 = 0b10000101;
 while(ADCON0.f2);
 adcvalue = ((ADRESH<<8)|(ADRESL));
 return adcvalue;
}
void main() {


 configMain();

 while( 1 ){

 if (!clockWiseDirection) Lcd_Out(2, 1, "Horario");
 else Lcd_Out(2, 1, "Antihorario");

 if(!PORTA.f3 && !flag0){
 Delay_ms(debounceTime);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2, 1, "Horario");

 clockWiseDirection =  0 ;
 flag0 =  1 ;
 }
 else if (PORTA.f3 && flag0){
 Delay_ms(debounceTime);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(2, 1, "AntiHorario");

 clockWiseDirection =  1 ;
 flag0 =  0 ;
 }
 potDutyCicle = ADC_Read();
 decScaleDutyCicle = floor((255L*potDutyCicle)/1024);
 IntToStr(floor((100L*decScaleDutyCicle/255)), txt0);

 Lcd_Out(1, 7, strcat(txt0,"%"));
 Lcd_Out(1, 1, "Soft:");

 if (!PORTA.f1){
 Delay_ms(debounceTime);

 PWM1_Set_Duty(0);
 PWM1_Start();
 softStart =  0 ;

 if (clockWiseDirection){
 PORTB.f0 =  0 ;
 PORTB.f1 =  1 ;
 }
 else{
 PORTB.f0 =  1 ;
 PORTB.f1 =  0 ;
 }
 SSPCON.f5 = 0;
 while( 1 ){
 potDutyCicle = ADC_Read();
 decScaleDutyCicle = floor((255L*potDutyCicle)/1024);

 while(!softStart){

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 2, "Partindo Motor");

 for(i = 0; (i < decScaleDutyCicle) && (!softStart); i++) {
 PWM1_Set_Duty(i);
 for(j = 0; j < ((100*softStarterTime)/decScaleDutyCicle); j++) Delay_ms(10);
 }

 Lcd_Cmd(_LCD_CLEAR);
 softStart =  1 ;

 Lcd_Cmd(_LCD_TURN_OFF);
 Lcd_Cmd(_LCD_TURN_ON);
 Lcd_Out(1, 1, "Duty:");
 }

 PWM1_Set_Duty(decScaleDutyCicle);

 IntToStr(floor((100L*decScaleDutyCicle/255)), txt1);

 Lcd_Out(1, 6, txt1);

 if(!PORTA.f2){
 PORTB.f0 =  0 ;
 PORTB.f1 =  0 ;
 break;
 }
 }
 PWM1_Stop();
 }
 }
}
