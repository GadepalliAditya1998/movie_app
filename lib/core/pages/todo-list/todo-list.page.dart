import 'package:flutter/material.dart';
import 'package:movie_app/core/pages/todo-list/todo-list.state.dart';
import 'package:provider/provider.dart';

/// The UI page of the Todo List page.
class TodoListPage extends StatelessWidget {
  final TodoListState _todoListState = TodoListState();

  TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => this._todoListState,
      builder: (context, child) => Scaffold(
        appBar: AppBar(title: const Text('Todo List')),
        body: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return Consumer<TodoListState>(builder: (context, state, child) {
      if (state.isLoading) {
        return _loadingScreen;
      }

      if (state.taskItems.isEmpty) {
        return _emptyScreen;
      }

      return ListView.builder(
        itemCount: this._todoListState.taskItems.length,
        itemBuilder: _getTodoItem,
      );
    });
  }

  Widget _getTodoItem(BuildContext context, int index) {
    var taskItem = this._todoListState.taskItems[index];
    return ListTile(title: SelectableText(taskItem.description));
  }

  Widget get _loadingScreen {
    return const Center(
      child: SizedBox(width: 40, height: 40, child: CircularProgressIndicator()),
    );
  }

  Widget get _emptyScreen {
    return const Center(child: Text('No Data!!'));
  }
}
