class CategoriesResponse {
  final List<DataCategoriesResponse?>? data;
  CategoriesResponse({
    this.data,
  });
}

class DataCategoriesResponse {
  final String? id;
  final String? name;
  DataCategoriesResponse({
    this.id,
    this.name,
  });

}