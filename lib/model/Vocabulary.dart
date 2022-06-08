import 'package:toeic/model/Audio.dart';
import 'package:toeic/model/Image.dart';

class GroupVocabulary {
  List<GroupVocabularies>? groupVocabularies;

  GroupVocabulary({this.groupVocabularies});

  GroupVocabulary.fromJson(Map<String, dynamic> json) {
    if (json['group-vocabularies'] != null) {
      groupVocabularies = <GroupVocabularies>[];
      json['group-vocabularies'].forEach((v) {
        groupVocabularies!.add(new GroupVocabularies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.groupVocabularies != null) {
      data['group-vocabularies'] =
          this.groupVocabularies!.map((v) => v.toJson()).toList();
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
        vocabularies!.add(new Vocabularies.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vocabularies != null) {
      data['vocabularies'] = this.vocabularies!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['Title'] = this.title;
    data['published_at'] = this.publishedAt;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['id'] = this.id;
    data['Description'] = this.description;
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
    image =
        json['Image'] != null ? new ImageModel.fromJson(json['Image']) : null;
    description = json['Description'];
    audio = json['Audio'] != null ? new Audio.fromJson(json['Audio']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Word'] = this.word;
    data['published_at'] = this.publishedAt;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.image != null) {
      data['Image'] = this.image!.toJson();
    }
    data['Description'] = this.description;

    data['id'] = this.id;
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
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    large =
        json['large'] != null ? new Thumbnail.fromJson(json['large']) : null;
    medium =
        json['medium'] != null ? new Thumbnail.fromJson(json['medium']) : null;
    small =
        json['small'] != null ? new Thumbnail.fromJson(json['small']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    if (this.large != null) {
      data['large'] = this.large!.toJson();
    }
    if (this.medium != null) {
      data['medium'] = this.medium!.toJson();
    }
    if (this.small != null) {
      data['small'] = this.small!.toJson();
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
  Null? path;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['hash'] = this.hash;
    data['ext'] = this.ext;
    data['mime'] = this.mime;
    data['width'] = this.width;
    data['height'] = this.height;
    data['size'] = this.size;
    data['path'] = this.path;
    data['url'] = this.url;
    return data;
  }
}
