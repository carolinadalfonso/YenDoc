import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';

import '../../domain/entities/responses/visit_card_entity.dart';
import '../../domain/entities/responses/visit_entity.dart';
import '../models/requests/location_body_model/location_body_model.dart';
import '../models/responses/visit/visit_model.dart';
import '../models/responses/visit_card/visit_card_model.dart';
import 'base/datasource.dart';
import 'interfaces/ivisit_datasource.dart';

class VisitDatasource extends DataSource implements IVisitDatasource {
  VisitDatasource({
    required super.httpClient,
  });

  final String _url = GlobalConfiguration().getValue("api");
  final String _endpointGetVisit = GlobalConfiguration().getDeepValue("endpoints:visits:byId");
  final String _endpointGetVisits = GlobalConfiguration().getDeepValue("endpoints:visits:today");
  final String _endpointGetVisitsReport = GlobalConfiguration().getDeepValue("endpoints:visits:byDate");

  @override
  Future<VisitEntity> getVisit(int id) async {
    String finalEndpoint = _endpointGetVisit.replaceAll("{id}", id.toString());
    String data = await httpClient.get(
      url: "$_url/$finalEndpoint",
      requireToken: true,
    );

    return VisitModel.fromJson(json.decode(data));
  }

  @override
  Future<List<VisitCardEntity>> getVisits(LocationBodyModel locationModel) async {
    String data = await httpClient.post(
      url: "$_url/$_endpointGetVisits",
      body: json.encode(locationModel.toJson()),
      requireToken: true,
    );

    List dataVisits = json.decode(data);
    return dataVisits.map((visit) => VisitCardModel.fromJson(visit)).toList();
  }

  @override
  Future<List<VisitCardEntity>> getVisitsReport(DateTime dateTime) async {
    String data = await httpClient.get(
      url: "$_url/$_endpointGetVisitsReport/$dateTime",
      requireToken: true,
    );

    List dataVisits = json.decode(data);
    return dataVisits.map((visit) => VisitCardModel.fromJson(visit)).toList();
  }
}
