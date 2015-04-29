package component {
import control.DASControl;
import control.Engine;

import model.DASModel;

import mx.binding.utils.BindingUtils;
import mx.binding.utils.ChangeWatcher;

import spark.components.Label;
import spark.components.supportClasses.SkinnableComponent;

public class ResultComponent extends SkinnableComponent {

    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------

    [SkinPart(required="true")]
    public var outputText:Label;

    protected var _outputTextChangeWatcher:ChangeWatcher;

    //----------------------------------
    //  Engine
    //----------------------------------
    private var _controls:DASControl;
    private var _models:DASModel;

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function ResultComponent() {
        super();

        _init();
    }

    protected function _init():void {
        _controls = Engine.getInstance().control;
        _models = Engine.getInstance().model;
    }

    //--------------------------------------------------------------------------
    //
    //  Class Methods
    //
    //--------------------------------------------------------------------------

    protected function _updateOutputText(value:Object):void {
        outputText.text = String(value);
    }

    override protected function partAdded(partName:String, instance:Object):void {
        super.partAdded(partName, instance);

        if (instance == outputText) {
            if (_outputTextChangeWatcher) _outputTextChangeWatcher.unwatch();
            _outputTextChangeWatcher = BindingUtils.bindSetter(_updateOutputText, _models.result, 'output');
            _updateOutputText(String(_models.result.output));
        }
    }

}
}
