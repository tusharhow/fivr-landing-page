import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mainScrollerController = Provider<ScrollController>(
  (ref) => ScrollController(),
);
final selectedMenuProvider = StateProvider<int?>((ref) {
  return null;
});
