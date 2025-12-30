import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContractEditPage extends StatefulWidget {
  const ContractEditPage({super.key});

  @override
  State<ContractEditPage> createState() => _ContractEditPageState();
}

class _ContractEditPageState extends State<ContractEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(minimum: EdgeInsets.all(20.w), child: const Placeholder()),
    );
  }
}
