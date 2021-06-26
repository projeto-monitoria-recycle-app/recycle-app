import 'package:recycle_app/models/collect_point_model.dart';
import 'package:recycle_app/models/collect_route_model.dart';

abstract class FilterHelper {

  static void filterPointList(String district, List<CollectPoint> outputList) {
    outputList.clear();
    collectPointList.forEach(
      (element) {
        if (element.route.district == district) {
          outputList.add(element);
        }
      },
    );
  }

  static void filterRouteList(String district, List<CollectRoute> outputList) {
    outputList.clear();
    collectRouteList.forEach(
      (element) {
        if (element.district == district) {
          outputList.add(element);
        }
      },
    );
  }

}
