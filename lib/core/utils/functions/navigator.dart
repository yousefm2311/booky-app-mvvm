import 'package:go_router/go_router.dart';

void pushRouter(String location, context,{extra}) {
  GoRouter.of(context).push(location,extra:extra );
}

void pushReplacementRouter(String location, context) {
  GoRouter.of(context).pushReplacement(location);
}

void popRouter(context) {
  GoRouter.of(context).pop();
}
