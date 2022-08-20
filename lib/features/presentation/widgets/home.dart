import 'package:fetch_api_with_proper_architecure/features/data/models/post_response_model.dart';
import 'package:fetch_api_with_proper_architecure/features/presentation/controllers/post_controller.dart';
import 'package:fetch_api_with_proper_architecure/utils/asyncvalue_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(postControllerProvider);
    return Scaffold(
        body: AsyncValueWidget<List<PostResponseModel>>(
      value: result,
      data: (data) {
        return ListView(
          children: [
            ...data.map((e) => ListTile(
                  contentPadding: const EdgeInsets.all(20),
                  title: Text(
                    "${e.firstName} ${e.lastName}",
                  ),
                  trailing: Image.network(e.avatar),
                ))
          ],
        );
      },
    )
        // data.when(
        //   data: (data) {
        //     return ListView(
        //       children: [
        //         ...data.map((e) => ListTile(
        //               contentPadding: const EdgeInsets.all(20),
        //               title: Text(
        //                 "${e.firstName} ${e.lastName}",
        //               ),
        //               trailing: Image.network(e.avatar),
        //             ))
        //       ],
        //     );
        //   },
        //   error: (error, stackTrace) => Text(
        //     error.toString(),
        //   ),
        //   loading: () => const CircularProgressIndicator(),
        // ),
        );
  }
}
