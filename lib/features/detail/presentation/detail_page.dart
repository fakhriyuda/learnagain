import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, this.nameketek});

  final String? nameketek;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.nameketek ?? ''),
                TextFormField(
                  decoration: InputDecoration(label: Text("Username")),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: "Masukkan nama",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.blue))),
                  validator: (value) {
                    if (value!.contains("@")) {
                      return "Bukan Email ya";
                    }
                    if (value == "") {
                      return "jangan kosong dong";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Masukkan Password",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.blue))),
                  validator: (value) {
                    if (value!.contains("@")) {
                      return "Bukan Email ya";
                    }
                    return null;
                  },
                  onChanged: (text) {
                    print(text);
                  },
                ),
                TextButton(
                    onPressed: () {
                      print(nameController.text);
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Success Bro')),
                        );
                      }
                    },
                    child: Text('Check'))
              ],
            )),
          )),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    super.dispose();
  }  
}
