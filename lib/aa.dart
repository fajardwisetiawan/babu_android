import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:babu_apk/page/detailBeritaPage.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class Aa extends StatefulWidget {
  List list;
  int index;
  Aa({this.index, this.list});
  @override
  _AaState createState() => _AaState();
}

class _AaState extends State<Aa> {
  TextEditingController controllerSearch = new TextEditingController();

  var nSearch = "aku";

  List data;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      getData();
    }
  }

  Future<Null> getData() async {
    if (nSearch == '' || nSearch == null) {
      nSearch = 'aku';
    }
    Map param = {'search': nSearch};
    var res = await http.post("http://192.168.0.144:3000/search", body: param);
    if (this.mounted) {
      print(res.statusCode);
      if (res.statusCode == 200) {
        setState(() {
          try {
            data = json.decode(res.body)['data'];
          } catch (e) {
            print("Error: $e");
          }
        });
      }
    }
  }

  // Future<List<Map<String, dynamic>>> getData() async {
  //   // Map data = {
  //   //   'search': 'dimana'
  //   // };
  //   final response =
  //       await http.post("http://192.168.0.144:3000/search", body: {
  //     "search": controllerSearch.text,
  //   });
  //   // String asd = widget.list[widget.index]['_id']
  //   return List<Map<String, dynamic>>.from(json.decode(response.body)['data']);
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: new IconButton(
          color: Colors.black54,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Container(
          height: 35.0,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: TextField(
            controller: controllerSearch,
            textInputAction: TextInputAction.search,
            onChanged: (value) {
              getData();
              setState(() {
                nSearch = controllerSearch.text;
              });
            },
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.black45,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.grey[400], width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.grey[200], width: 1.0),
              ),
              hintText: 'Cari BABU',
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FutureBuilder<List>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? ItemList(list: snapshot.data)
                    : Column(
                        children: [
                          Container(
                            color: Colors.transparent,
                            height: 145.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13.0, vertical: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      height: 130.0,
                                      width: 70.0,
                                      child: Shimmer.fromColors(
                                          baseColor: Color(0XFFededed),
                                          highlightColor: Colors.white,
                                          child: Container(
                                            height: 130.0,
                                            width: 70.0,
                                            color: Color(0xFFededed),
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Wrap(
                                              children: <Widget>[
                                                SizedBox(
                                                  width: double.infinity,
                                                  height: 20.0,
                                                  child: Shimmer.fromColors(
                                                    baseColor:
                                                        Color(0XFFededed),
                                                    highlightColor:
                                                        Colors.white,
                                                    child: Container(
                                                      height: 20.0,
                                                      width: double.infinity,
                                                      color: Color(0xFFededed),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 2.0,
                                            ),
                                            SizedBox(
                                              width: 60.0,
                                              height: 25.0,
                                              child: Shimmer.fromColors(
                                                baseColor: Color(0XFFededed),
                                                highlightColor: Colors.white,
                                                child: Container(
                                                  height: 25.0,
                                                  width: 60.0,
                                                  color: Color(0xFFededed),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2.0,
                                            ),
                                            SizedBox(
                                              width: 60.0,
                                              height: 25.0,
                                              child: Shimmer.fromColors(
                                                baseColor: Color(0XFFededed),
                                                highlightColor: Colors.white,
                                                child: Container(
                                                  height: 25.0,
                                                  width: 60.0,
                                                  color: Color(0xFFededed),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.0,
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          height: 20.0,
                                          child: Shimmer.fromColors(
                                            baseColor: Color(0XFFededed),
                                            highlightColor: Colors.white,
                                            child: Container(
                                              height: 20.0,
                                              width: double.infinity,
                                              color: Color(0xFFededed),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new DetailBeritaPage(
                      list: list,
                      index: i,
                    ))),
            child: Container(
              color: Colors.transparent,
              height: 145.0,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 120.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(
                            // image: list[i]['img'] == ""
                            //     ? AssetImage("assets/images/0images.png")
                            //     : NetworkImage(list[i]['img']),
                            image: AssetImage("assets/images/0images.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Wrap(
                                children: <Widget>[
                                  Text(
                                    list[i]['judul'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.red[600],
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    list[i]['chanel'],
                                    style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontSize: 13.0,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            list[i]['readmore'] == ""
                                ? ""
                                : list[i]['readmore'],
                            // list[i]['readmore'],
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 13.0,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
