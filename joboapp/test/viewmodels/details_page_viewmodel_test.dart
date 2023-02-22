import 'package:flutter_test/flutter_test.dart';
import 'package:joboapp/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('DetailsPageViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
