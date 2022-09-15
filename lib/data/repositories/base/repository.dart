abstract class Repository<D extends DataSource> {
  final D dataSource;

  Repository({
    required this.dataSource,
  });
}
