import 'package:hive/hive.dart';
import 'package:montra_expense_tracker/features/model/posts_model.dart';

class PostsAdapter extends TypeAdapter<PostsModel> {
  @override
  final typeId = 0;

  @override
  PostsModel read(BinaryReader reader) {
    final fields = reader.readMap();
    return PostsModel.fromJson(Map<String, dynamic>.from(fields));
  }

  @override
  void write(BinaryWriter writer, PostsModel obj) {
    writer.writeMap(obj.toJson());
  }
}
