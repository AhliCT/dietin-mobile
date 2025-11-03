import 'package:dietin/app/shared/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../shared/widgets/custom_text_field.dart';
import '../controllers/initialhealth_controller.dart';

class InitialhealthView extends GetView<InitialhealthController> {
  const InitialhealthView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Informasi Pengguna', style: AppTextStyles.headingAppBar,),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: SizedBox(
                height:
                MediaQuery.of(context).size.height - kToolbarHeight - 40.h,
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 52.h,),
                      CustomTextField(
                        labelText: 'Email',
                        hintText: 'Masukan email',
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icon(
                          Icons.alternate_email,
                          color: AppColors.primary,
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
