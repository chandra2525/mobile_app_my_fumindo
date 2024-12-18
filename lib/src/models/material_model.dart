// import 'dart:convert';

// List<MaterialModel> BahanModelFromJson(String str) => List<MaterialModel>.from(
//     json.decode(str).map((x) => MaterialModel.fromJson(x)));

// String BahanModelToJson(List<MaterialModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class MaterialModel {
//   var asset_id;
//   var asset_name;
//   var isSelected;

//   MaterialModel({this.asset_id, this.asset_name, this.isSelected});

//   factory MaterialModel.fromJson(Map<String, dynamic> json) => MaterialModel(
//       asset_id: json["asset_id"],
//       asset_name: json["asset_name"],
//       isSelected: json['is_selected'] ?? false);

//   Map<String, dynamic> toJson() => {
//         "asset_id": asset_id,
//         "asset_name": asset_name,
//       };
//   static List<MaterialModel> fromJsonToList(List data) {
//     return List<MaterialModel>.from(data.map(
//       (item) => MaterialModel.fromJson(item),
//     ));
//   }
// }

class AssetNameModel {
  final int assetId;
  final String assetName;

  AssetNameModel({
    required this.assetId,
    required this.assetName,
  });

  factory AssetNameModel.fromJson(Map<String, dynamic> json) {
    return AssetNameModel(
      assetId: json['asset_id'],
      assetName: json['asset_name'],
    );
  }
}

class AssetModel {
  final int assetId;
  final String assetName;
  final String category;
  final String branchName;
  final String toolCategoryName;
  final String toolConditionName;
  final String unitName;

  AssetModel({
    required this.assetId,
    required this.assetName,
    required this.category,
    required this.branchName,
    required this.toolCategoryName,
    required this.toolConditionName,
    required this.unitName,
  });

  factory AssetModel.fromJson(Map<String, dynamic> json) {
    return AssetModel(
      assetId: json['asset_id'],
      assetName: json['asset_name'],
      category: json['category'],
      branchName: json['branch']?['branch_name'] ?? '',
      toolCategoryName: json['assetToolCategory']?['tool_category_name'] ?? '',
      toolConditionName:
          json['assetToolCondition']?['tool_condition_name'] ?? '',
      unitName: json['assetUnit']?['unit_name'] ?? '',
    );
  }
}
