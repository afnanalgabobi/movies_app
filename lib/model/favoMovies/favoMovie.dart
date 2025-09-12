// /// message : "favourites fetched successfully"
// /// data : [{"movieId":"10","name":"test","rating":2.4,"imageURL":"https//imagelink","year":"2002"},{"movieId":"movieId","name":"test","rating":2.4,"imageURL":"https//imagelink","year":"2002"}]
//
// class ResponseFavoMovie {
//   ResponseFavoMovie({
//       this.message,
//       this.data,});
//
//   ResponseFavoMovie.fromJson(dynamic json) {
//     message = json['message'];
//     if (json['data'] != null) {
//       data = [];
//       json['data'].forEach((v) {
//         data?.add(FavoMovie.fromJson(v));
//       });
//     }
//   }
//   String? message;
//   List<FavoMovie>? data;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['message'] = message;
//     if (data != null) {
//       map['data'] = data?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// /// movieId : "10"
// /// name : "test"
// /// rating : 2.4
// /// imageURL : "https//imagelink"
// /// year : "2002"
//
// class FavoMovie {
//   FavoMovie({
//       this.movieId,
//       this.name,
//       this.rating,
//       this.imageURL,
//       this.year,});
//
//   FavoMovie.fromJson(dynamic json) {
//     movieId = json['movieId'];
//     name = json['name'];
//     rating = json['rating'];
//     imageURL = json['imageURL'];
//     year = json['year'];
//   }
//   String? movieId;
//   String? name;
//   double? rating;
//   String? imageURL;
//   String? year;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['movieId'] = movieId;
//     map['name'] = name;
//     map['rating'] = rating;
//     map['imageURL'] = imageURL;
//     map['year'] = year;
//     return map;
//   }
//
// }