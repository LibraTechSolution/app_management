import 'package:rxdart/subjects.dart';

import '../model/base_model.dart';
import '../resources/repository.dart';


abstract class BaseBloc<T extends BaseModel> {
  final repository = Repository();

  final fetcher = PublishSubject<T>();

  dispose() {
    fetcher.close();
  }
}
