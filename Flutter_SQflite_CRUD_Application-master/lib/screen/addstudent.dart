import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_10/provider/provider_addstudent.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
   Provider.of<AddProvider>(context,listen: false).initialization();
    return Consumer<AddProvider>(
      builder: (context, addStudent, child) => 
       Scaffold(
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
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: addStudent.nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: 'enter name',
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
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: addStudent.classController,
                    decoration: InputDecoration(
                      labelText: "Class",
                      hintText: 'enter class',
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
                  const SizedBox(height: 20),
      
                  // Guardian input field with validation
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: addStudent.guardianController,
                    decoration: InputDecoration(
                      labelText: "Guardian",
                      hintText: 'enter Guardian name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a Guardian';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
      
                  // Mobile input field with validation
                  TextFormField(
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    controller:addStudent.mobileController,
                    decoration: InputDecoration(
                      labelText: "Mobile",
                      hintText: 'Mobile Number',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
