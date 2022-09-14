import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yendoc/presentation/screens/gallery/controller/gallery_controller.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/core/framework/util/general_navigator.dart';
import 'package:yendoc/domain/entities/responses/visit_entity.dart';

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

    widget.controller.getVisitImages();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.controller.images.isNotEmpty
          ? PageView.builder(
              controller: PageController(viewportFraction: 0.8),
              itemCount: widget.controller.images.length,
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
                        child: Image.file(
                          widget.controller.images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: IconButton(
                            splashRadius: 26,
                            splashColor: Colors.grey[200],
                            icon: const Icon(FontAwesomeIcons.solidTrashCan),
                            color: Colors.grey[400],
                            onPressed: widget.readOnly!
                                ? null
                                : () async {
                                    CoolDialog.of(context).show(
                                      textButton1: Localization.xCommon.yes,
                                      textButton2: Localization.xCommon.no,
                                      question: Localization.xGallery.questionDeletePhoto,
                                      title: Localization.xGallery.deletePhoto,
                                      onPressed1: () {
                                        widget.controller.deleteImage(widget.controller.images[index], context);
                                        GeneralNavigator.pop();
                                      },
                                      onPressed2: () => GeneralNavigator.pop(),
                                    );
                                  },
                          ),
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
