abstract class BaseModel<T> {
  T fromJson(Map<String, dynamic> json);

  Map<dynamic, dynamic> toJson();
}
