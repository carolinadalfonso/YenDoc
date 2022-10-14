import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/framework/bloc/injection_container.dart';
import '../../../core/framework/util/cool_snack_bar.dart';
import '../../cubit/delete_picture/delete_picture_cubit.dart';
import 'controller/gallery_controller.dart';
import '../../../core/framework/localization/localization.dart';
import '../../../core/framework/theme/theme_manager.dart';
import '../../../core/framework/util/general_navigator.dart';
import '../../../domain/entities/responses/visit_entity.dart';

import '../../../core/framework/util/cool_dialog.dart';

class GalleryScreen extends StatefulWidget {
  final VisitEntity visit;
  final CameraDescription? camera;
  final bool? readOnly;
  final GalleryController controller;

  const GalleryScreen({
    Key? key,
    required this.visit,
    required this.controller,
    this.camera,
    this.readOnly = false,
  }) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      if (mounted) setState(() => {});
    });
    widget.controller.setVisit(widget.visit);

    if (widget.camera != null) {
      widget.controller.setCameraController(widget.camera!);
      widget.controller.initializeControllerFuture = widget.controller.cameraController.initialize();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.controller.pictures.isNotEmpty
          ? PageView.builder(
              controller: PageController(viewportFraction: 0.8),
              itemCount: widget.controller.pictures.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.memory(
                          base64Decode(widget.controller.pictures[index].picture),
                          fit: BoxFit.cover,
                        ),
                      ),
                      BlocProvider<DeletePictureCubit>(
                        create: (context) => sl<DeletePictureCubit>(),
                        child: BlocConsumer<DeletePictureCubit, DeletePictureState>(
                          listener: (bloc, state) {
                            if (state is DeletePictureSuccess) {
                              widget.controller.removeImage(widget.controller.pictures[index].id);
                              CoolSnackBar.of(context).success(Localization.xGallery.deletedPhoto);
                            } else if (state is DeletePictureError) {
                              CoolSnackBar.of(context).error(state.failure.message);
                            }
                          },
                          builder: (blocContext, state) {
                            return Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: IconButton(
                                  splashRadius: 26,
                                  splashColor: Colors.grey[200],
                                  icon:
                                      state is DeletePictureLoading ? const CircularProgressIndicator() : const Icon(FontAwesomeIcons.solidTrashCan),
                                  color: Colors.grey[400],
                                  onPressed: widget.readOnly!
                                      ? null
                                      : () async {
                                          CoolDialog.of(context).show(
                                            loadingButton1: state is DeletePictureLoading,
                                            textButton1: Localization.xCommon.yes,
                                            textButton2: Localization.xCommon.no,
                                            question: Localization.xGallery.questionDeletePhoto,
                                            title: Localization.xGallery.deletePhoto,
                                            onPressed1: () {
                                              widget.controller.deleteImage(widget.controller.pictures[index].id, blocContext);
                                              GeneralNavigator.pop();
                                            },
                                            onPressed2: () => GeneralNavigator.pop(),
                                          );
                                        },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FontAwesomeIcons.images,
                    size: 128,
                    color: ThemeManager.kPrimaryColor50,
                  ),
                  Text(
                    Localization.xGallery.noPhotos,
                    style: TextStyle(
                      color: ThemeManager.kPrimaryColor100,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
