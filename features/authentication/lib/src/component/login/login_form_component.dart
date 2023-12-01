import 'package:commons/commons.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';

class LoginFormComponent extends StatelessWidget {
  final VoidCallback? onSubmit;

  const LoginFormComponent({
    super.key,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _boxLogo(),
        const SizedBox(height: 36),
        _boxTitle(),
        const SizedBox(height: 4),
        _boxSubTitle(),
        const SizedBox(height: AppSize.padding30),
        _buildUserName(),
        const SizedBox(height: AppSize.padding24),
        _buildPassword(),
        const SizedBox(height: AppSize.padding24),
        _boxForgotPassword(),
        const SizedBox(height: AppSize.padding24),
        _boxSubmit(),
      ],
    );
  }

  Widget _boxLogo() {
    return Image.asset(AppImages.logoErawan);
  }

  Widget _boxTitle() {
    return Text(
      S.current.common_welcome,
      style: NotoSansStyle.normal.copyWith(
        color: AppColors.white,
        fontSize: AppSize.fontSize32,
      ),
    );
  }

  Widget _boxSubTitle() {
    return Text(
      S.current.login_sub_title,
      style: NotoSansStyle.normal.copyWith(
        color: AppColors.manatee,
        fontSize: AppSize.fontSize16,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildUserName() {
    return _LayoutInput(
      label: _boxLabelUserName(),
      input: _boxInputUserName(),
    );
  }

  Widget _buildPassword() {
    return _LayoutInput(
      label: _boxLabelPassword(),
      input: _boxInputPassword(),
    );
  }

  Widget _boxLabelUserName() {
    return Text(
      S.current.login_username,
      style: NotoSansStyle.normal.copyWith(
        color: AppColors.fiord,
        fontWeight: FontWeight.w400,
        fontSize: AppSize.fontSize14,
      ),
    );
  }

  Widget _boxInputUserName() {
    return InputComponent(
      hintText: 'amb1 - amb4,hpt1 - hpt11',
    );
  }

  Widget _boxLabelPassword() {
    return Text(
      S.current.login_password,
      style: NotoSansStyle.normal.copyWith(
        color: AppColors.fiord,
        fontWeight: FontWeight.w400,
        fontSize: AppSize.fontSize14,
      ),
    );
  }

  Widget _boxInputPassword() {
    return InputComponent(
      obscureText: true,
      suffixIcon: Icon(Icons.remove_red_eye),
    );
  }

  Widget _boxForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            S.current.login_forgot_password,
            style: NotoSansStyle.normal.copyWith(
              color: AppColors.dodgerBlue,
              fontWeight: FontWeight.w400,
              fontSize: AppSize.fontSize14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _boxSubmit() {
    return Row(
      children: [
        Expanded(
          child: ButtonComponent(
            onTap: onSubmit,
            decoration: BoxDecoration(
              color: AppColors.dodgerBlue,
              borderRadius: BorderRadius.circular(AppSize.radius8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSize.padding8),
              child: Text(
                S.current.login_submit,
                textAlign: TextAlign.center,
                style: NotoSansStyle.normal.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: AppSize.fontSize16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LayoutInput extends StatelessWidget {
  final Widget label;
  final Widget input;

  const _LayoutInput({super.key, required this.label, required this.input});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(children: [Expanded(child: label)]),
        const SizedBox(height: AppSize.padding4),
        Row(children: [Expanded(child: input)]),
      ],
    );
  }
}
