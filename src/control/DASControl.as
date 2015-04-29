package control {
import flash.events.Event;
import flash.net.URLLoader;
import flash.net.URLRequest;

import model.DASModel;

public class DASControl {

    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------

    protected var _model:DASModel;

    public var question:QuestionControl;
    public var result:ResultControl;

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function DASControl(model:DASModel) {
        _model = model;

        _init();
    }

    //--------------------------------------------------------------------------
    //
    //  Class Methods
    //
    //--------------------------------------------------------------------------

    protected function _init():void {
        question = question || new QuestionControl(_model.questions);
        result = result || new ResultControl(_model.result);
    }

    //--------------------------------------------------------------------------
    //
    //  Public Methods
    //
    //--------------------------------------------------------------------------

    public function commence():void {
        var loader:URLLoader = new URLLoader(new URLRequest('data/das.json'));
        loader.addEventListener(Event.COMPLETE, _loader_completeHandler);
    }

    //--------------------------------------------------------------------------
    //
    //  Event Handlers
    //
    //--------------------------------------------------------------------------

    protected function _loader_completeHandler(event:Event):void {
        if (event.type == Event.COMPLETE) {
            var data:Object = JSON.parse(event.target.data);
            question.setQuestions(data.questions);
        }
    }
}
}
