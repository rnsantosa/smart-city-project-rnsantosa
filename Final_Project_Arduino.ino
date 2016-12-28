char val;

void setup() {
  pinMode(LED_BUILTIN,OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if (Serial.available()) {
    val = Serial.read();
  }
  if (val == 'H') {
    digitalWrite(LED_BUILTIN,HIGH);
  }
  
  else if (val == 'L') {
    digitalWrite(LED_BUILTIN,LOW);
  }
  delay(100);
}
