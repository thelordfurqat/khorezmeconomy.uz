<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use \kartik\datetime\DateTimePicker;
/* @var $this yii\web\View */
/* @var $model app\models\User */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="user-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">
    <div class="col-md-2">
        <?= $form->field($model, 'image')->fileInput(['maxlength' => true]) ?>
        <img src="/profile/<?= $model->image ?>" alt="alt" class="img-responsive">

    </div>
        <div class="col-md-10">
            <div class="row">
                <div class="col-md-6" style="margin:0;">
                    <?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="col-md-6" style="margin:0;">
                    <?= $form->field($model, 'password')->passwordInput(['maxlength' => true]) ?>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="col-md-6">
                    <?= $form->field($model, 'role_id')->dropDownList(\app\components\ArrayMaps::role()) ?>
                </div>

            </div>

            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'email')->textInput(['maxlength' => true,'type'=>'email']) ?>
                </div>
                <div class="col-md-6">
                    <?= $form->field($model, 'phone')->textInput(['maxlength' => true,'type'=>'number']) ?>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'address')->textInput(['maxlength' => true]) ?>
                </div>
                <div class="col-md-6">
                    <?php
                    echo $form->field($model, 'created')->widget(DateTimePicker::className(),[
                        'name' => 'dp_1',
                        'type' => DateTimePicker::TYPE_INPUT,
                        'options' => ['placeholder' => 'Kiriting sana/vaqt...','value'=> $model->isNewRecord ? date("Y-m-d h:i") : $model->created,],
                        'convertFormat' => true,

                        'pluginOptions' => [
                            'format' => 'yyyy-MM-dd hh:i',
                            'autoclose'=>true,
                            'weekStart'=>1, //неделя начинается с понедельника
                            'startDate' => '', //самая ранняя возможная дата
                            'todayBtn'=>true, //снизу кнопка "сегодня"
                        ]
                    ]); ?>
                </div>
            </div>


        </div>
    </div>
</div>






    <div class="row">
        <div class="col-md-4">
            <?= $form->field($model, 'country')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'region')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-md-4">
            <?= $form->field($model, 'district')->textInput(['maxlength' => true]) ?>
        </div>
    </div>














    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Yaratish' : 'O\'zgartirish', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
