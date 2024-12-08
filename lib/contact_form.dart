import 'dart:io';
import 'package:assignment_3/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ContactForm extends StatefulWidget {
  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  String userName = '';

  String email = '';

  String phoneNumber = '';


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff29384d),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(border: Border.all(color: Color(0xfffff1d4)),borderRadius: BorderRadius.circular(15)),
                      child: InkWell(onTap:(){
                        pickImage();
                      } ,child: selectedImage ==null?Image(image: AssetImage('assets/images/image_picker.gif')): Image.file(selectedImage!,)),
                    )),
                SizedBox(width: 10,),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'username: $userName',
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(color: Color(0xfffff1d4), fontSize: 16),
                      ),
                      const Divider(
                        color: Color(0xfffff1d4),
                        indent: 8,
                        endIndent: 23,
                      ),
                      Text('email: $email',
                        textAlign: TextAlign.start,
                        style:
                        TextStyle(color: Color(0xfffff1d4), fontSize: 16),),
                      const Divider(
                        color: Color(0xfffff1d4),
                        indent: 8,
                        endIndent: 23,
                      ),
                      Text('phone number: $phoneNumber',
                        textAlign: TextAlign.start,
                        style:
                        TextStyle(color: Color(0xfffff1d4), fontSize: 16),),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          Expanded(
            flex: 3,
            child: TextFormField(
              style: TextStyle(color: Color(0xffE2F4F6)),
              decoration: InputDecoration(
                  hintText: 'Enter User Name',
                  hintStyle:
                      const TextStyle(fontSize: 16, color: Color(0xffE2F4F6)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xfffff1d4), width: 3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          const BorderSide(color: Color(0xfffff1d4), width: 3)),
                  focusColor: const Color(0x0029384d),),
              onChanged: (text) {
                setState(() {
                  userName = text;
                });
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: TextFormField(
              style: TextStyle(color: Color(0xffE2F4F6)),
              decoration: InputDecoration(
                  hintText: 'Enter User Email',
                  hintStyle:
                      const TextStyle(fontSize: 16, color: Color(0xffE2F4F6)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xfffff1d4), width: 3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          const BorderSide(color: Color(0xfffff1d4), width: 3)),
                  focusColor: const Color(0x0029384d)),
              onChanged: (text) {
                setState(() {
                  email = text;
                });
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: TextFormField(
              style: TextStyle(color: Color(0xffE2F4F6)),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Enter User Phone Number',
                  hintStyle:
                      const TextStyle(fontSize: 16, color: Color(0xffE2F4F6)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xfffff1d4), width: 3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          const BorderSide(color: Color(0xfffff1d4), width: 3)),
                  focusColor: const Color(0x0029384d)),
              onChanged: (text) {
                setState(() {
                  phoneNumber = text;
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context,Contact(imagePath: selectedImage, name: userName, email: email, number: phoneNumber));
            },
            child: const Text(
              'Enter User',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff29384d)),
            ),
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                backgroundColor: const Color(0xfffff1d4)),
          )
        ],
      ),
    );
  }
  File? selectedImage;
  void pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage=File(image!.path);
    });
  }
}



