part of 'delete_picture_cubit.dart';

abstract class DeletePictureState {
  const DeletePictureState();
}

class DeletePictureInitial extends DeletePictureState {}

class DeletePictureLoading extends DeletePictureState {}

class DeletePictureSuccess extends DeletePictureState {}

class DeletePictureError extends DeletePictureState {
  final Failure failure;

  const DeletePictureError(this.failure);
}
