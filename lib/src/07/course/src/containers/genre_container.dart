// File created by
// Lung Razvan <long1eu>
// on 15/12/2020

import 'package:atelieruldigital_flutter/src/07/course/src/models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class GenreContainer extends StatelessWidget {
  const GenreContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<String> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      converter: (Store<AppState> store) {
        return store.state.genre;
      },
      builder: builder,
    );
  }
}
