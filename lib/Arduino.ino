  #include <SoftwareSerial.h>
  #include <DHT.h>

  #define DHTTYPE DHT11
  #define DHTPIN A4
  #define sensor A0
  #define SOIL_MOISTURE_PIN A1

  DHT dht(DHTPIN, DHTTYPE);

  float humidity_air, temperature_air, soil_temperature, humidity_soil;
  int temtierra = A0;
  SoftwareSerial blue(A3, A2);

  char DEVICE_NAME[21] = "HumyCon";
  char BAUD_RATE = '4';
  char PIN_CODE[5] = "1122";

  void setup() {
    Serial.begin(9600);
    blue.begin(9600);
    dht.begin();
  }

  void loop() {
    // Inicializa el módulo Bluetooth una vez
    // Realiza las configuraciones del módulo Bluetooth una vez, no en cada iteración
    blue.begin(9600);
    blue.print("AT");
    delay(1000);
    blue.print("AT+NAME");
    blue.print(DEVICE_NAME);
    delay(1000);
    blue.print("AT+BAUD");
    blue.print(BAUD_RATE);
    delay(1000);
    blue.print("AT+PIN");
    blue.print(PIN_CODE);
    delay(1000);

    // Lecturas de sensores
    humidity_air = dht.readHumidity();
    temperature_air = dht.readTemperature();
    soil_temperature = analogRead(sensor) * 0.48876;  
    temtierra = map(analogRead(sensor), 1023, 0, 0, 100);


    // Impresión de datos en el Monitor Serial
    Serial.print("Humedad en el aire: ");
    Serial.print(humidity_air);
    Serial.print("%\n");
    Serial.print("Temperatura del aire: ");
    Serial.print(temperature_air);
    Serial.println("°C");
    Serial.print("Temperatura del suelo: ");
    Serial.print(soil_temperature);
    Serial.println("°C");
    Serial.print("Humedad en el suelo: ");
    Serial.print(temtierra);
    Serial.println("%");


    // Envío de datos al módulo Bluetooth
    blue.print(humidity_air);
    blue.print(",");
    blue.print(temperature_air);
    blue.print(",");
    blue.print(soil_temperature);
    blue.print(",");
    blue.print(temtierra);
    blue.print("\n");


  }


