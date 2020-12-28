import 'package:atelieruldigital_flutter/src/06/homework/src/middleware/app_middleware.dart';
import 'package:atelieruldigital_flutter/src/06/homework/src/presentation/photo_detail.dart';
import 'package:atelieruldigital_flutter/src/06/homework/src/presentation/home_page.dart';
import 'package:atelieruldigital_flutter/src/06/homework/src/actions/get_photos.dart';
import 'package:atelieruldigital_flutter/src/06/homework/src/data/unsplash_api.dart';
import 'package:atelieruldigital_flutter/src/06/homework/src/models/app_state.dart';
import 'package:atelieruldigital_flutter/src/06/homework/src/reducer/reducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart';

void main() {
  final Client client = Client();
  final UnsplashApi unsplashApi = UnsplashApi(client: client);
  final AppMiddleware middleware = AppMiddleware(unsplashApi: unsplashApi);
  final AppState initialState = AppState.initialState();
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: middleware.middleware,
  );

  store.dispatch(const GetPhotos());

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, @required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: const HomePage(),
        routes: <String, WidgetBuilder>{
          '/photoDetail': (BuildContext context) => const PhotoDetail(),
        },
      ),
    );
  }
}
