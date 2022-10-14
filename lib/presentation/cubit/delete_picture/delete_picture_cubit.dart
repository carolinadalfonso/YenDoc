import 'package:dartz/dartz.dart';
import 'package:yendoc/domain/usecases/picture/delete/delete_picture.dart';

import '../../../core/errors/failures/failure.dart';
import '../../../core/framework/bloc/cubit/cubit_base.dart';

part 'delete_picture_state.dart';

class DeletePictureCubit extends CubitBase<void, DeletePictureState> {
  final DeletePicture _deletePicture;

  DeletePictureCubit(this._deletePicture) : super(DeletePictureInitial());

  void deletePicture(int id) async {
    emit(DeletePictureLoading());
    final either = await _deletePicture.call(id);
    emit(getState(either));
  }

  @override
  DeletePictureState getState(Either<Failure, void> either) {
    return either.fold(
      (failure) => DeletePictureError(failure),
      (_) => DeletePictureSuccess(),
    );
  }
}
