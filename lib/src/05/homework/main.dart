import 'package:atelieruldigital_flutter/src/05/homework/src/middleware/app_middleware.dart';
import 'package:atelieruldigital_flutter/src/05/homework/src/presentation/home_page.dart';
import 'package:atelieruldigital_flutter/src/05/homework/src/actions/get_movies.dart';
import 'package:atelieruldigital_flutter/src/05/homework/src/models/app_state.dart';
import 'package:atelieruldigital_flutter/src/05/homework/src/reducer/reducer.dart';
import 'package:atelieruldigital_flutter/src/05/homework/src/data/yts_api.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart';

void main() {
  final Client client = Client();
  final YtsApi ytsApi = YtsApi(client: client);
  final AppMiddleware middleware = AppMiddleware(ytsApi: ytsApi);
  final AppState initialState = AppState.initialState();
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: middleware.middleware,
  );

  store.dispatch(const GetMovies(genre: 'ALL'));

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, @required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
