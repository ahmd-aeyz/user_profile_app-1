// ignore_for_file: avoid_dynamic_calls
class ImageModel {
  final String url;
  ImageModel(this.url);
  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      ImageModel(json['data']['url'] as String);
}
