class User {
	int? id;
	String? name;
	String? email;
	String? mobile;
	dynamic profilePhoto;
	dynamic gender;

	User({
		this.id, 
		this.name, 
		this.email, 
		this.mobile, 
		this.profilePhoto, 
		this.gender, 
	});

	factory User.fromJson(Map<String, dynamic> json) => User(
				id: json['id'] as int?,
				name: json['name'] as String?,
				email: json['email'] as String?,
				mobile: json['mobile'] as String?,
				profilePhoto: json['profile_photo'] as dynamic,
				gender: json['gender'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'email': email,
				'mobile': mobile,
				'profile_photo': profilePhoto,
				'gender': gender,
			};
}
