package model {
import event.QuestionEvent;

[Event(name="questionEvent_change", type="event.QuestionEvent")]

public class QuestionModel extends BaseModel {
    //--------------------------------------------------------------------------
    //
    //  Class variables
    //
    //--------------------------------------------------------------------------

    protected var _questionList:Array;
    protected var _index:int;

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function QuestionModel() {
    }

    //--------------------------------------------------------------------------
    //
    //  Properties
    //
    //--------------------------------------------------------------------------

    /**
     * @param questionList
     */
    public function set questionList(questionList:Array):void {
        if (_questionList == questionList) return;

        _questionList = questionList;
        _index = 0;

        dispatchEvent(new QuestionEvent(QuestionEvent.CHANGE))
    }

    public function get questionList():Array {
        return _questionList;
    }

    /**
     *
     * @param index
     */
    public function set currentIndex(index:int):void {
        if (_index == index) return;
        _index = index;
        dispatchEvent(new QuestionEvent(QuestionEvent.CHANGE))
    }

    public function get currentIndex():int {
        return _index;
    }

    [Bindable(event='questionEvent_change')]
    public function get currentQuestionText():String {
        return _questionList[_index];
    }
}
}
