import 'package:dartz/dartz.dart';
import '../../../domain/entities/responses/picture_entity.dart';
import '../../../domain/usecases/picture/get/get_pictures.dart';

import '../../../core/errors/failures/failure.dart';
import '../../../core/framework/bloc/cubit/cubit_base.dart';

part 'pictures_list_state.dart';

class PicturesListCubit extends CubitBase<List<PictureEntity>, PicturesListState> {
  final GetPictures _getPictures;

  PicturesListCubit(this._getPictures) : super(PicturesListInitial());

  void getPictures(int id) async {
    emit(PicturesListLoading());
    final either = await _getPictures.call(id);
    emit(getState(either));
  }

  @override
  PicturesListState getState(Either<Failure, List<PictureEntity>> either) {
    return either.fold(
      (failure) => PicturesListError(failure),
      (data) => PicturesListSuccess(data),
    );
  }
}
