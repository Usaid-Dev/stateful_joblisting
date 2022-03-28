import 'package:flutter/material.dart';
import 'package:jobposting/appbuttons.dart';
import 'package:jobposting/screens/job_listing.dart';

class addjob extends StatefulWidget {
  const addjob({Key? key}) : super(key: key);

  @override
  State<addjob> createState() => addingjobState();
}

class addingjobState extends State<addjob> {
  TextEditingController titlefieldController = TextEditingController();
  TextEditingController desfieldController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff191720),
      body: Container(
        padding: const EdgeInsets.only(top: 60, left: 27, bottom: 30, right: 27),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => const listjobs()));
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: const [
                    Text("Add New job", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color(0xFF1E1C24),
                  border: Border.all(color: const Color(0xff5D5D67), width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: TextField(
                controller: titlefieldController,
                style: const TextStyle(color: Colors.white, fontSize: 15),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Position Name",
                    hintStyle:
                        TextStyle(fontSize: 15, color: Color(0xff8F8F9E))),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(10),
              height: 300,
              decoration: BoxDecoration(
                color: const Color(0xff1E1C24),
                border: Border.all(color: const Color(0xff5D5D67), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: desfieldController2,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Describe Requirement...",
                    hintStyle:
                        const TextStyle(color: Color(0xff8F8F9E), fontSize: 15)),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                onSave(context);
              },
              child: appbuttons(
                  label: "Submit",
                  onPress: () {
                    onSave(context);
                  }),
            )
          ],
        ),
      ),
    );
  }

  void onSave(BuildContext context) {
    var data = Methodtitle(titlefieldController.text, desfieldController2.text);
    Navigator.pop(context, data);
  }
}

class Methodtitle {
  String first;
  String second;
  Methodtitle(this.first, this.second);
}
