package control {
import model.ResultModel;

public class ResultControl {

    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------

    protected var _model:ResultModel;

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function ResultControl(model:ResultModel) {
        _model = model;
    }

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function reset():void {
        _model.output = 0;
    }

    public function updateResult(value:int):void {
        _model.output += value;
    }

}
}