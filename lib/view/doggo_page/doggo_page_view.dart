import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './doggo_page_viewmodel.dart';

class DoggoPageView extends StatelessWidget{
    final String breed;
    const DoggoPageView({ Key? key, required this.breed }):super(key: key);

    @override
    Widget build(BuildContext context){
        return ViewModelBuilder<DoggoPageViewModel>.reactive(
                viewModelBuilder: () => DoggoPageViewModel(),
                builder: (context, model, child){
                    return Container(
                            child: Center(
                                    child: Text("Doggopage View with " + breed),
                            )
                    );
                }
        );
    }
}
