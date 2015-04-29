package control {
import model.DASModel;

public class Engine {

    private static var __instance:Engine;

    protected var _control:DASControl;
    protected var _model:DASModel;

    public function Engine(singleton:SingletonBlocker) {

        if (__instance || !singleton) throw new Error('Illegal singleton instantiation.');

        __instance = this;

        _model = new DASModel();
        _control = new DASControl(_model);
    }


    public function get control():DASControl {
        return _control;
    }

    public function get model():DASModel {
        return _model;
    }


    public static function getInstance():Engine {
        return __instance || new Engine(new SingletonBlocker());
    }
}
}


class SingletonBlocker {}