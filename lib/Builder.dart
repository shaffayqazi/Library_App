import 'package:bookstore/Dataservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
  }

  Dataservice _dataservice = Dataservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _dataservice.DataService("python"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Discover",
                              style: GoogleFonts.signikaNegative(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      height: 45,
                      margin: EdgeInsets.only(left: 25, right: 25, top: 18),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          TextField(
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            style: GoogleFonts.signikaNegative(
                              fontSize: 20,
                              color: Colors.black,
                            ),
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
                            child: Icon(Icons.search),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 310,
                      color: Colors.blue,
                      child: ListView.builder(
                          padding: EdgeInsets.only(left: 25, right: 6),
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 310,
                              width: 230,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.network(
                                _dataservice.data['items'][index]['volumeInfo']
                                        ['imageLinks']['thumbnail']
                                    .toString(),
                                fit: BoxFit.fill,
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
