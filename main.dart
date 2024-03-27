import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SensorDataScreen(),
    );
  }
}

class SensorDataScreen extends StatefulWidget {
  @override
  _SensorDataScreenState createState() => _SensorDataScreenState();
}

class _SensorDataScreenState extends State<SensorDataScreen> {
  double temperature = 0;
  double humidity = 0;
  bool isConnectedToBluetooth = false;

  @override
  void initState() {
    super.initState();
    // Initialize sensor data subscription
    startSensorDataStream();
    // Check Bluetooth connection status
    checkBluetoothConnection();
  }

  @override
  void dispose() {
    // Dispose of sensor data subscription
    stopSensorDataStream();
    super.dispose();
  }

  void startSensorDataStream() {
    // Start listening to sensor data
    // Replace the following line with appropriate method calls from your sensor plugin package
    // YourSensorPluginPackage.startListening((double temp, double hum) {
    //   setState(() {
    //     temperature = temp;
    //     humidity = hum;
    //   });
    // });

    // Mock sensor data for demonstration
    // Remove this block once you integrate actual sensor data
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        temperature = 25.0;
        humidity = 50.0;
      });
    });
  }

  void stopSensorDataStream() {
    // Stop listening to sensor data
    // Replace the following line with appropriate method calls from your sensor plugin package
    // YourSensorPluginPackage.stopListening();
  }

  void checkBluetoothConnection() {
    // Replace the following line with appropriate method calls to check Bluetooth connection status
    // isConnectedToBluetooth = YourBluetoothPluginPackage.isConnected();
    // Mock Bluetooth connection status for demonstration
    // Remove this line once you integrate actual Bluetooth connection status
    isConnectedToBluetooth = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SsSsSsSsS'),
        actions: [
          IconButton(
            icon: Icon(Icons.bluetooth, size: 30),
            onPressed: () {
              print('Bluetooth button pressed');
              // Handle Bluetooth button press
              _navigateToBluetoothSettings(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.camera, size: 30),
            onPressed: () {
              print('Camera button pressed');
              // Handle camera button press
              // Implement your camera opening logic here
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isConnectedToBluetooth ? 'Connected to Bluetooth' : 'Not connected to Bluetooth',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Temperature: $temperature°C', // Display temperature
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Humidity: $humidity%', // Display humidity
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Your existing button layout
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildButton(Icons.arrow_upward, () {
                          print('Up button pressed');
                        }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildButton(Icons.arrow_back, () {
                          print('Left button pressed');
                        }),
                        SizedBox(width: 125, height: 125),
                        _buildButton(Icons.arrow_forward, () {
                          print('Right button pressed');
                        }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildButton(Icons.arrow_downward, () {
                          print('Down button pressed');
                        }),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 316,
                  child: _buildButton(Icons.camera, () {
                    print('Camera button pressed');
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(IconData iconData, VoidCallback? onPressed) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(25),
      ),
      child: IconButton(
        icon: Icon(iconData),
        color: Colors.white,
        onPressed: onPressed,
      ),
    );
  }

  // Function to navigate to Bluetooth settings
  void _navigateToBluetoothSettings(BuildContext context) {
    MethodChannel methodChannel = MethodChannel('plugins.flutter.io/settings');
    methodChannel.invokeMethod('openBluetoothSettings');
  }
}
