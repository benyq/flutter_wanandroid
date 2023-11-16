import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../net/dio_manager.dart';

final apiProvider = Provider((ref) => DioManager.getInstance().androidService);