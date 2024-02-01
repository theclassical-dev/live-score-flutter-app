import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livescore/apis/api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());
