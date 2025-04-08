 /*
Autor: Victor Mielitz 
�ltima atualiza��o: 26/05/2024

--------------------------------------------------------------------------------------------------------------------

C�digo referente ao Projeto da discassaiplina de Programa��o Aplicada � Automa��o - FATEC Prof. Hirant Sanazar

--------------------------------------------------------------------------------------------------------------------

        Descri��o Geral
    Este c�digo tem como objetivo o acionamento de um motor 12VDC, contendo, o controle de sua velocidade e sentido de rota��o. Ser�o utilizados
Drivers de Pot�ncia de MOSFETs a fim de atender a pot�ncia da carga e display de LCD a fim de visualizar alguns par�metros b�sico que estejam ocorrendo
ao motor enquanto em funcionamento.

--------------------------------------------------------------------------------------------------------------------

*/
//one line = 4uS
// Lcd pinout settings
sbit LCD_RS at RD0_bit;
sbit LCD_EN at RD1_bit;
sbit LCD_D4 at RD2_bit;
sbit LCD_D5 at RD3_bit;
sbit LCD_D6 at RD4_bit;
sbit LCD_D7 at RD5_bit;

// Pin direction
sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD2_bit;
sbit LCD_D5_Direction at TRISD3_bit;
sbit LCD_D6_Direction at TRISD4_bit;
sbit LCD_D7_Direction at TRISD5_bit;

#define true    1
#define false   0

//Declaração de Variáveis

const int   debounceTime = 50; /* ms */  
const int   softStarterTime = 5; /* s */

unsigned int    potDutyCicle; decDutyCicle; decScaleDutyCicle; i; j; res; clockWiseDirection;

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

    TRISA = 0b11111111;    //configura porta como entrada
    
    ADCON1 = 0b11001110;
    ADCON0 = 0b10000000;
     TRISA = 0b11111111; 

    TRISB = 0b11111100;   //configura portb.b0 e b1 como saida
    PORTB = 0b00000000;    //limpa data latchs do portb
    INTCON.f4 = 0;          //desabilitada funçao de interrupcao externa no pino RB0

    TRISC = 0b11111011;   //configura portc.b2 como saida
    PORTC = 0b00000000;    //limpa data latchs do portc

    SSPCON.f5 = 0;

    PWM1_Init(500);   //inicializa modulo PWM1 com 500Hz
  
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

    flag0 = false;
}
unsigned int ADC_Read(){
    unsigned int adcvalue;

    ADCON1 = 0b11001110;   //configura apenas AN0 como pino de entrada analógica
    Delay_us(1000);
    ADCON0 = 0b10000101;
    while(ADCON0.f2);
    adcvalue = ((ADRESH<<8)|(ADRESL));
    return adcvalue;
}
void main() {     


    configMain();

    while(true){

        if (!clockWiseDirection) Lcd_Out(2, 1, "Horario");
        else Lcd_Out(2, 1, "Antihorario");

        if(!PORTA.f3 && !flag0){
            Delay_ms(debounceTime);
            Lcd_Cmd(_LCD_CLEAR);
            Lcd_Out(2, 1, "Horario");

            clockWiseDirection = false;
            flag0 = true;
        }
        else if (PORTA.f3 && flag0){
            Delay_ms(debounceTime);
            Lcd_Cmd(_LCD_CLEAR);
            Lcd_Out(2, 1, "AntiHorario");

            clockWiseDirection = true;
            flag0 = false;
        }
        potDutyCicle = ADC_Read();              //adquire o valor analógico de tensão do pino ra em binario
        decScaleDutyCicle = floor((255L*potDutyCicle)/1024);
        IntToStr(floor((100L*decScaleDutyCicle/255)), txt0);
        
        Lcd_Out(1, 7, strcat(txt0,"%"));
        Lcd_Out(1, 1, "Soft:");

        if (!PORTA.f1){
            Delay_ms(debounceTime);

            PWM1_Set_Duty(0);
            PWM1_Start();
            softStart = false;

            if (clockWiseDirection){
                PORTB.f0 = false;
                PORTB.f1 = true;
            }
            else{
                PORTB.f0 = true;
                PORTB.f1 = false;
            }
            SSPCON.f5 = 0;
            while(true){
                potDutyCicle = ADC_Read();              //adquire o valor analógico de tensão do pino ra em binario
                 decScaleDutyCicle = floor((255L*potDutyCicle)/1024);

                    while(!softStart){

                            Lcd_Cmd(_LCD_CLEAR);
                            Lcd_Out(1, 2, "Partindo Motor");

                            for(i = 0; (i < decScaleDutyCicle) && (!softStart); i++) {
                                PWM1_Set_Duty(i);
                                for(j = 0; j < ((100*softStarterTime)/decScaleDutyCicle); j++) Delay_ms(10);
                            }

                            Lcd_Cmd(_LCD_CLEAR);
                            softStart = true;
                            
                            Lcd_Cmd(_LCD_TURN_OFF);
                            Lcd_Cmd(_LCD_TURN_ON);
                            Lcd_Out(1, 1, "Duty:");
                        }

                PWM1_Set_Duty(decScaleDutyCicle);

                IntToStr(floor((100L*decScaleDutyCicle/255)), txt1);
                //Lcd_Out(2, 1, strcat(txt1,"%"));
                Lcd_Out(1, 6, txt1);
                
                if(!PORTA.f2){
                    PORTB.f0 = false;
                    PORTB.f1 = false;
                    break;
                }
            }
            PWM1_Stop();
        }
    }
}