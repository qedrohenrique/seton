import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notas/domain/note.dart';

class NotesCard extends StatelessWidget {
  const NotesCard({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
          /*decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 20.0,
            )
          ]
        ),*/
          height: 66,
          child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(note.title,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.w700)),
                        Text(note.content,
                            textAlign: TextAlign.left,
                            style:
                            GoogleFonts.roboto(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.delete)
                  ],
                )
              ))),
    );
  }
}
