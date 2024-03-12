import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite_10/database/db_functions.dart';
import 'package:sqflite_10/database/db_model.dart';

class AddProvider extends ChangeNotifier {
  String imagepath = "";
  final formKey = GlobalKey<FormState>();
  addimage(String image) {
    imagepath = image;
    notifyListeners();
  }
     initialization() {
        imagepath = '';
        nameController.clear();
        classController.clear();
        guardianController.clear();
        mobileController.clear();
      }

  final nameController = TextEditingController();
  final classController = TextEditingController();
  final guardianController = TextEditingController();
  final mobileController = TextEditingController();
  Future<void> addstudentclicked(mtx, AddProvider addProvider ) async {
    if (formKey.currentState!.validate() && addProvider.imagepath.isNotEmpty) {
      final name = addProvider.nameController.text.toUpperCase();
      final classA = addProvider.classController.text.toString().trim();
      final father = addProvider.guardianController.text;
      final phonenumber = addProvider.mobileController.text.trim();

      final stdData = StudentModel(
        name: name,
        classname: classA,
        father: father,
        pnumber: phonenumber,
        imagex:addProvider.imagepath,
      );
      await addstudent(stdData, addProvider);

      ScaffoldMessenger.of(mtx).showSnackBar(
        const SnackBar(
          content: Text("Successfully added"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
   
   initialization();
   Navigator.of(mtx).pop();
    } else {
      ScaffoldMessenger.of(mtx).showSnackBar(
        const SnackBar(
          content: Text('Add Profile Picture '),
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> getimage(ImageSource source, AddProvider addProvider) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }
    addProvider.addimage(image.path);
  }

  void addphoto(ctxr, AddProvider addprovider, context) {
    showDialog(
      context: ctxr,
      builder: (ctxr) {
        return AlertDialog(
          content: const Text('Profile'),
          actions: [
            IconButton(
              onPressed: () {
                getimage(ImageSource.camera, addprovider);
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.camera_alt_rounded,
                color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: () {
                getimage(ImageSource.gallery, addprovider);
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.image,
                color: Colors.red,
              ),
            ),
          ],
        );
      },
    );
  }
}
