import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:pills_reminder/models/drug_model.dart';
import 'package:pills_reminder/services/db_helper.dart';

class Databaseprovider extends ChangeNotifier {
  List<DrugModel> drugmodel = [];
  List<DrugModel> medicine = [];
  List<DrugModel> vitamine = [];

  fillLists(List<DrugModel> drugmodell) {
    this.drugmodel = drugmodell;
    this.medicine = drugmodel.where((element) => element.isMedicine).toList();
    this.vitamine = drugmodel.where((element) => !element.isMedicine).toList();
    notifyListeners();
  }

  insertNewdrug(DrugModel drugmodel) async {
    await DBHelper.dbHelper.insertNewdrug(drugmodel);
    getAlldrugs();
  }

  getAlldrugs() async {
    List<Map<String, dynamic>> rows = await DBHelper.dbHelper.selectAlldrugs();
    List<DrugModel> drugs =
        rows != null ? rows.map((e) => DrugModel.fromMap(e)).toList() : [];
    fillLists(drugs);
  }

  /*
  *   getAllNote() async {
    List<Map<String, dynamic>> rows = await DBHelper.dbHelper.getAllNote();
    List<Note> notes =
        rows != null ? rows.map((e) => Note.fromMap(e)).toList() : [];
    fillLists(notes);
  }
  * */

  updatedrug(DrugModel drugmodel) async {
    await DBHelper.dbHelper.updateDrug(drugmodel);
    getAlldrugs();
  }

  deletedrug(DrugModel drugmodel) async {
    await DBHelper.dbHelper.deletedrug(drugmodel.id);
    getAlldrugs();
  }
}
