import 'package:dartz/dartz.dart';

import '../../../core/errors/failures/failure.dart';
import '../../../core/framework/bloc/cubit/cubit_base.dart';
import '../../../data/models/requests/picture_bode_model/picture_body_model.dart';
import '../../../domain/usecases/picture/post/post_picture.dart';

part 'save_picture_state.dart';

class SavePictureCubit extends CubitBase<int, SavePictureState> {
  final PostSavePicture _postSavePicture;

  SavePictureCubit(this._postSavePicture) : super(SavePictureInitial());

  void savePicture(PictureBodyModel pictureBodyModel) async {
    emit(SavePictureLoading());
    final either = await _postSavePicture.call(pictureBodyModel);
    emit(getState(either));
  }

  @override
  SavePictureState getState(Either<Failure, int> either) {
    return either.fold(
      (failure) => SavePictureError(failure),
      (data) => SavePictureSuccess(data),
    );
  }
}
