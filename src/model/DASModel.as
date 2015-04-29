package model {

public class DASModel {

    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------

    public var questions:QuestionModel;
    public var result:ResultModel;

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function DASModel() {
        _init();
    }

    //--------------------------------------------------------------------------
    //
    //  Class Methods
    //
    //--------------------------------------------------------------------------

    protected function _init():void {
        questions = questions || new QuestionModel;
        result = result || new ResultModel;
    }
}
}
