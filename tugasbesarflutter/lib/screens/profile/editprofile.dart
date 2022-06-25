// ignore_for_file: unnecessary_const, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:tugasbesarflutter/api.dart';
import 'package:tugasbesarflutter/models/user.dart';
import 'package:tugasbesarflutter/screens/profile/profile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key, required this.data}) : super(key: key);

  final User data;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  FilePickerResult? result;
  PlatformFile? file;

  void pickFiles() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png']
    );
    if(result == null) return;

    file = result?.files.first;

    setState(() {
      
    });
    // viewFile(file!);

  }

  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller1.text = widget.data.name;
    _controller2.text = widget.data.email;
    _controller3.text = "";
    _controller4.text = widget.data.job;
    _controller5.text = widget.data.faculty;
    _controller6.text = widget.data.bio;
  }

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0x00d9d9d9),
            elevation: 1,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop(MaterialPageRoute(builder: (context) {
                  return const Profile();
                }));
              },
            ),
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/img/Hiro_Circle.png')),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              // ignore: use_full_hex_values_for_flutter_colors
                              color: const Color(0xffff70d4e),
                            ),
                            child: 
                              IconButton(
                                icon: const Icon(Icons.edit),
                                color: Colors.white,
                                iconSize: 20,
                                splashRadius: 40,
                                splashColor: Colors.deepOrange,               
                                onPressed: () {
                                  pickFiles();
                                },

                              )


                            // child: ElevatedButton(
                            //   onPressed: () {},
                            //   child: Center(
                            //     child: const Icon(
                            //       Icons.edit,
                            //       color: Colors.white,
                            //     ),
                            //   ),
                            //   // ignore: use_full_hex_values_for_flutter_colors
                            //   style: ButtonStyle(
                            //     shape: MaterialStateProperty.all(
                            //       RoundedRectangleBorder(
                            //         // Change your radius here
                            //         borderRadius: BorderRadius.circular(16),
                            //       ),
                            //     ),
                            //   ),
                            // )
                            
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                createTextField(
                    "Full Name", widget.data.name, false, _controller1),
                createTextField(
                    "Email", widget.data.email, false, _controller2),
                createTextField("Password", "***********", true, _controller3),
                createTextField(
                    "Pekerjaan", widget.data.job, false, _controller4),
                createTextField(
                    "Fakultas", widget.data.faculty, false, _controller5),
                createTextField(
                    "Deskripsi", widget.data.bio, false, _controller6),
                RaisedButton(
                  onPressed: () {
                    updateUser(
                        _controller1.text,
                        _controller2.text,
                        _controller3.text,
                        _controller4.text,
                        _controller5.text,
                        _controller6.text);
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return const Profile();
                    }));
                  },
                  // ignore: use_full_hex_values_for_flutter_colors
                  color: const Color(0xffff70d4e),
                  child: const Text(
                    "Simpan",
                    style: TextStyle(
                        fontFamily: "Poppins-light",
                        fontSize: 14,
                        letterSpacing: 2,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        );
  }

  Widget createTextField(String labelText, String placeholder, bool isPassword,
      TextEditingController _controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: _controller,
        obscureText: isPassword ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: labelText,
            hintStyle: const TextStyle(
                fontFamily: 'Poppins-light',
                fontSize: 16,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
