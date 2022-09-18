import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/size_config/size_config.dart';
import 'package:yendoc/presentation/widgets/common/visit_card/visit_card.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/framework/bloc/injection_container.dart';
import '../../../core/framework/util/cool_snack_bar.dart';
import '../../../domain/entities/responses/visit_card_entity.dart';
import '../../cubit/visits_list/visits_list_cubit.dart';
import '../../widgets/common/drawer/drawer_menu.dart';
import 'controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  final DateTime datePick;
  final bool? readOnly;

  const HomeScreen({
    Key? key,
    required this.datePick,
    this.readOnly = false,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() => setState(() => {}));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: DateTime.now().difference(widget.datePick).inDays == 0
              ? Text(Localization.xDrawer.visits)
              : Text("${Localization.xReport.visits}${DateFormat("dd/MM/yyyy").format(widget.datePick)}"),
        ),
        drawer: const DrawerMenu(),
        drawerEdgeDragWidth: SizeConfig.screenWidth / 4.5,
        body: BlocProvider<VisitsListCubit>(
          create: (context) => sl<VisitsListCubit>(),
          child: BlocConsumer<VisitsListCubit, VisitsListState>(
            listener: (bloc, state) {
              if (state is VisitsListError) {
                CoolSnackBar.of(context).error(state.failure.message);
              }
            },
            builder: (blocContext, state) {
              if (state is VisitsListInitial) {
                controller.init(blocContext);
                return _buildShimmer();
              } else if (state is VisitsListLoading) {
                return _buildShimmer();
              } else if (state is VisitsListSuccess) {
                return Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: SizeConfig.screenWidth / 1.1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ListView.builder(
                        itemCount: state.visits.length,
                        itemBuilder: (context, index) {
                          VisitCardEntity visitCard = state.visits[index];
                          return VisitCard(
                            visitCard: visitCard,
                            datePick: widget.datePick,
                            readOnly: widget.readOnly,
                          );
                        },
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset("assets/images/error.png", width: SizeConfig.screenWidth / 1.6),
                        ),
                        Container(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            Localization.xVisit.error,
                            style: const TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Padding _buildShimmer() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SizedBox(
            width: 500,
            height: 60,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[50]!,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 22,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 150,
                          height: 22,
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
        ),
      ),
    );
  }
}
