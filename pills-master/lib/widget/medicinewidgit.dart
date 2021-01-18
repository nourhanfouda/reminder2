import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pills_reminder/UI/6addmed1.dart';
import 'package:pills_reminder/models/chooseMedmodel.dart';
import 'package:pills_reminder/models/drug_model.dart';
import 'package:pills_reminder/providers/database_provider.dart';
import 'package:pills_reminder/utilities/Colors.dart';
import 'package:provider/provider.dart';

class Medicinewedgit extends StatefulWidget {
  DrugModel drugModel;
  Medicinewedgit({this.drugModel});

  @override
  _MedicinewedgitState createState() => _MedicinewedgitState();
}

class _MedicinewedgitState extends State<Medicinewedgit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 500,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 9,
                  spreadRadius: 5,
                  offset: Offset(0, 0.9),
                ),
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/capsules.jpg'),
                        fit: BoxFit.cover),
                  ),
                  width: 100,
                  height: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.drugModel.drugname,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    Text(
                      widget.drugModel.drugdose,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    Text(
                      ' model.time',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: maincolor),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Consumer<Databaseprovider>(
                builder: (context, value, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        icon: Icon(Icons.edit),
                        color: maincolor,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddMed(
                                  drugModel: widget.drugModel,
                                  edit: 1,
                                ),
                              ));
                        }),
                    IconButton(
                        icon: Icon(Icons.delete),
                        color: maincolor,
                        onPressed: () {
                          context
                              .read<Databaseprovider>()
                              .deletedrug(widget.drugModel);
                        }),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
