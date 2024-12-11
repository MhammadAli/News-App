import 'dart:ffi';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/web_view_screen/web_view_screen.dart';
import 'package:untitled/shared/cubit/cubit.dart';

Widget defaultFormField({
  final Color backgroundColor = Colors.grey,
  final IconData? prefixIcon,
  final IconData? suffixIcon,
  final Color iconColor = Colors.pink,
  final bool isPassword = false,
  final isClickable = true,
  final readOnly = true,
  final VoidCallback? suffixPressed,
  final void Function(String)? onChange,
  required final VoidCallback onTap,
  required final TextEditingController controller,
  required final String label,
  required final TextInputType keyboardType,
  required final String? Function(String?) validate,
}) =>
    Container(
      color: backgroundColor,
      child: TextFormField(
        readOnly: readOnly,
        enabled: isClickable,
        obscureText: isPassword,
        onTap: onTap,
        onChanged: onChange,
        validator: validate,
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          labelText: label,
          suffixIcon: IconButton(
            icon: Icon(
              suffixIcon,
              color: iconColor,
            ),
            onPressed: suffixPressed,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: iconColor,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        onFieldSubmitted: (value) {
          print(value);
        },
      ),
    );

Widget defaultButton({
  required final String emailController,
  required final String passwordController,
  required final VoidCallback onPressed,
  required final String text,
  final Color color = Colors.pink,
  final double width = double.infinity,
  final bool isUpperCase = true,
  final double radius = 15,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        color: color,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              child: Text(
                model['time'],
              ),
              radius: 40,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model['title'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    model['date'],
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updateDate(status: 'Done', id: model['id']);
              },
              icon: const Icon(
                Icons.check_box,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updateDate(status: 'Archived', id: model['id']);
              },
              icon: const Icon(
                Icons.archive,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(id: model['id']);
      },
    );

Widget tasksBuilder({required List<Map> tasks}) => ConditionalBuilder(
      condition: tasks.length > 0,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: tasks.length),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 100,
              color: Colors.grey,
            ),
            Text(
              'No Tasks, Please add some',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ],
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20,
      ),
      child: Container(
        height: 1,
        color: Colors.grey[300],
        width: double.infinity,
      ),
    );

Widget buildNewsItem(article, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: list.length,
        itemBuilder: (context, index) => buildNewsItem(list[index], context),
      ),
      fallback: (context) => isSearch
          ? Container()
          : Center(
              child: CircularProgressIndicator(),
            ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
