import 'cast_response.dart';
import 'torrent.dart';

class Movie {
  int? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  int? likeCount;
  String? descriptionIntro;
  String? descriptionFull;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  List<Torrent>? torrents;
  String? dateUploaded;
  int? dateUploadedUnix;
  List<CastResponse>? cast;
  String? mediumScreenshotImage1;
  String? mediumScreenshotImage2;
  String? mediumScreenshotImage3;
  Movie({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.likeCount,
    this.descriptionIntro,
    this.descriptionFull,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
    this.cast,
    this.mediumScreenshotImage1,
    this.mediumScreenshotImage2,
    this.mediumScreenshotImage3,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['id'] as int?,
        url: json['url'] as String?,
        imdbCode: json['imdb_code'] as String?,
        title: json['title'] as String?,
        titleEnglish: json['title_english'] as String?,
        titleLong: json['title_long'] as String?,
        slug: json['slug'] as String?,
        year: (json['year'] as num?)?.toInt(),
        rating: (json['rating'] as num?)?.toDouble(),
        runtime: (json['runtime'] as num?)?.toInt(),

        // معالجة كل الحالات لـ genres
        genres: () {
          final g = json['genres'];
          if (g is List) {
            return g.map((e) => e.toString()).toList();
          } else if (g is String || g is int) {
            return [g.toString()];
          } else {
            return <String>[];
          }
        }(),

        likeCount: json['like_count'] as int?,
        descriptionIntro: json['description_intro'] as String?,
        descriptionFull: json['description_full'] as String?,
        ytTrailerCode: json['yt_trailer_code'] as String?,
        language: json['language'] as String?,
        mpaRating: json['mpa_rating'] as String?,
        backgroundImage: json['background_image'] as String?,
        backgroundImageOriginal: json['background_image_original'] as String?,
        smallCoverImage: json['small_cover_image'] as String?,
        mediumCoverImage: json['medium_cover_image'] as String?,
        largeCoverImage: json['large_cover_image'] as String?,
        torrents: (json['torrents'] as List<dynamic>?)
            ?.map((e) => Torrent.fromJson(e as Map<String, dynamic>))
            .toList(),
        dateUploaded: json['date_uploaded'] as String?,
        dateUploadedUnix: json['date_uploaded_unix'] as int?,
        cast: (json['cast'] as List<dynamic>?)
                ?.map((element) => CastResponse.fromJson(element))
                .toList() ??
            [],
        mediumScreenshotImage1: json['medium_screenshot_image1'] as String?,
        mediumScreenshotImage2: json['medium_screenshot_image2'] as String?,
        mediumScreenshotImage3: json['medium_screenshot_image3'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'imdb_code': imdbCode,
        'title': title,
        'title_english': titleEnglish,
        'title_long': titleLong,
        'slug': slug,
        'year': year,
        'rating': rating,
        'runtime': runtime,
        'genres': genres,
        'like_count': likeCount,
        'description_intro': descriptionIntro,
        'description_full': descriptionFull,
        'yt_trailer_code': ytTrailerCode,
        'language': language,
        'mpa_rating': mpaRating,
        'background_image': backgroundImage,
        'background_image_original': backgroundImageOriginal,
        'small_cover_image': smallCoverImage,
        'medium_cover_image': mediumCoverImage,
        'large_cover_image': largeCoverImage,
        'torrents': torrents?.map((e) => e.toJson()).toList(),
        'date_uploaded': dateUploaded,
        'date_uploaded_unix': dateUploadedUnix,
        'cast': cast,
        'medium_screenshot_image1': mediumScreenshotImage1,
        'medium_screenshot_image2': mediumScreenshotImage2,
        'medium_screenshot_image3': mediumScreenshotImage3,
      };

  @override
  String toString() {
    return 'Movie(title: $title, year: $year, rating: $rating, genres: $genres)';
  }
}
