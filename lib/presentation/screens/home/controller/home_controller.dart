import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

import '../../../../data/models/requests/location_body_model/location_body_model.dart';
import '../../../cubit/visits_list/visits_list_cubit.dart';

class HomeController extends ChangeNotifier {
  void init(BuildContext blocContext, DateTime datePick) async {
    if (DateTime.now().difference(datePick).inDays == 0) {
      try {
        LocationData locationData = await getLocation(blocContext);
        blocContext.read<VisitsListCubit>().getVisits(LocationBodyModel(
              latitude: locationData.latitude.toString(),
              longitude: locationData.longitude.toString(),
            ));
      } catch (e) {
        blocContext.read<VisitsListCubit>().geoLocalizationError();
      }
    } else {
      blocContext.read<VisitsListCubit>().getReportVisits(datePick);
    }
  }

  Future<LocationData> getLocation(BuildContext context) async {
    return await Location().getLocation();
  }
}
