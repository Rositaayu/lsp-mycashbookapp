// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../database/dbhelper.dart';

class Pengaturan extends StatefulWidget {
  const Pengaturan({Key? key}) : super(key: key);

  @override
  State<Pengaturan> createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  final formKey = GlobalKey<FormState>();

  TextEditingController passwordInput = TextEditingController();
  TextEditingController confirmPasswordInput = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var db = DBHelper();

  updatePassword() async {
    var res = await db.getPassword();

    if (passwordInput.text.toString() == res.toString()) {
      await db.updatePassword(confirmPasswordInput.text.toString());
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password berhasil diubah!'),
        ),
      );
    } else {
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password tidak sama!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    updatePassword();
                  }
                },
                child: const Text('Simpan'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('<<Kembali'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                  minimumSize: const Size.fromHeight(50),
                ),
              ),
            ],
          )),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Flexible(
            child: Form(
              key: formKey,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pengaturan',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Password Saat Ini :',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password saat ini wajib diisi!';
                        }
                        return null;
                      },
                      obscureText: true,
                      controller: passwordInput,
                      decoration: const InputDecoration(
                        labelText: 'Masukkan Password',
                        labelStyle: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.orange,
                        ),
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.orange,
                        ),
                        focusColor: Colors.orange,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Password Baru :',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password baru wajib diisi!';
                        }
                        return null;
                      },
                      obscureText: true,
                      controller: confirmPasswordInput,
                      decoration: const InputDecoration(
                        labelText: 'Masukkan Password',
                        labelStyle: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.orange,
                        ),
                        hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.orange,
                        ),
                        focusColor: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 70),
                    Center(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/rosita.jpeg',
                              width: 120, 
                              height: 170,
                              fit: BoxFit.cover, 
                            ),
                            const SizedBox(width: 10), 
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'About This App',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins',
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Aplikasi ini dibuat oleh: ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                const Text(
                                  'Nama    : Rosita Ayu Tri Lestari \n'
                                  'NIM          : 2141764152 \n'
                                  'Tanggal : 28 September 2023',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                    ),
                  ],
              ),
            ),
          ),
        ),
        ),
      ),
    );
  }
}
