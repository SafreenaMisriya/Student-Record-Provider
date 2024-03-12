// ignore_for_file: must_be_immutable
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_10/database/db_model.dart';
import 'package:sqflite_10/provider/Provider_edit.dart';

class EditStudent extends StatelessWidget {
  StudentModel student;
  EditStudent({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
 Provider.of<EditProvider>(context,listen: false).initiate(
        imagepath: student.imagex,
        name: student.name,
        studentclass: student.classname,
        father: student.father,
        pnumber: student.pnumber);
    return Consumer<EditProvider>(
      builder: (BuildContext context, editstudent, child) => 
       Scaffold(
        appBar: AppBar(
          title: const Text('Edit Student'),
          actions: [
            IconButton(
              onPressed: () {
                editstudent.editstudentclicked(
                  context,
                  student,
                  editstudent
                );
              },
              icon: const Icon(Icons.cloud_upload),
            )
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key:  editstudent.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        InkWell(
                          onTap: () =>  editstudent.editphoto(
                              context,  editstudent, context),
                          child: CircleAvatar(
                            backgroundImage:
                                FileImage(File( editstudent.updatedImagepath)),
                            radius: 80,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller: editstudent.nameController,
                            decoration: InputDecoration(
                              labelText: "Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a Name';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller:  editstudent.classController,
                            decoration: InputDecoration(
                              labelText: "Class",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a Class';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller:  editstudent.guardianController,
                            decoration: InputDecoration(
                              labelText: "Parent",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Parent Name';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller:  editstudent.mobileController,
                            decoration: InputDecoration(
                              labelText: "Mobile",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a Mobile';
                              } else if (value.length != 10) {
                                return 'Mobile number should be 10 digits';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
