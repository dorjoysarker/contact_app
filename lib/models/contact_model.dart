const tableContact = 'tbl_Contact';
const tblContactColId = 'id';
const tblContactColName = 'name';
const tblContactColMobile = 'mobile';
const tblContactColEmail = 'email';
const tblContactColAddress = 'address';
const tblContactColGender = 'gender';
const tblContactColGroup = 'contact_group';
const tblContactColImage = 'image';
const tblContactColDob = 'dob';
const tblContactColWebsite = 'website';
const tblContactColFavorite = 'favorite';


class ContactModel{
  int? id;
  String name;
  String mobile;
  String email;
  String? streetAddress;
  String? website;
  String? gender;
  String? group;
  String? dob;
  bool favorite;
  String? image;

  ContactModel({
      required this.name,
      required this.mobile,
      required this.email,
      this.streetAddress,
      this.website,
      this.gender,
      this.group,
      this.dob,
      this.favorite = false,
      this.image
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic> {
      tblContactColName : name,
      tblContactColEmail : email,
      tblContactColMobile : mobile,
      tblContactColAddress : streetAddress,
      tblContactColGender : gender,
      tblContactColGroup : group,
      tblContactColDob : dob,
      tblContactColImage : image,
      tblContactColWebsite : website,
      tblContactColFavorite : favorite ? 1 : 0,

    };

    return map;
  }
}