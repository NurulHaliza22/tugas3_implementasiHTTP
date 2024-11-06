import 'package:flutter/material.dart';
import 'package:modul_3/views/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _namaLengkap = "";
  String _email = "";
  String _noHandphone = "";
  String _alamatRumah = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Center(
          child: Column(
            children: [
              Text(
                "Hai ${widget.username}\n Selamat Datang",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 24),
              const Text("Lengkapi Biodata"),
              const SizedBox(height: 12),
              _buildForm(),
              const SizedBox(height: 12),
              _buildButtonSubmit()
            ],
          ),
        ),
      ),
    );
  }

  Widget _formInput(
      {required String hint,
      required String label,
      required Function(String value) setStateInput,
      int maxLines = 1}) {
    return TextFormField(
      enabled: true,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.all(12.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      onChanged: setStateInput,
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        const SizedBox(height: 12),
        _formInput(
            hint: "Masukkan Nama Lengkap",
            label: "Nama *",
            setStateInput: (value) {
              setState(() {
                _namaLengkap = value;
              });
            }),
        const SizedBox(height: 12),
        _formInput(
            hint: "Masukkan Email",
            label: "Email *",
            setStateInput: (value) {
              setState(() {
                _email = value;
              });
            }),
        const SizedBox(height: 12),
        _formInput(
            hint: "Masukkan No Hp",
            label: "Nomor Hp *",
            setStateInput: (value) {
              setState(() {
                _noHandphone = value;
              });
            }),
        const SizedBox(height: 12),
        _formInput(
          hint: "Masukkan Alamat",
          label: "Alamat *",
          setStateInput: (value) {
            setState(
              () {
                _alamatRumah = value;
              },
            );
          },
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildButtonSubmit() {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          if (_namaLengkap == "" || _email == "" || _noHandphone == "") {
            SnackBar snackBar = const SnackBar(
              content: Text("* data tidak boleh kosong"),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ProfilePage(
                  nama: _namaLengkap,
                  username: widget.username,
                  email: _email,
                  nomor: _noHandphone,
                  alamat: _alamatRumah);
            }));
          }
        },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            textStyle: const TextStyle(fontSize: 16)),
        child: const Text("Submit"),
      ),
    );
  }
}
