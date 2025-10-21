import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


// Menu Syarat dan Ketentuan
class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height:20),
        Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                print(value);
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Text("Saya menyetujui semua persyaratan yang berlaku", style: TextStyle(height: 4)),
          ],
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.pink[50]),
          onPressed: isChecked ? () {} : null,
          child: Text(isChecked? "Lanjutkan pendaftaran diperbolehkan" : "Anda belum bisa melanjutkan"),
        ),
      ],
    );
  }
}


// Menu Mode Gelap
class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isSwitched? Colors.black54 : Colors.white,
      body:
      Center(
        child: Column(
          children: [
            SizedBox(height:300),
            Text("Aktifkan mode gelap"),
            Switch(
              value: isSwitched,
              onChanged: (value){
                setState(() {
                  isSwitched = value;
                });
              },),
              Text(isSwitched ? "Mode Gelap Aktif" : "Mode Terang Aktif", style: TextStyle(color: Colors.pink[200], fontWeight: FontWeight.bold),)],),
      ));
  }
}


// Pilih Kategori Produk
class DropdownWidget extends StatefulWidget {
  const DropdownWidget({super.key});

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String? dropDownValue;
  final List<String> listProduk = ["Elektronik", "Pakaian", "Makanan", "Lainnya"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text("Pilih kategori produk dibawah ini:"),
        SizedBox(height: 10),
        DropdownButton(
          value: dropDownValue,
          items: listProduk.map((String val) {
            return DropdownMenuItem(
              value: val,
              child: Text(val, style: TextStyle(color: Colors.black)),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              dropDownValue = value;
            });
            print(dropDownValue);
          },
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("Anda memilih kategori: "),
          Text(dropDownValue.toString())
        ],),
      ],
    );
  }
}

// Pilih Tanggal Lahir
class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? selectedPicked = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column( 
      children: [
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (picked != null) {
              print(picked);
              setState(() {
                selectedPicked = picked;
              });
            }
          },
          child: Text("Pilih Tanggal Lahir"),
        ),

        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tanggal Lahir: "),
            Text(selectedPicked != null
                  ? DateFormat('dd MMMM yyyy').format(selectedPicked!)
                  : "Belum dipilih",),
          ],
        ),
        
      ],
    );
  }
}

// Atur Pengingat
class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({super.key});

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (picked != null) {
              print(picked);
              setState(() {
                selectedTime = picked;
              });
            }
          },
          child: Text("Pilih Waktu Pengingat"),
        ),

        SizedBox(height:10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pengingat diatur pukul: "),
            Text(
              selectedTime != null
                  ? selectedTime!.format(context)
                  : "Belum dipilih",
            ),
          ],
        ),
      ],
    );
  }
}
