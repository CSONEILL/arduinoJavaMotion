// arduino example code for receiving data from java 


// in the example code there is only one character sending at the time
// in can be modified to send whole words

char receivedChar;
boolean newData = false;

void setup() {  
  Serial.begin(9600);
  Serial.println("machine operational ");
}

void loop() {
  recvOneChar();
  showNewData();
}

void recvOneChar() {
  if (Serial.available() > 0) {
    receivedChar = Serial.read();
    newData = true;
  }
}


void showNewData() {
  if (newData == true) {
    Serial.print("This just in ... ");
    Serial.print(receivedChar);
    Serial.print(" ");
 /* You can add more else if  or switch  as needed  */
    if (receivedChar == 'X') 
    {
     
    }
    else if (receivedChar == 'Y') 
    {
     
    }
    else if (receivedChar == 'Z'  ) 
    {
     
      
    }
   
    
    else
    {
      receivedChar = NULL;
      
    
    }

  }

//  delay(100);
  newData = false;
}

