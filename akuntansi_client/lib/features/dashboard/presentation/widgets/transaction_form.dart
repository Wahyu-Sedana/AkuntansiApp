import 'package:akuntansi_client/features/dashboard/data/models/kategori_models.dart';
import 'package:akuntansi_client/features/dashboard/presentation/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/styles.dart';

class FormTransaction extends StatefulWidget {
  const FormTransaction({super.key});

  @override
  State<FormTransaction> createState() => _FormTransactionState();
}

class _FormTransactionState extends State<FormTransaction> {
  void submitTransaksi() {
    final providerTransaction = context.read<TransactionProvider>();
    providerTransaction.submitTransaction().then((value) => {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Berhasil'),
                  content: Text('Data transaksi berhasil disimpan.'),
                  actions: [
                    ElevatedButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionProvider>(builder: (context, provider, _) {
      if (provider.isMakeRequestKateogori == true) {
        provider.getKategoriData();
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Form(
        key: provider.formKey,
        child: Column(
          children: [
            const SizedBox(
              width: 200,
              child: Text(
                'Tambah Data Transaksi',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            largeVerticalSpacing(),
            DropdownButtonFormField<Kategori>(
              hint: const Text("Pilih Kategori"),
              items: provider.dataKategori!.map((kategori) {
                return DropdownMenuItem<Kategori>(
                  value: kategori,
                  child: Text(kategori.namaKategori.toString()),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  provider.setSelectedKategori = newValue;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Kategori tidak boleh kosong';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
            mediumVerticalSpacing(),
            TextFormField(
              controller: provider.dataJumlahController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Jumlah',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                prefixIcon: Container(
                  alignment: Alignment.center,
                  width: 40,
                  child: const Text(
                    'RP',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Jumlah tidak boleh kosong';
                }
                return null;
              },
            ),
            mediumVerticalSpacing(),
            TextFormField(
              controller: provider.dataTanggalController,
              decoration: InputDecoration(
                labelText: 'Tanggal',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  String formattedDate = pickedDate.toString().split(' ')[0];
                  provider.dataTanggalController.text = formattedDate;
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Tanggal tidak boleh kosong';
                }
                return null;
              },
            ),
            mediumVerticalSpacing(),
            TextFormField(
              controller: provider.dataCatatanController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Catatan',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Catatan tidak boleh kosong';
                }
                return null;
              },
            ),
            mediumVerticalSpacing(),
            largeVerticalSpacing(),
            CustomButton(
                text: Text(
                  "Tambah Transaksi",
                  style: txtButtonStyle,
                ),
                event: () {
                  if (provider.formKey.currentState!.validate()) {
                    submitTransaksi();
                    provider.getTransactions();
                  }
                },
                bgColor: primaryDarkColor),
          ],
        ),
      );
    });
  }
}
