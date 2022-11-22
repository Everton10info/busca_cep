import 'package:busca_cep/shared/theme/app_colors.dart';
import 'package:busca_cep/shared/theme/app_fonts.dart';
import 'package:flutter/material.dart';

import '../controllers/search_controller.dart';
import '../models/cep_model.dart';
import '../repositories/repository.dart';

class ResultPage extends StatefulWidget {
  static String result = '/result';
  final CepModel? data;

  const ResultPage({super.key, required this.data});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  HomeController c = HomeController(HomeRepository());
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
              border: _buildBorder(),
              columnWidths: const <int, TableColumnWidth>{
                1: FlexColumnWidth(),
                2: FlexColumnWidth()
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                _buildTabRow('CEP', widget.data!.cep!),
                _buildTabRow('Logradouro', widget.data!.logradouro!),
                _buildTabRow('Complemento', widget.data!.complemento!),
                _buildTabRow('Bairro', widget.data!.bairro!),
                _buildTabRow('Localidade', widget.data!.uf!),
                _buildTabRow('UF', widget.data!.uf!),
                _buildTabRow('IBGE', widget.data!.ibge!),
                _buildTabRow('GUIA', widget.data!.cep!),
                _buildTabRow('DDD', widget.data!.ddd!),
                _buildTabRow('SIAFI', widget.data!.siafi!)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildBorder() {
    return TableBorder(
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
    );
  }

  _buildTabRow(String label, String result) {
    return TableRow(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            textAlign: TextAlign.left,
            style: AppFonts.caption20Bold.getFont,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(6),
          height: 50,
          alignment: Alignment.centerLeft,
          child: Text(
            result,
            style: AppFonts.caption16.getFont,
          ),
        ),
      ],
    );
  }
}
