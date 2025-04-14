import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_item.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_filed.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fatchAllNotes();
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Edit note Success')));
            },
            title: ' Edit Note',
            icon: Icons.check,
          ),
          SizedBox(height: 50),
          CustomTextFiled(
            onChanged: (value) {
              title = value;
            },
            hint: widget.note.title,
          ),
          SizedBox(height: 16),
          CustomTextFiled(
            onChanged: (value) {
              content = value;
            },
            hint: widget.note.subTitle,
            maxLines: 5,
          ),
          SizedBox(height: 16),
          EditNoteColorsList(note: widget.note),
        ],
      ),
    );
  }
}

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = kColors[index].value;
                setState(() {});
              },
              child: ColorItem(
                color: kColors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
