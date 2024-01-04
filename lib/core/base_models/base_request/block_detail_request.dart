// class BlockDetailRequest {
//   final String pageType;
//   final String blockCode;
//   final String? params;
//   BlockDetailRequest({
//     required this.pageType,
//     required this.blockCode,
//     this.params,
//   });

//   BlockDetailRequest copyWith({
//     String? pageType,
//     String? blockCode,
//     String? params,
//   }) {
//     return BlockDetailRequest(
//       pageType: pageType ?? this.pageType,
//       blockCode: blockCode ?? this.blockCode,
//       params: params ?? this.params,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'page_type': pageType,
//       'block_code': blockCode,
//       'params': params,
//     };
//   }

//   factory BlockDetailRequest.fromJson(Map<String, dynamic> map) {
//     return BlockDetailRequest(
//       pageType: map['page_type'] ?? '',
//       blockCode: map['block_code'] ?? '',
//       params: map['params'] ?? '',
//     );
//   }

//   @override
//   String toString() =>
//       'BlockDetailRequest(pageType: $pageType, blockCode: $blockCode, params: $params)';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is BlockDetailRequest &&
//         other.pageType == pageType &&
//         other.blockCode == blockCode &&
//         other.params == params;
//   }

//   @override
//   int get hashCode => pageType.hashCode ^ blockCode.hashCode ^ params.hashCode;
// }
