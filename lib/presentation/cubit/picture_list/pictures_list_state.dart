part of 'pictures_list_cubit.dart';

abstract class PicturesListState {
  const PicturesListState();
}

class PicturesListInitial extends PicturesListState {}

class PicturesListLoading extends PicturesListState {}

class PicturesListSuccess extends PicturesListState {
  final List<PictureEntity> pictures;

  const PicturesListSuccess(this.pictures);
}

class PicturesListError extends PicturesListState {
  final Failure failure;

  const PicturesListError(this.failure);
}
