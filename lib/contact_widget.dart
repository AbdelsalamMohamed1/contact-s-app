import 'dart:io';

import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  String name;
  String email;
  String phoneNumber;
  File image;
  Function onClick;
  int index;

  ContactWidget(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.image,
      required this.onClick,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xfffff1d4), borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(5),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 3,
                  child: Image.file(
                    image,
                    fit: BoxFit.fill,
                  )),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          ImageIcon(AssetImage('assets/images/ic_mail.png')),
                          Text(' $email'),
                        ],
                      ),
                      Row(
                        children: [
                          ImageIcon(
                              AssetImage('assets/images/ic_PhoneCall.png')),
                          Text(' $phoneNumber'),
                        ],
                      ),
                      Expanded(child: Container()),
                      ElevatedButton(
                          onPressed: () {
                            onClick(index);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageIcon(
                                AssetImage('assets/images/ic_trashCan.png'),
                                color: Colors.white,
                              ),
                              Text(
                                ' delete',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),style: ElevatedButton.styleFrom(backgroundColor:Color(0xfff93e3e) ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(bottom: 3, left: 7),
                  decoration: BoxDecoration(
                      color: Color(0xfffff1d4),
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(name)))
        ],
      ),
    );
  }
}
