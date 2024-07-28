
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'provider.dart';

List<SingleChildWidget> providerMain = [
  ChangeNotifierProvider(create: (_) => DataProvider()),
  // ChangeNotifierProvider(create: (_) => CounterCubit()),

];