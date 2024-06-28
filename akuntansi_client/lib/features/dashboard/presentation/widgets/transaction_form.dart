import 'package:akuntansi_client/features/dashboard/data/models/kategori_models.dart';
import 'package:akuntansi_client/features/dashboard/presentation/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/presentation/widgets/custom_textfield.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/helper.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/utils/validation.dart';

class FormTransaction extends StatefulWidget {
  const FormTransaction({super.key});

  @override
  State<FormTransaction> createState() => _FormTransactionState();
}

class _FormTransactionState extends State<FormTransaction> {
  String? selectedKategori;
  @override
  void initState() {
    super.initState();
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
            const Text(
              'Tambah Data',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                  selectedKategori = newValue!.idKategori.toString();
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
            CustomTextField(
              title: "Jumlah",
              controller: provider.dataJumlahController,
              inputType: TextInputType.number,
              isError: provider.dataJumlahError,
              fieldValidator: ValidationHelper(
                isError: (bool value) => provider.setDataJumlah = value,
                typeField: TypeField.jumlah,
              ).validate(),
            ),
            mediumVerticalSpacing(),
            CustomTextField(
              title: "Tanggal",
              controller: provider.dataTanggalController,
              inputType: TextInputType.datetime,
              isError: provider.dataTanggalError,
              fieldValidator: ValidationHelper(
                isError: (bool value) => provider.setDataTanggal = value,
                typeField: TypeField.tanggal,
              ).validate(),
            ),
            mediumVerticalSpacing(),
            CustomTextField(
              title: "Catatan",
              controller: provider.dataCatatanController,
              inputType: TextInputType.text,
              isError: provider.dataCatatanError,
              fieldValidator: ValidationHelper(
                isError: (bool value) => provider.setDataCatatan = value,
                typeField: TypeField.catatan,
              ).validate(),
            ),
            mediumVerticalSpacing(),
            largeVerticalSpacing(),
            CustomButton(
                text: Text(
                  "Tambah Data",
                  style: txtButtonStyle,
                ),
                event: () async {
                  // if (provider.formKey.currentState!.validate()) {
                  //   await provider.submitTransaction();
                  // }
                },
                bgColor: primaryDarkColor),
          ],
        ),
      );
    });
  }
}
