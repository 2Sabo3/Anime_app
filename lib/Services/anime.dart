// To parse this JSON data, do
//
//     final anime = animeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Anime animeFromJson(String str) => Anime.fromJson(json.decode(str));

String animeToJson(Anime data) => json.encode(data.toJson());

class Anime {
  Anime({
    @required this.statusCode,
    @required this.message,
    @required this.data,
    @required this.version,
  });

  final int statusCode;
  final String message;
  final Data data;
  final String version;

  factory Anime.fromJson(Map<String, dynamic> json) => Anime(
        statusCode: json["status_code"] == null ? null : json["status_code"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        version: json["version"] == null ? null : json["version"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode == null ? null : statusCode,
        "message": message == null ? null : message,
        "data": data == null ? null : data.toJson(),
        "version": version == null ? null : version,
      };
}

class Data {
  Data({
    @required this.currentPage,
    @required this.count,
    @required this.documents,
    @required this.lastPage,
  });

  final int currentPage;
  final int count;
  final List<Document> documents;
  final int lastPage;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        count: json["count"] == null ? null : json["count"],
        documents: json["documents"] == null
            ? null
            : List<Document>.from(
                json["documents"].map((x) => Document.fromJson(x))),
        lastPage: json["last_page"] == null ? null : json["last_page"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? null : currentPage,
        "count": count == null ? null : count,
        "documents": documents == null
            ? null
            : List<dynamic>.from(documents.map((x) => x.toJson())),
        "last_page": lastPage == null ? null : lastPage,
      };
}

class Document {
  Document({
    @required this.anilistId,
    @required this.malId,
    @required this.format,
    @required this.status,
    @required this.titles,
    @required this.descriptions,
    @required this.startDate,
    @required this.endDate,
    @required this.seasonPeriod,
    @required this.seasonYear,
    @required this.episodesCount,
    @required this.episodeDuration,
    @required this.coverImage,
    @required this.coverColor,
    @required this.bannerImage,
    @required this.genres,
    @required this.score,
    @required this.id,
  });

  final int anilistId;
  final int malId;
  final int format;
  final int status;
  final Titles titles;
  final Descriptions descriptions;
  final DateTime startDate;
  final DateTime endDate;
  final int seasonPeriod;
  final int seasonYear;
  final int episodesCount;
  final int episodeDuration;
  final String coverImage;
  final String coverColor;
  final String bannerImage;
  final List<String> genres;
  final int score;
  final int id;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        anilistId: json["anilist_id"] == null ? null : json["anilist_id"],
        malId: json["mal_id"] == null ? null : json["mal_id"],
        format: json["format"] == null ? null : json["format"],
        status: json["status"] == null ? null : json["status"],
        titles: json["titles"] == null ? null : Titles.fromJson(json["titles"]),
        descriptions: json["descriptions"] == null
            ? null
            : Descriptions.fromJson(json["descriptions"]),
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        seasonPeriod:
            json["season_period"] == null ? null : json["season_period"],
        seasonYear: json["season_year"] == null ? null : json["season_year"],
        episodesCount:
            json["episodes_count"] == null ? null : json["episodes_count"],
        episodeDuration:
            json["episode_duration"] == null ? null : json["episode_duration"],
        coverImage: json["cover_image"] == null ? null : json["cover_image"],
        coverColor: json["cover_color"] == null ? null : json["cover_color"],
        bannerImage: json["banner_image"] == null ? null : json["banner_image"],
        genres: json["genres"] == null
            ? null
            : List<String>.from(json["genres"].map((x) => x)),
        score: json["score"] == null ? null : json["score"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "anilist_id": anilistId == null ? null : anilistId,
        "mal_id": malId == null ? null : malId,
        "format": format == null ? null : format,
        "status": status == null ? null : status,
        "titles": titles == null ? null : titles.toJson(),
        "descriptions": descriptions == null ? null : descriptions.toJson(),
        "start_date": startDate == null ? null : startDate.toIso8601String(),
        "end_date": endDate == null ? null : endDate.toIso8601String(),
        "season_period": seasonPeriod == null ? null : seasonPeriod,
        "season_year": seasonYear == null ? null : seasonYear,
        "episodes_count": episodesCount == null ? null : episodesCount,
        "episode_duration": episodeDuration == null ? null : episodeDuration,
        "cover_image": coverImage == null ? null : coverImage,
        "cover_color": coverColor == null ? null : coverColor,
        "banner_image": bannerImage == null ? null : bannerImage,
        "genres":
            genres == null ? null : List<dynamic>.from(genres.map((x) => x)),
        "score": score == null ? null : score,
        "id": id == null ? null : id,
      };
}

class Descriptions {
  Descriptions({
    @required this.en,
    @required this.it,
  });

  final String en;
  final String it;

  factory Descriptions.fromJson(Map<String, dynamic> json) => Descriptions(
        en: json["en"] == null ? null : json["en"],
        it: json["it"] == null ? null : json["it"],
      );

  Map<String, dynamic> toJson() => {
        "en": en == null ? null : en,
        "it": it == null ? null : it,
      };
}

class Titles {
  Titles({
    @required this.en,
    @required this.jp,
    @required this.it,
  });

  final String en;
  final String jp;
  final String it;

  factory Titles.fromJson(Map<String, dynamic> json) => Titles(
        en: json["en"] == null ? null : json["en"],
        jp: json["jp"] == null ? null : json["jp"],
        it: json["it"] == null ? null : json["it"],
      );

  Map<String, dynamic> toJson() => {
        "en": en == null ? null : en,
        "jp": jp == null ? null : jp,
        "it": it == null ? null : it,
      };
}
