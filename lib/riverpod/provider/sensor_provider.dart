import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

// 센서 데이터를 저장할 모델
class SensorState {
  final double accX, accY, accZ;
  final double gyroX, gyroY, gyroZ;

  SensorState({
    this.accX = 0.0,
    this.accY = 0.0,
    this.accZ = 0.0,
    this.gyroX = 0.0,
    this.gyroY = 0.0,
    this.gyroZ = 0.0,
  });
}

// 센서 데이터를 관리하는 StateNotifier
class SensorNotifier extends StateNotifier<SensorState> {
  SensorNotifier() : super(SensorState());

  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  StreamSubscription<GyroscopeEvent>? _gyroscopeSubscription;

  bool isListening = false;

  void startListening() {
    if (isListening) return;
    isListening = true;

    _accelerometerSubscription = accelerometerEventStream().listen((event) {
      print(event.x);
      state = SensorState(
        accX: event.x,
        accY: event.y,
        accZ: event.z,
        gyroX: state.gyroX,
        gyroY: state.gyroY,
        gyroZ: state.gyroZ,
      );
    });

    _gyroscopeSubscription = gyroscopeEventStream().listen((event) {
      state = SensorState(
        accX: state.accX,
        accY: state.accY,
        accZ: state.accZ,
        gyroX: event.x,
        gyroY: event.y,
        gyroZ: event.z,
      );
    });
  }

  void stopListening() {
    print("stop");
    if (!isListening) return;
    isListening = false;

    _accelerometerSubscription?.cancel();
    _gyroscopeSubscription?.cancel();
  }

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    _gyroscopeSubscription?.cancel();
    super.dispose();
  }
}

final sensorProvider = StateNotifierProvider<SensorNotifier, SensorState>((ref) {
  return SensorNotifier();
});
