package control {
import model.QuestionModel;

import mx.core.FlexGlobals;

import view.ResultView;

public class QuestionControl {

    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------

    protected var _model:QuestionModel;

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function QuestionControl(model:QuestionModel) {
        _model = model;

        _init();
    }

    protected function _init():void {
    }

    //--------------------------------------------------------------------------
    //
    //  Public Methods
    //
    //--------------------------------------------------------------------------

    public function setQuestions(array:Array):void {
        _model.questionList = array;
    }

    public function start():void {
        _model.currentIndex = 0;
        (Engine.getInstance().control as DASControl).result.reset();
    }

    public function next(result:int = -1):void {
        var index:int = _model.currentIndex;
        if (index++ < _model.questionList.length - 1) {
            _model.currentIndex = index;
            if (result > -1)
                (Engine.getInstance().control as DASControl).result.updateResult(result);
        }
        else FlexGlobals.topLevelApplication.navigator.replaceView(ResultView);
    }
}
}
