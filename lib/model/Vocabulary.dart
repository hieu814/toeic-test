import 'package:toeic/model/Audio.dart';
import 'package:toeic/model/Image.dart';

class GroupVocabulary {
  List<GroupVocabularies>? groupVocabularies;

  GroupVocabulary({this.groupVocabularies});

  GroupVocabulary.fromJson(Map<String, dynamic> json) {
    if (json['group-vocabularies'] != null) {
      groupVocabularies = <GroupVocabularies>[];
      json['group-vocabularies'].forEach((v) {
        groupVocabularies!.add(GroupVocabularies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (groupVocabularies != null) {
      data['group-vocabularies'] =
          groupVocabularies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GroupVocabularies {
  List<Vocabularies>? vocabularies;
  String? sId;
  String? title;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;
  String? description;

  GroupVocabularies(
      {this.vocabularies,
      this.sId,
      this.title,
      this.publishedAt,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.id,
      this.description});

  GroupVocabularies.fromJson(Map<String, dynamic> json) {
    if (json['vocabularies'] != null) {
      vocabularies = <Vocabularies>[];
      json['vocabularies'].forEach((v) {
        vocabularies!.add(Vocabularies.fromJson(v));
      });
    }
    sId = json['_id'];
    title = json['Title'];
    publishedAt = json['published_at'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (vocabularies != null) {
      data['vocabularies'] = vocabularies!.map((v) => v.toJson()).toList();
    }
    data['_id'] = sId;
    data['Title'] = title;
    data['published_at'] = publishedAt;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['id'] = id;
    data['Description'] = description;
    return data;
  }
}

class Vocabularies {
  String? sId;
  String? word;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  int? iV;
  ImageModel? image;
  String? description;
  Audio? audio;
  String? id;
  String? type;
  String? translate;
  String getWord() {
    return word ?? "";
  }

  Vocabularies(
      {this.sId,
      this.word,
      this.publishedAt,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.image,
      this.description,
      this.audio,
      this.id,
      this.type,
      this.translate});

  Vocabularies.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    word = json['Word'];
    translate = json['translate'];
    publishedAt = json['published_at'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    image = json['Image'] != null ? ImageModel.fromJson(json['Image']) : null;
    description = json['Description'];
    audio = json['Audio'] != null ? Audio.fromJson(json['Audio']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['Word'] = word;
    data['published_at'] = publishedAt;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    if (image != null) {
      data['Image'] = image!.toJson();
    }
    data['Description'] = description;

    data['id'] = id;
    return data;
  }
}

class Formats {
  Thumbnail? thumbnail;
  Thumbnail? large;
  Thumbnail? medium;
  Thumbnail? small;

  Formats({this.thumbnail, this.large, this.medium, this.small});

  Formats.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null;
    large = json['large'] != null ? Thumbnail.fromJson(json['large']) : null;
    medium = json['medium'] != null ? Thumbnail.fromJson(json['medium']) : null;
    small = json['small'] != null ? Thumbnail.fromJson(json['small']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    if (large != null) {
      data['large'] = large!.toJson();
    }
    if (medium != null) {
      data['medium'] = medium!.toJson();
    }
    if (small != null) {
      data['small'] = small!.toJson();
    }
    return data;
  }
}

class Thumbnail {
  String? name;
  String? hash;
  String? ext;
  String? mime;
  int? width;
  int? height;
  double? size;
  String? path;
  String? url;

  Thumbnail(
      {this.name,
      this.hash,
      this.ext,
      this.mime,
      this.width,
      this.height,
      this.size,
      this.path,
      this.url});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    width = json['width'];
    height = json['height'];
    size = json['size'];
    path = json['path'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['hash'] = hash;
    data['ext'] = ext;
    data['mime'] = mime;
    data['width'] = width;
    data['height'] = height;
    data['size'] = size;
    data['path'] = path;
    data['url'] = url;
    return data;
  }
}
