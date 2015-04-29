package model {
import event.ResultEvent;

[Event(name="resultEvent_change", type="event.ResultEvent")]

public class ResultModel extends BaseModel {

    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------

    protected var _output:int;

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function ResultModel() {
    }

    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    /**
     *
     * @param value
     */
    public function set output(value:int):void {
        if (_output == value) return;
        _output = value;
        dispatchEvent(new ResultEvent(ResultEvent.CHANGE))
    }

    [Bindable(event='resultEvent_change')]
    public function get output():int {
        return _output;
    }

}
}
