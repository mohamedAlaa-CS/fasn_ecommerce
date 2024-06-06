class AboutUsModel {
  String? about;
  String? terms;

  AboutUsModel({this.about, this.terms});

  factory AboutUsModel.fromJson(Map<String, dynamic> json) => AboutUsModel(
        about: json['about'] as String?,
        terms: json['terms'] as String?,
      );
}
