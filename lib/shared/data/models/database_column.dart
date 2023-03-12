enum DatabaseColumn {
  id('_id'),
  title('title'),
  details('details'),
  categoryId('category'),
  isFavorite('is_favorite');

  const DatabaseColumn(this.value);

  final String value;

  static List<String> get allValues {
    return [
      id.value,
      title.value,
      details.value,
      categoryId.value,
      isFavorite.value,
    ];
  }
}
