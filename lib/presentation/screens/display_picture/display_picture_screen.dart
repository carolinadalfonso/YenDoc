import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/framework/bloc/injection_container.dart';
import '../../../core/framework/util/cool_snack_bar.dart';
import '../../../core/framework/util/general_navigator.dart';
import '../../cubit/save_picture/save_picture_cubit.dart';
import '../gallery/controller/gallery_controller.dart';
import '../../../core/framework/localization/localization.dart';

import '../../../core/framework/util/cool_dialog.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final GalleryController galleryController;

  const DisplayPictureScreen({
    super.key,
    required this.imagePath,
    required this.galleryController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(Localization.xGallery.photo)),
      body: BlocProvider<SavePictureCubit>(
        create: (context) => sl<SavePictureCubit>(),
        child: BlocConsumer<SavePictureCubit, SavePictureState>(
          listener: (bloc, state) async {
            if (state is SavePictureSuccess) {
              await galleryController.savePictureSuccess(imagePath, state.id);
              CoolSnackBar.of(context).success(Localization.xGallery.savedPhoto);
            } else if (state is SavePictureError) {
              CoolSnackBar.of(context).error(state.failure.message);
            }
          },
          builder: (blocContext, state) {
            return AbsorbPointer(
              absorbing: state is SavePictureLoading,
              child: Stack(alignment: Alignment.bottomCenter, children: [
                Center(
                  child: Image.file(File(imagePath)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        backgroundColor: Colors.green[600],
                        onPressed: () async {
                          await galleryController.savePicture(blocContext, imagePath);
                        },
                        child: state is SavePictureLoading ? const CircularProgressIndicator() : const Icon(FontAwesomeIcons.fileCircleCheck),
                        heroTag: null,
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.red[700],
                        onPressed: () async {
                          CoolDialog.of(context).show(
                            textButton1: Localization.xCommon.yes,
                            textButton2: Localization.xCommon.no,
                            question: Localization.xGallery.questionDeletePhoto,
                            title: Localization.xGallery.deletePhoto,
                            onPressed1: () async {
                              await galleryController.deletePictureDisplay(context, imagePath);
                            },
                            onPressed2: () => GeneralNavigator.pop(),
                          );
                        },
                        child: const Icon(FontAwesomeIcons.trashCan),
                      ),
                    ],
                  ),
                ),
              ]),
            );
          },
        ),
      ),
    );
  }
}
