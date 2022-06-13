import 'package:flutter/material.dart';
import 'package:sf_inherited_widget/state_container.dart';

import 'form_page.dart';

void main() {
  runApp(StateContainer(child: TodoApp()));
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Some Todos',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  User? user;

  Widget get _userInfo {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("${user?.firstName} ${user?.lastName}",
              style: const TextStyle(fontSize: 24.0)),
          const Text('user?.email', style: TextStyle(fontSize: 24.0)),
        ],
      ),
    );
  }

  Widget get _logInPrompt {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Text('Please add user information'),
        ],
      ),
    );
  }

  void _updateUser(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) {
          return const UpdateUserScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    user = container?.user;
    var body = user != null ? _userInfo : _logInPrompt;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inherited Widget Test'),
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _updateUser(context),
        child: const Icon(Icons.edit),
      ),
    );
  }
}
