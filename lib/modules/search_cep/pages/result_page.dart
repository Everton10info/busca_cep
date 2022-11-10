// ignore_for_file: must_be_immutable

import 'package:busca_cep/shared/services/http_client.dart';
import 'package:busca_cep/shared/theme/app_colors.dart';
import 'package:busca_cep/shared/theme/app_fonts.dart';
import 'package:flutter/material.dart';

import '../controllers/search_controller.dart';
import '../models/cep_model.dart';
import '../repositories/repository.dart';

class ResultPage extends StatefulWidget {
  static String result = '/result';
  CepModel data;

  ResultPage({super.key, required this.data});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  HomeController c = HomeController(HomeRepository(ClientHttp()));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 80,
          title: Text('RESULT', style: AppFonts.headline24W900.getFont),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          child: Container(
            color: primaryColor,
            child: Table(
              border: TableBorder(
                verticalInside: BorderSide(
                  color: AppColors.white.getColor,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                horizontalInside: BorderSide(
                  color: AppColors.white.getColor,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                top: BorderSide(
                  color: AppColors.white.getColor,
                  style: BorderStyle.solid,
                  width: 3.0,
                ),
                right: BorderSide(
                  color: AppColors.white.getColor,
                  style: BorderStyle.solid,
                  width: 3.0,
                ),
                bottom: BorderSide(
                  color: AppColors.white.getColor,
                  style: BorderStyle.solid,
                  width: 3.0,
                ),
                left: BorderSide(
                  color: AppColors.white.getColor,
                  style: BorderStyle.solid,
                  width: 3.0,
                ),
              ),
              columnWidths: const <int, TableColumnWidth>{
                1: FlexColumnWidth(),
                2: FlexColumnWidth()
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(
                  //decoration: BoxDecoration(color: AppColors.grey.getColor),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'CEP: ',
                        textAlign: TextAlign.left,
                        style: AppFonts.caption20Bold.getFont,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        " ${widget.data.cep ?? ''}",
                        style: AppFonts.caption16.getFont,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  //decoration: BoxDecoration(color: AppColors.grey.getColor),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Logradouro: ',
                        textAlign: TextAlign.left,
                        style: AppFonts.caption20Bold.getFont,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        " ${widget.data.logradouro ?? ''}",
                        style: AppFonts.caption16.getFont,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  // decoration: BoxDecoration(color: AppColors.grey.getColor),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Complemento: ',
                        textAlign: TextAlign.left,
                        style: AppFonts.caption20Bold.getFont,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        " ${widget.data.complemento ?? ''}",
                        style: AppFonts.caption16.getFont,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Bairro: ',
                        textAlign: TextAlign.left,
                        style: AppFonts.caption20Bold.getFont,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        " ${widget.data.bairro ?? ''}",
                        style: AppFonts.caption16.getFont,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  // decoration: BoxDecoration(color: AppColors.grey.getColor),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Localidade: ',
                        textAlign: TextAlign.left,
                        style: AppFonts.caption20Bold.getFont,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        " ${widget.data.localidade ?? ''}",
                        style: AppFonts.caption16.getFont,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'UF: ',
                        textAlign: TextAlign.left,
                        style: AppFonts.caption20Bold.getFont,
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.all(6),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        " ${widget.data.uf ?? ''}",
                        style: AppFonts.caption16.getFont,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  //decoration: BoxDecoration(color: AppColors.grey.getColor),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'IBGE: ',
                        textAlign: TextAlign.left,
                        style: AppFonts.caption20Bold.getFont,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        " ${widget.data.ibge ?? ''}",
                        style: AppFonts.caption16.getFont,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'GUIA: ',
                        textAlign: TextAlign.left,
                        style: AppFonts.caption20Bold.getFont,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        " ${widget.data.cep ?? ''}",
                        style: AppFonts.caption16.getFont,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  //decoration: BoxDecoration(color: AppColors.grey.getColor),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'DDD: ',
                        textAlign: TextAlign.left,
                        style: AppFonts.caption20Bold.getFont,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        " ${widget.data.ddd ?? ''}",
                        style: AppFonts.caption16.getFont,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'SIAFI: ',
                        textAlign: TextAlign.left,
                        style: AppFonts.caption20Bold.getFont,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        " ${widget.data.siafi ?? ''}",
                        style: AppFonts.caption16.getFont,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
