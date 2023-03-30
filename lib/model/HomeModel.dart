class GroupExam {
  List<Groupexams>? groupexams;

  GroupExam({this.groupexams});

  GroupExam.fromJson(Map<String, dynamic> json) {
    if (json['groupexams'] != null) {
      groupexams = <Groupexams>[];
      json['groupexams'].forEach((v) {
        groupexams!.add(Groupexams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (groupexams != null) {
      data['groupexams'] = groupexams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Groupexams {
  List<ExamData>? exams;
  String? sId;
  String? name;
  String? description;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? id;

  Groupexams(
      {this.exams,
      this.sId,
      this.name,
      this.description,
      this.publishedAt,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.id});

  Groupexams.fromJson(Map<String, dynamic> json) {
    if (json['exams'] != null) {
      exams = <ExamData>[];
      json['exams'].forEach((v) {
        exams!.add(ExamData.fromJson(v));
      });
    }
    sId = json['_id'];
    name = json['Name'];
    description = json['description'];
    publishedAt = json['published_at'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (exams != null) {
      data['exams'] = exams!.map((v) => v.toJson()).toList();
    }
    data['_id'] = sId;
    data['Name'] = name;
    data['description'] = description;
    data['published_at'] = publishedAt;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['id'] = id;
    return data;
  }
}

class ExamData {
  String? sId;
  String? name;
  String? descripton;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  int? iV;

  String? id;

  ExamData(
      {this.sId,
      this.name,
      this.descripton,
      this.publishedAt,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.id});

  ExamData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    descripton = json['descripton'];
    publishedAt = json['published_at'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];

    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['descripton'] = descripton;
    data['published_at'] = publishedAt;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;

    data['id'] = id;
    return data;
  }
}
