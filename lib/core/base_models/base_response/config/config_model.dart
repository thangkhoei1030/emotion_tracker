
// import 'package:emotion_tracker/core/src_core.dart';
// class ConfigModel {
//   ConfigModel({
//     this.blockCode,
//     this.name,
//     this.type,
//     this.configLayout,
//     required this.blockData,
//   });

//   final String? blockCode;
//   final String? name;
//   final String? type;
//   final ConfigLayout? configLayout;
//   final dynamic blockData;

//   factory ConfigModel.fromJson(Map<String, dynamic> json) {
//     ConfigModel config = ConfigModel(
//       blockCode: json["block_code"],
//       name: json["name"],
//       type: json["type"],
//       configLayout: json["config_layout"] == null
//           ? null
//           : ConfigLayout.fromJson(json["config_layout"]),
//       blockData: json["block_data"],
//     );
//     config = _updateDataObject(config);
//     return config;
//   }

//   static ConfigModel _updateDataObject(ConfigModel homeConfig) {
//     switch (homeConfig.type) {
//       case TypeConfigEnum.slider:
//         return homeConfig.copyWith(
//             blockData: SliderBlockModel.fromJson(homeConfig.blockData));
//       case TypeConfigEnum.product:
//         return homeConfig.copyWith(
//             blockData: ProductBlockModel.fromJson(homeConfig.blockData));
//       case TypeConfigEnum.categoryProduct:
//         return homeConfig.copyWith(
//             blockData: CategoryBlockModel.fromJson(homeConfig.blockData));
//       case TypeConfigEnum.image:
//         return homeConfig.copyWith(
//             blockData: ImageBlockModel.fromJson(homeConfig.blockData));
//       case TypeConfigEnum.apiViewed:
//         return homeConfig.copyWith(blockData: []);
//       case TypeConfigEnum.searchTrend:
//         return homeConfig.copyWith(blockData: []);
//       case TypeConfigEnum.productDetail:
//         return homeConfig.copyWith(
//             blockData: ProductDetailBlockData.fromJson(homeConfig.blockData));
//       case TypeConfigEnum.rating:
//         return homeConfig.copyWith(
//             blockData: RatingResponse.fromJson(homeConfig.blockData));
//       case TypeConfigEnum.comment:
//         return homeConfig.copyWith(
//             blockData: CommentModel.fromJson(homeConfig.blockData));
//       case TypeConfigEnum.tabArticle:
//         return homeConfig.copyWith(
//             blockData: ArticleTabResponse.fromJson(homeConfig.blockData));
//       case TypeConfigEnum.articleDetail:
//         return homeConfig.copyWith(
//             blockData:
//                 ArticleDetailResponse.fromJson(homeConfig.blockData["data"]));

//       default:
//         throw Exception();
//     }
//   }

//   Map<String, dynamic> toJson() => {
//         "block_code": blockCode,
//         "name": name,
//         "type": type,
//         "config_layout": configLayout?.toJson(),
//         "block_data": blockData,
//       };

//   ConfigModel copyWith({
//     String? blockCode,
//     String? name,
//     String? type,
//     ConfigLayout? configLayout,
//     dynamic blockData,
//   }) {
//     return ConfigModel(
//       blockCode: blockCode ?? this.blockCode,
//       name: name ?? this.name,
//       type: type ?? this.type,
//       configLayout: configLayout ?? this.configLayout,
//       blockData: blockData ?? this.blockData,
//     );
//   }
// }
