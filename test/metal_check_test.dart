import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:metal_check/metal_check.dart';

void main() {
  const MethodChannel channel = MethodChannel('metal_check');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('isMetalAvailable', () async {
    expect(await MetalCheck.isMetalAvailable, true);
  });
}
