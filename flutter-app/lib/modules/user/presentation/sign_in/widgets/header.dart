part of '../sign_in_page.dart';

class _Header extends StatelessWidget {
  static const double _size = 150;

  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: _size,
      height: _size,
      child: Logo.dark(),
    );
  }
}
