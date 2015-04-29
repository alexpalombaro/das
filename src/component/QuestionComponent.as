package component {

import component.button.AnswerButton;

import control.DASControl;
import control.Engine;

import flash.events.MouseEvent;

import model.DASModel;

import mx.binding.utils.BindingUtils;
import mx.binding.utils.ChangeWatcher;

import spark.components.Group;
import spark.components.Label;
import spark.components.supportClasses.SkinnableComponent;

public class QuestionComponent extends SkinnableComponent {

    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------

    [SkinPart(required='true')]
    public var questionText:Label;

    [SkinPart(required='true')]
    public var buttonGroup:Group;

    [SkinPart(required='false')]
    public var questionNumber:Group;

    //----------------------------------
    //  Engine
    //----------------------------------
    private var _controls:DASControl;
    private var _models:DASModel;


    //----------------------------------
    //  Bindings
    //----------------------------------
    protected var _questionTextChangeWatcher:ChangeWatcher;

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function QuestionComponent() {
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

    protected function _updateQuestionText(value:String):void {
        questionText.text = '"' + value + '"';
    }

    //--------------------------------------------------------------------------
    //
    //  Skinnable methods
    //
    //--------------------------------------------------------------------------


    override protected function partAdded(partName:String, instance:Object):void {
        super.partAdded(partName, instance);
        if (instance == questionText) {
            if (_questionTextChangeWatcher) _questionTextChangeWatcher.unwatch();
            _questionTextChangeWatcher = BindingUtils.bindSetter(_updateQuestionText, _models.questions, 'currentQuestionText');
            _updateQuestionText(_models.questions.currentQuestionText);
        }

        if (instance == buttonGroup) {
            buttonGroup.addEventListener(MouseEvent.CLICK, _buttonGroup_clickHandler)
        }
    }

    protected function _buttonGroup_clickHandler(event:MouseEvent):void {
        if (event.target is AnswerButton) {
            _controls.question.next((event.target as AnswerButton).value);
        }
    }
}
}