import 'package:template/core/env/env.dart';
import 'package:template/main_common.dart';

Future<void> main() async {
  await mainCommon(Environment.prod);
}
