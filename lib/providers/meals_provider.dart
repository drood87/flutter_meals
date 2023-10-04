import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

// Provider is commonly used for data that is static and does not change on runtime

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
