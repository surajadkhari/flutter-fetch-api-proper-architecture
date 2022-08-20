import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget extends StatelessWidget {
  const AsyncValueWidget({Key? key, required this.value, required this.data})
      : super(key: key);
  final AsyncValue value;
  final Widget Function(dynamic) data;
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, child) => value.when(
            data: data,
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator()));
  }
}
