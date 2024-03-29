
import 'package:toeic/model/Image.dart';

// class User {
//   bool? confirmed;
//   bool? blocked;
//   String? sId;
//   String? username;
//   String? email;
//   String? provider;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;
//   Role? role;
//   String? id;
//   User({
//     this.confirmed,
//     this.blocked,
//     this.sId,
//     this.username,
//     this.email,
//     this.provider,
//     this.createdAt,
//     this.updatedAt,
//     this.iV,
//     this.role,
//     this.id,
//   });

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};

//     if (confirmed != null) {
//       result.addAll({'confirmed': confirmed});
//     }
//     if (blocked != null) {
//       result.addAll({'blocked': blocked});
//     }
//     if (sId != null) {
//       result.addAll({'sId': sId});
//     }
//     if (username != null) {
//       result.addAll({'username': username});
//     }
//     if (email != null) {
//       result.addAll({'email': email});
//     }
//     if (provider != null) {
//       result.addAll({'provider': provider});
//     }
//     if (createdAt != null) {
//       result.addAll({'createdAt': createdAt});
//     }
//     if (updatedAt != null) {
//       result.addAll({'updatedAt': updatedAt});
//     }
//     if (iV != null) {
//       result.addAll({'iV': iV});
//     }
//     if (role != null) {
//       result.addAll({'role': role!.toMap()});
//     }
//     if (id != null) {
//       result.addAll({'id': id});
//     }

//     return result;
//   }

//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       confirmed: map['confirmed'],
//       blocked: map['blocked'],
//       sId: map['sId'],
//       username: map['username'],
//       email: map['email'],
//       provider: map['provider'],
//       createdAt: map['createdAt'],
//       updatedAt: map['updatedAt'],
//       iV: map['iV']?.toInt(),
//       role: map['role'] != null ? Role.fromMap(map['role']) : null,
//       id: map['id'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory User.fromJson(String source) => User.fromMap(json.decode(source));
// }

// class Role {
//   String? sId;
//   String? name;
//   String? description;
//   String? type;
//   int? iV;
//   String? id;
//   Role({
//     this.sId,
//     this.name,
//     this.description,
//     this.type,
//     this.iV,
//     this.id,
//   });

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};

//     if (sId != null) {
//       result.addAll({'sId': sId});
//     }
//     if (name != null) {
//       result.addAll({'name': name});
//     }
//     if (description != null) {
//       result.addAll({'description': description});
//     }
//     if (type != null) {
//       result.addAll({'type': type});
//     }
//     if (iV != null) {
//       result.addAll({'iV': iV});
//     }
//     if (id != null) {
//       result.addAll({'id': id});
//     }

//     return result;
//   }

//   factory Role.fromMap(Map<String, dynamic> map) {
//     return Role(
//       sId: map['sId'],
//       name: map['name'],
//       description: map['description'],
//       type: map['type'],
//       iV: map['iV']?.toInt(),
//       id: map['id'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Role.fromJson(String source) => Role.fromMap(json.decode(source));
// }
// class User {
//   User? user;

//   User({this.user});

//   User.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.user != null) {
//       data['user'] = this.user!.toJson();
//     }
//     return data;
//   }
// }

class User {
  bool? confirmed;
  bool? blocked;
  String? sId;
  String? username;
  String? email;
  String? provider;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Role? role;
  UserInfor? userInfor;
  // List<Null>? answerSheets;
  String? id;

  User(
      {this.confirmed,
      this.blocked,
      this.sId,
      this.username,
      this.email,
      this.provider,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.role,
      this.userInfor,
      // this.answerSheets,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    provider = json['provider'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    userInfor = json['user_infor'] != null
        ? UserInfor.fromJson(json['user_infor'])
        : null;
    // if (json['answer_sheets'] != null) {
    //   answerSheets = <Null>[];
    //   json['answer_sheets'].forEach((v) {
    //     answerSheets!.add(new Null.fromJson(v));
    //   });
    // }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['confirmed'] = confirmed;
    data['blocked'] = blocked;
    data['_id'] = sId;
    data['username'] = username;
    data['email'] = email;
    data['provider'] = provider;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    if (userInfor != null) {
      data['user_infor'] = userInfor!.toJson();
    }
    // if (this.answerSheets != null) {
    //   data['answer_sheets'] =
    //       this.answerSheets!.map((v) => v.toJson()).toList();
    // }
    data['id'] = id;
    return data;
  }
}

class Role {
  String? sId;
  String? name;
  String? description;
  String? type;
  int? iV;
  String? id;

  Role({this.sId, this.name, this.description, this.type, this.iV, this.id});

  Role.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    iV = json['__v'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    data['type'] = type;
    data['__v'] = iV;
    data['id'] = id;
    return data;
  }
}

class UserInfor {
  ImageModel? image;
  String? sId;
  String? phone;
  String? fullname;
  String? address;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? usersPermissionsUser;
  String? id;

  UserInfor(
      {this.image,
      this.sId,
      this.phone,
      this.fullname,
      this.address,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.usersPermissionsUser,
      this.id});

  UserInfor.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null && json['image'] is! List<dynamic>
        ? ImageModel.fromJson(json['image'])
        : null;
    sId = json['_id'];
    phone = json['phone'];
    fullname = json['fullname'];
    address = json['address'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    usersPermissionsUser = json['users_permissions_user'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (image != null) {
      data['Image'] = image!.toJson();
    }
    data['_id'] = sId;
    data['phone'] = phone;
    data['fullname'] = fullname;
    data['address'] = address;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['users_permissions_user'] = usersPermissionsUser;
    data['id'] = id;
    return data;
  }
}
