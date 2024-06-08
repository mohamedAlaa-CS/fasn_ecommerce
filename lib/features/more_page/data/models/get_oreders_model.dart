class GetOredersModel {
  int? id;
  double? total;
  String? date;
  String? status;

  GetOredersModel({
    this.id,
    this.total,
    this.date,
    this.status,
  });

  factory GetOredersModel.fromJson(Map<String, dynamic> json) {
    return GetOredersModel(
      id: json['id'] as int?,
      total: (json['total'] as num?)?.toDouble(),
      date: json['date'] as String?,
      status: json['status'] as String?,
    );
  }
}
