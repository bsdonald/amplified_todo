import 'dart:async';

import 'package:amplified_todo/amplifyconfiguration.dart';
import 'package:amplified_todo/domain/models/ModelProvider.dart';
import 'package:amplified_todo/presentation/pages/todos_page/widgets/todos_list.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';

class TodosPageBody extends StatefulWidget {
  @override
  _TodosPageBodyState createState() => _TodosPageBodyState();
}

class _TodosPageBodyState extends State<TodosPageBody> {
// amplify plugins

  // subscription to Todo model update events - to be initialized at runtime
  late StreamSubscription _subscription;
  // loading ui state - initially set to a loading state
  bool _isLoading = true;

  // list of Todos - initially empty
  List<Todo> _todos = [];

  // amplify plugins
  final AmplifyDataStore _dataStorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);
  final AmplifyAPI _apiPlugin = AmplifyAPI();
  final AmplifyAuthCognito _authPlugin = AmplifyAuthCognito();
  @override
  void initState() {
    // kick off app initialization
    _initializeApp();

    super.initState();
  }

  @override
  void dispose() {
    // cancel the subscription when the state is removed from the tree
    _subscription.cancel();
    super.dispose();
  }

  Future<void> _initializeApp() async {
    // configure Amplify
    await _configureAmplify();

    // listen for updates to Todo entries by passing the Todo classType to
    // Amplify.DataStore.observe() and when an update event occurs, fetch the
    // todo list
    //
    // note this strategy may not scale well with larger number of entries
    _subscription = Amplify.DataStore.observe(Todo.classType).listen((event) {
      _fetchTodos();
    });

    // fetch Todo entries from DataStore
    await _fetchTodos();

    // after both configuring Amplify and fetching Todo entries, update loading
    // ui state to loaded state
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _configureAmplify() async {
    try {
      // add Amplify plugins
      await Amplify.addPlugins([_dataStorePlugin, _apiPlugin, _authPlugin]);

      // configure Amplify
      //
      // note that Amplify cannot be configured more than once!
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      // error handling can be improved for sure!
      // but this will be sufficient for the purposes of this tutorial
      print('An error occurred while configuring Amplify: $e');
    }
  }

  Future<void> _fetchTodos() async {
    try {
      // query for all Todo entries by passing the Todo classType to
      // Amplify.DataStore.query()
      List<Todo> updatedTodos = await Amplify.DataStore.query(Todo.classType);

      // update the ui state to reflect fetched todos
      setState(() {
        _todos = updatedTodos;
      });
    } catch (e) {
      print('An error occurred while querying Todos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? Center(child: CircularProgressIndicator()) : TodosList(todos: _todos);
  }
}
