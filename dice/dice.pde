
int annoying = 0;

int generatingNum = 0;

int buttonPin = 9;
int speakerPin = 2;

void setup() {        
  pinMode(buttonPin, INPUT);    
  pinMode(speakerPin, OUTPUT);
  
  pinMode(13, OUTPUT);  // 1  
  pinMode(12, OUTPUT);  // 2  
  pinMode(11, OUTPUT);  // 4a  
  pinMode(10, OUTPUT);  // 6a   
  randomSeed(analogRead(0));
  
}

void loop() {
  int buttonState = digitalRead(buttonPin);
  if (buttonState == HIGH && generatingNum == 0) {  
    generateNum();  
  }
}

void generateNum() {
  generatingNum = 1;
  int currentNum = 0;
  for (int i=5; i<=25; i++)
  {
    showNum(0);
    delay(100);

    int nextNum = (int)random(1, 7);
    while (nextNum == currentNum) {
      nextNum = (int)random(1, 7);
    }
    
    currentNum = nextNum;
    showNum(currentNum);
    
    double delayTime = (.5*i + i*i*i)/20;
    if (annoying) {
      playTone(956/2, delayTime);
    } else {
      digitalWrite(speakerPin, HIGH);
      delay(delayTime);
    }
  }
  
  generatingNum = 0;
}


void showNum(int num) {
  digitalWrite(13, LOW); 
  digitalWrite(12, LOW); 
  digitalWrite(11, LOW); 
  digitalWrite(10, LOW); 

  switch (num) {
   case 1:
     digitalWrite(13, HIGH);
     break;
   case 2:
     digitalWrite(12, HIGH);
     break;
   case 3:
     digitalWrite(13, HIGH);
     digitalWrite(12, HIGH);
     break;
   case 4:
     digitalWrite(12, HIGH);
     digitalWrite(11, HIGH);
     break;
   case 5:
     digitalWrite(13, HIGH);
     digitalWrite(12, HIGH);
     digitalWrite(11, HIGH);
     break;
   case 6:
     digitalWrite(12, HIGH);
     digitalWrite(11, HIGH);
  digitalWrite(10, HIGH);
     break;
   default:
     digitalWrite(speakerPin, LOW);
     break;
 } 
}

void playTone(int tone, int duration) {
  for (long i = 0; i < duration * 1000L; i += tone * 2) {
    digitalWrite(speakerPin, HIGH);
    delayMicroseconds(tone);
    digitalWrite(speakerPin, LOW);
    delayMicroseconds(tone);
  }
}

