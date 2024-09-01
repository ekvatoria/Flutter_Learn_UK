// bir private class ile diğer sayfayı konuşturmak için part kullanılır.
part of 'part_of_learn.dart';

class _PartofAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _PartofAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('data'),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.abc_rounded)),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
