import 'package:recicle_app/models/CollectDayNotification.dart';
import 'package:recicle_app/models/collectRouteModel.dart';

class InMemoryCollectRouteDao{
  static Map<int, CollectRoute> _routes = Map();

  InMemoryCollectRouteDao(){
    _initRoutes();
  }

  void insert(CollectRoute route){
    if(route.id == null){
      throw Exception("Cannot insert entity with id null");
    }
    if(_routes.containsKey(route.id)){
      throw Exception("Entity with id ${route.id} already inserted");
    }
    _routes[route.id] = route;
  }

  CollectRoute getById(int id){
    return _routes[id];
  }

  List<CollectRoute> getAll(){
    List<CollectRoute> routes = [];
    routes.addAll(_routes.values);
    return routes;
  }

  List<CollectRoute> getAllWithIds(Set<int> ids){
    List<CollectRoute> routes = getAll().where((route) => ids.contains(route.id)).toList();
    return routes;
  }

  void deleteAll(){
    _routes.clear();
  }
  _initRoutes(){
    if(_routes.length != collectRouteList.length) {
      deleteAll();
      collectRouteList.forEach((route) {
        insert(route);
      });
    }
  }
}