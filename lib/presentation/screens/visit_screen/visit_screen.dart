import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yendoc/presentation/screens/home/home_screen.dart';
import 'package:yendoc/presentation/widgets/common/message_info.dart';

import '../../../core/framework/bloc/injection_container.dart';
import '../../../core/framework/localization/localization.dart';
import '../../../core/framework/size_config/size_config.dart';
import '../../../core/framework/theme/theme_manager.dart';
import '../../../core/framework/util/cool_snack_bar.dart';
import '../../../core/framework/util/general_navigator.dart';
import '../../cubit/save_visit/save_visit_cubit.dart';
import '../../cubit/visit/visit_cubit.dart';
import '../../widgets/common/checkbox_custom.dart';
import '../../widgets/common/drawer/drawer_menu.dart';
import '../../widgets/common/error_text.dart';
import '../../widgets/common/row_item_info.dart';
import '../../widgets/common/simple_button.dart';
import '../../widgets/common/simple_scroll.dart';
import '../../widgets/common/text_field_custom.dart';
import '../gallery/gallery_screen.dart';
import '../map/map_screen.dart';
import 'controller/visit_controller.dart';

class VisitScreen extends StatefulWidget {
  final int visitId;
  final DateTime datePick;
  final bool? readOnly;

  const VisitScreen({
    Key? key,
    required this.visitId,
    required this.datePick,
    this.readOnly = false,
  }) : super(key: key);

  @override
  State<VisitScreen> createState() => _VisitScreenState();
}

class _VisitScreenState extends State<VisitScreen> {
  final VisitController controller = VisitController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (!controller.isFetching) setState(() => {});
    });
    controller.setVisitId(widget.visitId);
    controller.getFirstCamera();
  }

  @override
  void dispose() {
    super.dispose();
    controller.textDiagnosticController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.white,
            drawer: const DrawerMenu(),
            drawerEdgeDragWidth: SizeConfig.screenWidth / 5,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              title: DateTime.now().difference(widget.datePick).inDays == 0
                  ? Text(Localization.xDrawer.visit)
                  : Text("${Localization.xReport.visit}${DateFormat("dd/MM/yyyy").format(widget.datePick)}"),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(45),
                child: Container(
                  height: 45,
                  color: Colors.white,
                  child: TabBar(
                    padding: const EdgeInsets.all(3),
                    tabs: [
                      Tab(
                        child: Text(Localization.xVisit.detail),
                      ),
                      Tab(
                        child: Text(Localization.xVisit.map),
                      ),
                      Tab(
                        child: Text(Localization.xVisit.photos),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: BlocProvider<VisitCubit>(
              create: (context) => sl<VisitCubit>(),
              child: BlocConsumer<VisitCubit, VisitState>(
                listener: (bloc, state) {
                  if (state is VisitSuccess) {
                    controller.setVisit(state.visit);
                  } else if (state is VisitError) {
                    CoolSnackBar.of(context).error(state.failure.message);
                    GeneralNavigator.pop();
                  }
                },
                builder: (blocContext, state) {
                  controller.setIsFetching(state is VisitInitial);

                  if (state is VisitInitial) {
                    controller.cargarVisita(blocContext);
                    return _buildShimmer();
                  } else if (state is VisitSuccess) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SimpleScroll(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RowItemInfo(
                                    title: Localization.xVisit.patient,
                                    value: state.visit.patient.name,
                                  ),
                                  RowItemInfo(
                                    title: Localization.xVisit.address,
                                    value: "${state.visit.patient.address}, ${state.visit.patient.location}",
                                  ),
                                  RowItemInfo(
                                    title: Localization.xVisit.age,
                                    value: "${state.visit.patient.age} ${Localization.xCommon.yearsOld}",
                                  ),
                                  RowItemInfo(
                                    title: Localization.xVisit.symptoms,
                                    value: state.visit.symptoms,
                                  ),
                                  CheckboxCustom(
                                    text: Localization.xVisit.possibleCovid,
                                    checked: controller.possibleCovid,
                                    onChanged: (value) => controller.onCheckboxCovidTapped(value!),
                                    enabled: !widget.readOnly!,
                                  ),
                                  RowItemInfo(
                                    title: Localization.xVisit.diagnostic,
                                  ),
                                  TextFieldCustom(
                                    controller: controller.textDiagnosticController,
                                    keyboardType: TextInputType.multiline,
                                    initialValue: state.visit.diagnostic,
                                    maxLenght: 500,
                                    lines: 8,
                                    style: const TextStyle(fontSize: 14),
                                    enabled: !widget.readOnly!,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: MapScreen(
                              visit: controller.visit,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: GalleryScreen(
                              visit: controller.visit,
                              readOnly: widget.readOnly,
                              controller: controller.galleryController,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return _buildShimmer();
                  }
                },
              ),
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(blurRadius: 7, spreadRadius: 0, color: ThemeManager.kPrimaryColor100),
                  ]),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Theme(
                  data: ThemeManager.getTheme().copyWith(
                    splashFactory: widget.readOnly! ? NoSplash.splashFactory : InkSplash.splashFactory,
                  ),
                  child: BottomNavigationBar(
                    selectedIconTheme:
                        widget.readOnly! ? IconThemeData(color: ThemeManager.kPrimaryColor100) : IconThemeData(color: ThemeManager.kPrimaryColor),
                    selectedItemColor: widget.readOnly! ? ThemeManager.kPrimaryColor100 : ThemeManager.kPrimaryColor,
                    unselectedIconTheme:
                        widget.readOnly! ? IconThemeData(color: ThemeManager.kPrimaryColor100) : IconThemeData(color: ThemeManager.kPrimaryColor),
                    unselectedItemColor: widget.readOnly! ? ThemeManager.kPrimaryColor100 : ThemeManager.kPrimaryColor,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: const Icon(FontAwesomeIcons.signature),
                        label: Localization.xVisit.signature,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(FontAwesomeIcons.camera),
                        label: Localization.xVisit.camera,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(FontAwesomeIcons.flagCheckered),
                        label: Localization.xVisit.finish,
                      ),
                    ],
                    onTap: (index) {
                      if (widget.readOnly != null && !widget.readOnly!) {
                        switch (index) {
                          case 0:
                            controller.goToSign();
                            break;
                          case 1:
                            controller.goToCamera();
                            break;
                          case 2:
                            FocusScope.of(context).unfocus();
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return _finishDialog(setState);
                                  },
                                );
                              },
                            );
                            break;
                        }
                      }
                      //onTap: (index) => controller.onItemTapped(index, context, widget.readOnly!),
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _finishDialog(StateSetter setState) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: AlertDialog(
          actionsPadding: const EdgeInsets.all(10),
          actions: [
            BlocProvider<SaveVisitCubit>(
              create: (context) => sl<SaveVisitCubit>(),
              child: BlocConsumer<SaveVisitCubit, SaveVisitState>(
                listener: (bloc, state) {
                  if (state is SaveVisitError) {
                    GeneralNavigator.pop();
                    CoolSnackBar.of(context).error(state.failure.message);
                  } else if (state is SaveVisitSuccess) {
                    GeneralNavigator.pushAndRemoveUntil(HomeScreen(datePick: DateTime.now()));
                    CoolSnackBar.of(context).success(Localization.xValidation.saveVisitOk);
                  }
                },
                builder: (blocContext, state) {
                  return AbsorbPointer(
                    absorbing: state is SaveVisitLoading,
                    child: Column(
                      children: [
                        SimpleButton(
                          onPressed: () {
                            controller.validateVisitFinishOk().then((hasError) async {
                              if (hasError) {
                                setState(() => controller.setHasErrorOnSave(hasError));
                              } else {
                                await controller.saveVisit(blocContext, "DONE");
                              }
                            });
                          },
                          text: Localization.xFinish.ok,
                          isSmall: true,
                          isSecondary: true,
                          icon: FontAwesomeIcons.solidCircleCheck,
                          iconColor: Colors.green[400],
                          mainAxisAlignmentBody: MainAxisAlignment.start,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SimpleButton(
                          onPressed: () {
                            controller.validateVisitFinishNotOk().then((hasError) async {
                              if (hasError) {
                                setState(() => controller.setHasErrorOnSave(hasError));
                              } else {
                                await controller.saveVisit(blocContext, "NOT_DONE");
                              }
                            });
                          },
                          text: Localization.xFinish.notOk,
                          isSmall: true,
                          isSecondary: true,
                          icon: FontAwesomeIcons.solidCircleXmark,
                          iconColor: Colors.red[400],
                          mainAxisAlignmentBody: MainAxisAlignment.start,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SimpleButton(
                          onPressed: controller.cancelSaveVisit,
                          text: Localization.xCommon.cancel,
                          enabled: state is! SaveVisitLoading,
                        ),
                        if (controller.hasErrorOnSave) ErrorText(errorText: controller.errorTextOnSave),
                        if (state is SaveVisitLoading)
                          Column(
                            children: [
                              const SizedBox(height: 15),
                              MessageInfo(text: Localization.xValidation.finishingVisit),
                            ],
                          )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
          alignment: Alignment.center,
          content: Text(Localization.xFinish.question),
          title: Text(Localization.xFinish.visit),
        ),
      ),
    );
  }

  Padding _buildShimmer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        width: 500,
        height: 500,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[50]!,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              height: 22,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              width: double.infinity,
                              height: 22,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                    ),
                    Container(
                      width: 200,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 150,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
