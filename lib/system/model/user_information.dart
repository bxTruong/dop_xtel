class UserInformation {
  List<PageRoles>? pageRoles;
  User? user;
  String? token;
  bool? local;

  UserInformation({this.pageRoles, this.user, this.token, this.local});

  UserInformation.fromJson(Map<String, dynamic> json) {
    if (json['pageRoles'] != null) {
      pageRoles = <PageRoles>[];
      json['pageRoles'].forEach((v) {
        pageRoles!.add(new PageRoles.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
    local = json['local'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pageRoles != null) {
      data['pageRoles'] = this.pageRoles!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    data['local'] = this.local;
    return data;
  }
}

class PageRoles {
  int? id;
  String? pageName;
  String? pageUrl;
  Null? pageIcon;
  Null? parentId;
  int? level;
  String? roles;

  PageRoles(
      {this.id, this.pageName, this.pageUrl, this.pageIcon, this.parentId, this.level, this.roles});

  PageRoles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageName = json['pageName'];
    pageUrl = json['pageUrl'];
    pageIcon = json['pageIcon'];
    parentId = json['parentId'];
    level = json['level'];
    roles = json['roles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pageName'] = this.pageName;
    data['pageUrl'] = this.pageUrl;
    data['pageIcon'] = this.pageIcon;
    data['parentId'] = this.parentId;
    data['level'] = this.level;
    data['roles'] = this.roles;
    return data;
  }
}

class User {
  int? id;
  Avatar? avatar;
  String? userName;
  Null? password;
  String? fullName;
  Null? phoneNumber;
  String? personLandlineNumber;
  String? email;
  Null? identificationCard;
  String? address;
  int? status;
  int? approvalStatus;
  String? createBy;
  String? createTime;
  String? updateBy;
  String? updateTime;
  String? birthday;
  int? gender;
  Null? positionType;
  Null? description;
  int? employeeId;
  bool? activePincode;
  Null? language;
  AccountDepartment? accountDepartment;
  String? employeeBranchCode;

  User(
      {this.id,
      this.avatar,
      this.userName,
      this.password,
      this.fullName,
      this.phoneNumber,
      this.personLandlineNumber,
      this.email,
      this.identificationCard,
      this.address,
      this.status,
      this.approvalStatus,
      this.createBy,
      this.createTime,
      this.updateBy,
      this.updateTime,
      this.birthday,
      this.gender,
      this.positionType,
      this.description,
      this.employeeId,
      this.activePincode,
      this.language,
      this.accountDepartment,
      this.employeeBranchCode});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'] != null ? new Avatar.fromJson(json['avatar']) : null;
    userName = json['userName'];
    password = json['password'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    personLandlineNumber = json['personLandlineNumber'];
    email = json['email'];
    identificationCard = json['identificationCard'];
    address = json['address'];
    status = json['status'];
    approvalStatus = json['approvalStatus'];
    createBy = json['createBy'];
    createTime = json['createTime'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    birthday = json['birthday'];
    gender = json['gender'];
    positionType = json['positionType'];
    description = json['description'];
    employeeId = json['employeeId'];
    activePincode = json['activePincode'];
    language = json['language'];
    accountDepartment = json['accountDepartment'] != null
        ? new AccountDepartment.fromJson(json['accountDepartment'])
        : null;
    employeeBranchCode = json['employeeBranchCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.avatar != null) {
      data['avatar'] = this.avatar!.toJson();
    }
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['personLandlineNumber'] = this.personLandlineNumber;
    data['email'] = this.email;
    data['identificationCard'] = this.identificationCard;
    data['address'] = this.address;
    data['status'] = this.status;
    data['approvalStatus'] = this.approvalStatus;
    data['createBy'] = this.createBy;
    data['createTime'] = this.createTime;
    data['updateBy'] = this.updateBy;
    data['updateTime'] = this.updateTime;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['positionType'] = this.positionType;
    data['description'] = this.description;
    data['employeeId'] = this.employeeId;
    data['activePincode'] = this.activePincode;
    data['language'] = this.language;
    if (this.accountDepartment != null) {
      data['accountDepartment'] = this.accountDepartment!.toJson();
    }
    data['employeeBranchCode'] = this.employeeBranchCode;
    return data;
  }
}

class Avatar {
  String? url;
  Null? data;

  Avatar({this.url, this.data});

  Avatar.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['data'] = this.data;
    return data;
  }
}

class AccountDepartment {
  Null? id;
  Null? accountId;
  Null? department;
  Null? position;
  Null? positionTitles;

  AccountDepartment({this.id, this.accountId, this.department, this.position, this.positionTitles});

  AccountDepartment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountId = json['accountId'];
    department = json['department'];
    position = json['position'];
    positionTitles = json['positionTitles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['accountId'] = this.accountId;
    data['department'] = this.department;
    data['position'] = this.position;
    data['positionTitles'] = this.positionTitles;
    return data;
  }
}
