import 'package:assignment_3/contact_form.dart';
import 'package:assignment_3/contact_model.dart';
import 'package:assignment_3/contact_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Contact> contacts = [];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff29384d),
      appBar: AppBar(
        title: Image(
          image: AssetImage('assets/images/logo.png'),
          height: 50,
        ),
        backgroundColor: Color(0xff29384d),
      ),
      body: contacts.isEmpty
          ? Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Container()),
                  Image(
                      image: AssetImage(
                          'assets/images/list-purple-Xetxuqguwn.png')),
                  Text(
                    'There is No Contacts Added Here',
                    style: TextStyle(fontSize: 20, color: Color(0xfffff1d4)),
                  ),
                  Expanded(flex: 2, child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          final selected_contact = await showModalBottomSheet(
                              context: context,
                              builder: (context) => ContactForm());
                          setState(() {
                            contacts.add(selected_contact);
                          });
                        },
                        child: Icon(
                          Icons.add,
                          color: Color(0xff29384d),
                          size: 20,
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            backgroundColor: Color(0xfffff1d4)),
                      )
                    ],
                  )
                ],
              ),
            )
          : Container(
              padding: EdgeInsets.all(10),
              child: Stack(children: [
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return ContactWidget(
                      index: index,
                      name: contacts[index].name,
                      email: contacts[index].email,
                      phoneNumber: contacts[index].number,
                      image: contacts[index].imagePath!,
                      onClick: delete_button_function,
                    );
                  },
                  itemCount: contacts.length,
                  scrollDirection: Axis.vertical,
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            contacts.removeLast();
                            setState(() {});
                          },
                          child:  ImageIcon(
                            AssetImage('assets/images/ic_trashCan.png'),
                            color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                              backgroundColor: Color(0xfff93e3e)),
                        ),
                        SizedBox(height: 10,),
                        ElevatedButton(
                          onPressed: () async {
                            final contact = await showModalBottomSheet(
                                context: context,
                                builder: (context) => ContactForm());
                            contacts.add(contact);
                            setState(() {});
                          },
                          child: Icon(
                            Icons.add,
                            color: Color(0xff29384d),
                            size: 20,
                          ),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              backgroundColor: Color(0xfffff1d4)),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
    );
  }
void delete_button_function(int index){
  setState(() {
    contacts.removeAt(index);
  });
}
}
