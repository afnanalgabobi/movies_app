class CastResponse {
  final String name;
  final String characterName;
  final String urlSmallImage;
  final String imdbCode;

  CastResponse({
    required this.name,
    required this.characterName,
    required this.urlSmallImage,
    required this.imdbCode,
  });

  factory CastResponse.fromJson(Map<String, dynamic> json) {
    return CastResponse(
      name: json['name'] ?? '',
      characterName: json['character_name'] ?? '',
      urlSmallImage: json['url_small_image'] ?? '',
      imdbCode: json['imdb_code'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'character_name': characterName,
        'url_small_image': urlSmallImage,
        'imdb_code': imdbCode
      };
}
