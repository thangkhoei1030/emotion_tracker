// import 'dart:convert';

// class ParamsRequestTemplate<T> {
//   T? params;
//   ParamsRequestTemplate({
//     this.params,
//   });

//   ParamsRequestTemplate<T> copyWith({
//     T? params,
//   }) {
//     return ParamsRequestTemplate<T>(
//       params: params ?? this.params,
//     );
//   }

//   Map<String, dynamic> toJson(Map<String, dynamic> Function(T?) x) {
//     return {
//       'params': jsonEncode(x(params)),
//     };
//   }

//   @override
//   String toString() => 'ParamsRequestTemplate(params: $params)';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is ParamsRequestTemplate<T> && other.params == params;
//   }

//   @override
//   int get hashCode => params.hashCode;
// }
