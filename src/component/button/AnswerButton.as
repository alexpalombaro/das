package component.button {
import spark.components.Button;

public class AnswerButton extends Button {

    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------

    protected var _value:int;

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function AnswerButton() {
        super();
        buttonMode = true;
    }

    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    public function get value():int {
        return _value;
    }

    public function set value(value:int):void {
        _value = value;
    }
}
}
