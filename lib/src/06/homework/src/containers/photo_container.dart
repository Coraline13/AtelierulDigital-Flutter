import 'package:atelieruldigital_flutter/src/06/homework/src/models/app_state.dart';
import 'package:atelieruldigital_flutter/src/06/homework/src/models/photo.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:meta/meta.dart';

class PhotoContainer extends StatelessWidget {
  const PhotoContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<Photo> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Photo>(
      converter: (Store<AppState> store) {
        return store.state.photos.firstWhere((Photo photo) => photo.id == store.state.selectedPhoto);
      },
      builder: builder,
    );
  }
}
