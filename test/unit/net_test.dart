import 'package:flutter/material.dart';
import 'package:bristol_exchange/network_utils/api.dart';
import 'dart:convert';
//import 'package:flutter_test/flutter_test.dart';

import 'package:bristol_exchange/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter', () {
    test('value should start at 0', () {
      expect(Counter().value, 0);
    });

    testWidgets('should display a string of text', (WidgetTester tester) async {
      //An instance of counter in bristol_exchange/counter.dart.
      final counter = Counter();
      var data = {'email': 'mituriu@gmail.com', 'password': 'password'};

      //var res = await Network().authData(data, '/login');

      var res = await Network().authData(data, '/login');
      var body = json.decode(res.body);
      tester.printToConsole('auth details' + body['token']);
      counter.increment();

      expect(counter.value, 1);
    });

    test('value should be decremented', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
