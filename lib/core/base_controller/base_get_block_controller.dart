// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:emotion_tracker/core/src_core.dart';
// import 'package:web4s/feature/src_feature.dart';

// abstract class BaseGetBlockController<T extends BaseRefreshGetxController>
//     extends BaseRefreshGetxController {
//   final RxList<Widget> listWidget = RxList.empty(growable: true);

//   late final BaseGetBlockRepository repository;

//   BaseResponseList<ConfigModel> configResponse = BaseResponseList();

//   late final Rx<ProductFilter> filter = ProductFilter().obs;

//   bool get isFilter => filter.value != ProductFilter();

//   @override
//   @mustCallSuper
//   void onInit() async {
//     repository = BaseGetBlockRepository(this);
//     try {
//       showLoading();
//       await fetchData();
//     } finally {
//       hideLoading();
//     }
//     super.onInit();
//   }

//   Future<void> fetchData();

//   Future<void> getConfig(BaseRequestPage requestPage) async {
//     configResponse = await repository.getListBlock(requestPage);
//     await _updateBlockWidget();
//   }

//   Future<void> _updateBlockWidget() async {
//     listWidget.clear();
//     for (var element in configResponse.data) {
//       switch (element.blockData.runtimeType) {
//         case SliderBlockModel:
//           listWidget.add(BlockHomeTopHeaderBase(element).buildWidget());
//           break;
//         case ProductBlockModel:
//           //xóa controller cũ để cập nhật lại các items về trạng thái ban đầu ( filter )
//           await FunctionUtils.deleteOldController<BlockProductCtr>(
//               tag: element.blockCode);
//           listWidget.add(BlockProductUI(element).buildWidget());
//           break;
//         case CategoryBlockModel:
//           listWidget.add(BlockCategory(
//             element,
//             productFilter: filter,
//           ));
//           break;
//         case ImageBlockModel:
//           var data = (element.blockData as ImageBlockModel).data;
//           if (data?.image.isStringNotEmpty ?? false) {
//             listWidget.add(NetworkImageWidget(
//                 urlImage: data?.getUrlImage() ?? "",
//                 layout: element.configLayout!));
//           }
//           break;
//         case ProductDetailBlockData:
//           listWidget.add(ProductDetailInfoWidget(element.blockData));
//           break;
//         case CommentModel:
//           listWidget.add(const CommentBlock(commentType: CommentType.comment));
//           break;
//         case RatingResponse:
//           listWidget.add(const RatingBlock());
//           break;
//         case ArticleTabResponse:
//           listWidget.add(ArticleBlock(element));
//           break;
//         default:
//       }
//     }
//   }
// }
