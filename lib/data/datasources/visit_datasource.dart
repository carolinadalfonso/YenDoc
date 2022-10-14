import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/responses/visit_card_entity.dart';
import '../../domain/entities/responses/visit_entity.dart';
import '../models/requests/location_body_model/location_body_model.dart';
import '../models/requests/visit_body_model/visit_body_model.dart';
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
  final String _endpointGetReportVisit = GlobalConfiguration().getDeepValue("endpoints:visits:reportById");
  final String _endpointGetVisits = GlobalConfiguration().getDeepValue("endpoints:visits:today");
  final String _endpointGetVisitsReport = GlobalConfiguration().getDeepValue("endpoints:visits:byDate");
  final String _endpointSaveVisit = GlobalConfiguration().getDeepValue("endpoints:visits:save");

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
  Future<VisitEntity> getReportVisit(int id) async {
    String finalEndpoint = _endpointGetReportVisit.replaceAll("{id}", id.toString());
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
  Future<List<VisitCardEntity>> getReportVisits(DateTime dateTime) async {
    final String formatted = DateFormat('yyyy-MM-dd').format(dateTime);
    String finalEndpoint = _endpointGetVisitsReport.replaceAll("{date}", formatted);
    String data = await httpClient.get(
      url: "$_url/$finalEndpoint",
      requireToken: true,
    );

    List dataVisits = json.decode(data);
    return dataVisits.map((visit) => VisitCardModel.fromJson(visit)).toList();
  }

  @override
  Future<void> saveVisit(VisitBodyModel visitBodyModel) async {
    String finalEndpoint = _endpointSaveVisit.replaceAll("{id}", visitBodyModel.id.toString());
    await httpClient.post(
      url: "$_url/$finalEndpoint",
      body: json.encode(visitBodyModel.toJson()),
      requireToken: true,
    );
  }
}
