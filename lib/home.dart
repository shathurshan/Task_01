import 'package:flutter/material.dart';
import 'package:task_o1/models/userinfo.dart';
import 'package:task_o1/services/api_manager.dart';
import 'package:task_o1/widgets/drop_down.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _quantity = "";
  bool isData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiManager().getUser();
    isData = true;
  }

  @override
  Widget build(BuildContext context) {
    var result;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(45),
          child: isData
              ? FutureBuilder<Suppliers>(
                  future: ApiManager().getUser(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<String?> dataList = [];

                    dataList.clear();
                    dataList.add('hello');
                    for (int i = 0; i < snapshot.data!.result.length; i++) {
                      dataList.add(snapshot.data!.result[i].supplier_name);
                    }
                    return Container(
                      child: Column(
                        children: [
                          const Text("Suppliers Name"),
                          const SizedBox(
                            height: 10,
                          ),
                          DropDown(dataList),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Quantity',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.height * 0.01,
                                vertical:
                                    MediaQuery.of(context).size.width * 0.01,
                              ),
                              // labelText: "Product Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please Enter the Quantity";
                              }
                              return null;
                            },
                            onChanged: (val) {
                              setState(() {
                                _quantity = val;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                ApiManager().submit('test', _quantity);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 0,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Text("shathurshan"),
        ),
      ),
    );
  }
}
