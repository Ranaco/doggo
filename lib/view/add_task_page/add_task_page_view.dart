import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:doggo/view/add_task_page/add_task_page_viewmodel.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddTaskViewModel>.reactive(
        viewModelBuilder: () => AddTaskViewModel(),
        builder: (context, model, child) {
          return const Scaffold(
            body: Center(
              child: Text("hello there"),
            ),
          );
        });
  }
}
