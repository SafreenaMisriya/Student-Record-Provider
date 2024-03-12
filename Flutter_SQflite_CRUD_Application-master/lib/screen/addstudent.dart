import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_10/provider/provider_addstudent.dart';
import 'package:sqflite_10/screen/textformfield.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<AddProvider>(context, listen: false).initialization();
    return Consumer<AddProvider>(
      builder: (context, addStudent, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text('Add Student'),
          actions: [
            IconButton(
              onPressed: () {
                addStudent.addstudentclicked(context, addStudent);
              },
              icon: const Icon(Icons.save_alt_outlined),
            )
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: addStudent.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                          backgroundImage: addStudent.imagepath.isNotEmpty
                              ? FileImage(File(addStudent.imagepath))
                              : const AssetImage('assets/profile.png')
                                  as ImageProvider,
                          radius: 99),
                      Positioned(
                        bottom: 20,
                        right: 5,
                        child: IconButton(
                          onPressed: () {
                            addStudent.addphoto(context, addStudent, context);
                          },
                          icon: const Icon(Icons.camera_alt),
                          color: Colors.white,
                          iconSize: 40,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  ReuseTextFormField(
                    controller: addStudent.nameController,
                    labelText: "Name",
                    hintText: 'enter name',
                    keyboardType: TextInputType.name,
                    validationMessage: 'Please enter a Name',
                  ),
                  const SizedBox(height: 20),
                  ReuseTextFormField(
                      controller: addStudent.classController,
                      labelText: "Class",
                      hintText: 'enter class',
                      keyboardType: TextInputType.text,
                      validationMessage: 'Please enter a Class'),
                  const SizedBox(height: 20),
                  ReuseTextFormField(
                      controller: addStudent.guardianController,
                      labelText: "Guardian",
                      hintText: 'enter Guardian name',
                      keyboardType: TextInputType.name,
                      validationMessage: 'Please enter a Guardian'),
                  const SizedBox(height: 20),
                  ReuseTextFormField(
                      controller: addStudent.mobileController,
                      labelText: "Mobile",
                      hintText: 'Mobile Number',
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      validationMessage: 'Please enter Mobile Number'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
