import 'package:bookstore/Dataservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TextEditingController _controller;



  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  Dataservice _dataservice = Dataservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _dataservice.DataService("flutter"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: SizedBox(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    print("object");
                                  },
                                  icon: Icon(Icons.menu_outlined),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.notifications),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 45,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Stack(
                                children: [
                                  TextField(
                                    controller: _controller,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    style: GoogleFonts.signikaNegative(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.search,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            left: 16, right: 50, bottom: 6),
                                        border: InputBorder.none,
                                        hintText: "Search books...",
                                        hintStyle: GoogleFonts.signikaNegative(
                                          fontSize: 17,
                                          color: Colors.grey.shade400,
                                        )),
                                  ),
                                  const Positioned(
                                    right: 10,
                                    top: 9,
                                    child:Icon(Icons.menu_outlined),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 524,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(80),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 90,),
                          Container(
                            height: 230,
                            color: Colors.transparent,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        children:[ ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Image.network(_dataservice.data['items']
                                          [index]['volumeInfo']['imageLinks']
                                          ['thumbnail']
                                              .toString(),
                                            fit: BoxFit.fill,
                                            width: 130,
                                            height: 135,
                                          ),
                                        ),
                                          Container(
                                            padding: EdgeInsets.only(left: 8,),
                                            height: 65,
                                            width: 130,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 2,),
                                                  Text(_dataservice.data['items']
                                                  [index]['volumeInfo']['authors']
                                                  [0]
                                                      .toString(),textAlign: TextAlign.start,style:GoogleFonts.akshar(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.normal,
                                                    color: Colors.black,
                                                  ),),
                                                const SizedBox(height: 5,),
                                                Text(_dataservice.data['items']
                                                [index]['volumeInfo']['title']
                                                    .toString(),style: GoogleFonts.calistoga(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),),
                                              ],
                                            ),
                                          )
                                    ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
