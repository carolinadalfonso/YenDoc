part of 'save_picture_cubit.dart';

abstract class SavePictureState {
  const SavePictureState();
}

class SavePictureInitial extends SavePictureState {}

class SavePictureLoading extends SavePictureState {}

class SavePictureSuccess extends SavePictureState {
  final int id;

  const SavePictureSuccess(this.id);
}

class SavePictureError extends SavePictureState {
  final Failure failure;

  const SavePictureError(this.failure);
}
