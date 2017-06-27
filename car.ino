volatile char inChar;
 
#define M2_1 6  // Control pin 1 for motor 1
#define M2_2 7  // Control pin 2 for motor 1
#define M1_1 3  // Control pin 1 for motor 2
#define M1_2 4  // Control pin 2 for motor 2

void setup()
{
  Serial.begin(9600);
  pinMode(M2_1, OUTPUT);
  pinMode(M2_2, OUTPUT);
  pinMode(M1_1, OUTPUT);
  pinMode(M1_2, OUTPUT);
}

void loop() {
  if (Serial.available() > 0) {
    char inChar = (char)Serial.read();
    Serial.print("Incoming Data from DOUM+\n"); 
    Serial.println(inChar);
  if(inChar == 'a'){
    digitalWrite(M2_1,LOW);
    digitalWrite(M2_2,HIGH);
    digitalWrite(M1_1,LOW);
    digitalWrite(M1_2,HIGH);
    delay(1000);
    digitalWrite(M2_1,LOW);
    digitalWrite(M2_2,LOW);
    digitalWrite(M1_1,LOW);
    digitalWrite(M1_2,LOW);
    
  } 

  else if(inChar =='b')
  {
 //MOVE RIGHT
    digitalWrite(M2_1,HIGH);
    digitalWrite(M2_2,LOW);
    digitalWrite(M1_1,LOW);
    digitalWrite(M1_2,HIGH);
    delay(1000);
    digitalWrite(M2_1,LOW);
    digitalWrite(M2_2,LOW);
    digitalWrite(M1_1,LOW);
    digitalWrite(M1_2,LOW);
  }
    else if(inChar =='c')
  {
   //MOVE LEFT

  digitalWrite(M2_1,LOW);
  digitalWrite(M2_2,HIGH);
  digitalWrite(M1_1,HIGH);
  digitalWrite(M1_2,LOW);
  delay(1000);
    digitalWrite(M2_1,LOW);
    digitalWrite(M2_2,LOW);
    digitalWrite(M1_1,LOW);
    digitalWrite(M1_2,LOW);
  }
  }
}
