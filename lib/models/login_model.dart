class UserData {
  final bool success;
  final UserDataDetails data;
  final String message;
  final dynamic errors;

  UserData({
    required this.success,
    required this.data,
    required this.message,
    required this.errors,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      success: json['success'],
      data: UserDataDetails.fromJson(json['data']),
      message: json['message'],
      errors: json['errors'],
    );
  }
}

class UserDataDetails {
  final int id;
  final String role;
  final bool isParent;
  final bool isPrivacy;
  final DateTime? lastLogin;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String uuid;
  final String firstName;
  final String? lastName;
  final String username;
  final String mobile;
  final String email;
  final dynamic image;
  final dynamic otp;
  final bool isActive;
  final int fkCompany;
  final int createdBy;
  final int fkRole;
  final List<dynamic> groups;
  final List<dynamic> userPermissions;
  final String token;

  UserDataDetails({
    required this.id,
    required this.role,
    required this.isParent,
    required this.isPrivacy,
    required this.lastLogin,
    required this.createdAt,
    required this.updatedAt,
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.mobile,
    required this.email,
    required this.image,
    required this.otp,
    required this.isActive,
    required this.fkCompany,
    required this.createdBy,
    required this.fkRole,
    required this.groups,
    required this.userPermissions,
    required this.token,
  });

  factory UserDataDetails.fromJson(Map<String, dynamic> json) {
    return UserDataDetails(
      id: json['id'],
      role: json['role'],
      isParent: json['is_parent'],
      isPrivacy: json['is_privacy'],
      lastLogin: json['last_login'] != null ? DateTime.parse(json['last_login']) : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      uuid: json['uuid'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      username: json['username'],
      mobile: json['mobile'],
      email: json['email'],
      image: json['image'],
      otp: json['otp'],
      isActive: json['is_active'],
      fkCompany: json['fk_company'],
      createdBy: json['created_by'],
      fkRole: json['fk_role'],
      groups: json['groups'] != null ? List<dynamic>.from(json['groups']) : [],
      userPermissions: json['user_permissions'] != null ? List<dynamic>.from(json['user_permissions']) : [],
      token: json['token'],
    );
  }
}
