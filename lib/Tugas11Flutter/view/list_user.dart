import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ppkd_zahra/Tugas11Flutter/database/db_helper.dart';
import 'package:ppkd_zahra/Tugas11Flutter/model/user_model.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({super.key});

  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  getData() {
    DBHelper.getAllUser();
    setState(() {});
  }

  Future<void> _onEdit(UserModel user) async {
    final editNameC = TextEditingController(text: user.name);
    final editUsernameC = TextEditingController(text: user.username);
    final editPhoneC = TextEditingController(text: user.phone);
    final editEmailC = TextEditingController(text: user.email);
    final editPasswordC = TextEditingController(text: user.password);
    final res = await showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text("Edit Data"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              buildTextField(hintText: "Nama Lengkap", controller: editNameC),
              buildTextField(hintText: "Username", controller: editUsernameC),
              buildTextField(hintText: "No. Handphone", controller: editPhoneC),
              buildTextField(hintText: "Email", controller: editEmailC),
              buildTextField(hintText: "Password", controller: editPasswordC),
            ],),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Batal"),
              ),
              TextButton(onPressed: (){
                Navigator.pop(context, true);
              }, child: Text("Simpan"),
              ),
              ],
        );
      });

      if (res == true){
        final updated = UserModel(
          id: user.id,
          name: editNameC.text,
          username: editUsernameC.text,
          phone: editPhoneC.text,
          email: editEmailC.text,
          password: editPasswordC.text
        );
        DBHelper.updateUser(updated);
        getData();
        Fluttertoast.showToast(msg: "Data berhasil di update");
      }
  }


  Future<void> _onDelete(UserModel user) async {
    final res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Hapus Data"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              Text(
                "Apakah anda yakin ingin menghapus data ${user.name}?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Jangan"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("Ya, hapus aja"),
            ),
          ],
        );
      },
    );

    if (res == true) {
      DBHelper.deleteUser(user.id!);
      getData();
      Fluttertoast.showToast(msg: "Data berhasil di hapus");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("List User")),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("List data user:"),
          ),
          Expanded(
            child: FutureBuilder(
              future: DBHelper.getAllUser(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  final data = snapshot.data as List<UserModel>;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final items = data[index];
                        return Column(
                          children: [
                            ListTile(
                              title: Text(items.name),
                              subtitle: Text(items.email),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(onPressed: (){
                                    _onEdit(items);
                                  }, icon: Icon(Icons.edit),),
                                  IconButton(onPressed: (){
                                    _onDelete(items);
                                  }, icon: Icon(Icons.delete, color: Colors.red),)
                                ],),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

  TextFormField buildTextField({
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
      ),
    );
  }