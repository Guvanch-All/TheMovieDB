import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:the_movie_db/UI/widgets/movie_list/UI/manager/movie_list_model.dart';
import 'package:the_movie_db/main.dart';

// class SearchBarWidget extends StatelessWidget {
//   const SearchBarWidget({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final model = context.read<MovieListViewModel>();
//     return Row(
//       children: [
//         Expanded(
//             child: TextField(
//               style: const TextStyle(color: Colors.white),
//               onChanged: model.searchMovie,
//               decoration: InputDecoration(
//                 prefixIcon: const Icon(
//                   Icons.search,
//                   size: 18,
//                   color: Colors.white,
//                 ),
//                 labelStyle: TextStyle(
//                   color: lightTheme == true ? Colors.black : Colors.white,
//                 ),
//                 isDense: true,
//                 hintText: 'Поиск филма',
//                 hintStyle: const TextStyle(color: Colors.grey, height: 0.7),
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 constraints: const BoxConstraints(maxWidth: 200, maxHeight: 40),
//                 enabledBorder: _buildBorder(Colors.white),
//                 focusedBorder: _buildBorder(Colors.blueAccent),
//               ),
//             )),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
//           ],
//         ),
//       ],
//     );
//   }
// }
//
// OutlineInputBorder _buildBorder(Color color) {
//   return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: BorderSide(
//         color: color,
//         width: 2.0,
//       ));
// }

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final model = context.read<MovieListViewModel>();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        // onChanged: model.searchMovie,
        decoration: InputDecoration(
          labelText: 'Поиск',
          filled: true,
          fillColor: Colors.white.withAlpha(235),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}