import 'package:pills_reminder/services/db_helper.dart';

class DrugModel {
  int id;
  String drugname;
  String drugdose;
  String imageUrl;

  // int date;
  // String time;

  bool isMedicine;

  DrugModel({
    this.id,
    this.drugname,
    this.drugdose,
    //this.imageUrl,
    // this.time,
    // this.date,
    this.isMedicine,
  });

  DrugModel.fromMap(Map map) {
    this.id = map[DBHelper.drugIdColumn];
    this.drugname = map[DBHelper.drugNameColumnn];
    this.drugdose = map[DBHelper.drugDoseColumn];
    //   this.imageUrl = map[DBHelper.drugImageUrl];

    // this.date = map[DBHelper.drugDateColumnn];
    // this.time = map[DBHelper.drugTimeColumn];
    this.isMedicine =
        map[DBHelper.drugIsMedicineColumnName] == 1 ? true : false;
  }

  Map<String, dynamic> toMap() {
    return {
      DBHelper.drugNameColumnn: this.drugname,
      DBHelper.drugDoseColumn: this.drugdose,
      //DBHelper.drugImageUrl: this.imageUrl,

      // DBHelper.drugDateColumnn: this.date,
      // DBHelper.drugTimeColumn: this.time,
      DBHelper.drugIsMedicineColumnName: this.isMedicine ? 1 : 0
    };
  }
}
