import 'package:atelieruldigital_flutter/src/06/homework/src/actions/download_photo.dart';
import 'package:atelieruldigital_flutter/src/06/homework/src/actions/get_photos.dart';
import 'package:atelieruldigital_flutter/src/06/homework/src/data/unsplash_api.dart';
import 'package:atelieruldigital_flutter/src/06/homework/src/models/app_state.dart';
import 'package:atelieruldigital_flutter/src/06/homework/src/models/photo.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class AppMiddleware {
  const AppMiddleware({@required UnsplashApi unsplashApi})
      : assert(unsplashApi != null),
        _unsplashApi = unsplashApi;

  final UnsplashApi _unsplashApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      _getPhotos,
    ];
  }

  Future<void> _getPhotos(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);
    if (action is GetPhotosStart) {
      try {
        final List<Photo> photos = await _unsplashApi.getPhotos(
          store.state.nextPage,
        );
        final GetPhotosSuccessful successful = GetPhotos.successful(photos);
        store.dispatch(successful);
      } catch (e, stacktrace) {
        print('STACKTRACE: $stacktrace');
        final GetPhotosError error = GetPhotos.error(e);
        store.dispatch(error);
      }
    } else if (action is DownloadPhotoStart) {
      try {
        final String downloadUrl = await _unsplashApi.downloadPhoto(
          store.state.downloadPhoto,
        );
        final DownloadPhotoSuccessful successful = DownloadPhoto.successful(downloadUrl);
        store.dispatch(successful);
      } catch (e, stacktrace) {
        print('STACKTRACE: $stacktrace');
        final DownloadPhotoError error = DownloadPhoto.error(e);
        store.dispatch(error);
      }
    }
  }
}
