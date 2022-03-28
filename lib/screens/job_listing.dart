import 'package:flutter/material.dart';
import 'package:jobposting/screens/LoginScreen.dart';
import 'AddJob.dart';
import 'EditJob.dart';

class listjobs extends StatefulWidget {
  const listjobs({Key? key}) : super(key: key);

  @override
  State<listjobs> createState() => listjobsState();
}

class listjobsState extends State<listjobs> {
  List<Methodtitle> items = [];
  TextEditingController searchController = TextEditingController();
  List<Methodtitle> itemsOnSearch = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191720),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 79, left: 27, bottom: 59, right: 27),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Usaid Asif", style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.w300)),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const LoginScreen()));
                      },
                      child: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 19),
            Container(
              height: 56,
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1C24),
                border: Border.all(color: const Color(0xff5D5D67), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: searchController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xff5D5D67),
                    ),
                    border: InputBorder.none,
                    hintText: "Search keywords..",
                    hintStyle:
                        TextStyle(color: Color(0xff8F8F9E), fontSize: 15)),
              ),
            ),
            const SizedBox(height: 26),
            items.isNotEmpty ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: updateAccordingToSearch(
                        items.length, itemsOnSearch.length),
                    itemBuilder: updateList,
                  )
                : const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 200),
                      child: Text("No Items Available", style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
          ]),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push<Methodtitle>(MaterialPageRoute(builder: (_) => const addjob()))
              .then((value) => setState(() {
                    if (value?.first != "" && value?.second != "") {
                      items.add(Methodtitle(value!.first, value.second));
                    }
                  }));
        },
        child: const Icon(
          Icons.add_circle_sharp,
          color: Color(0xffE5E5E5),
          size: 50,
        ),
      ),
    );
  }

  Widget updateList(BuildContext, int index) => Container(
        height: 102,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: const Color(0xff201E27),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].first,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      items[index].second,
                      style: const TextStyle(
                        color: Color(0xff8F8F9E),
                        fontSize: 12,
                      ),
                    )
                  ],
                )),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push<Methodtitle>(MaterialPageRoute(builder: (_) => EditJob
                      (postiontext: items[index].first, desctext: items[index].second)))
                        .then((value) => setState(() {
                              if (value?.first != "" && value?.second != "") {
                                items[index].first = value!.first;
                                items[index].second = value.second;
                              }
                            }));
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 27),
                    child: Icon(
                      Icons.edit_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  child: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
        ),
      );

  updateAccordingToSearch(int item, int searchItem) {
    int value;
    if (searchController.text.isNotEmpty) {
      value = searchItem;
    } else {
      value = item;
    }
    return value;
  }
}
