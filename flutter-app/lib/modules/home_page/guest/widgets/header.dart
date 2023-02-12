part of '../home_page.dart';

class _Header extends StatelessWidget {
  static const double _size = 200;

  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: _size,
      height: _size,
      child: Logo.light(),
    );
  }
}
