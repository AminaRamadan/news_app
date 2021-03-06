import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';


class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit , NewsStates>(
        listener: ( context,  state) {},
        builder: ( context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                  'News App'
              ),
              actions: [
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: (){},
                ),
              ],
            ),
            body: cubit.Screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.BottomItem,
            ),
          );
        },


      ),
    );
  }
}
