abstract class VisitBodyEntity {
  final int id;
  final String stateCode;
  final bool posibleCovid;
  final String? diagnostic;
  final String? signature;

  const VisitBodyEntity({
    required this.id,
    required this.stateCode,
    required this.posibleCovid,
    this.diagnostic,
    this.signature,
  });
}
