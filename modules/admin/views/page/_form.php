<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use app\components\ArrayMaps;
use \kartik\datetime\DateTimePicker;
/* @var $this yii\web\View */
/* @var $model app\models\Page */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="page-form">
    <?php $form = ActiveForm::begin(); ?>

    <div class="row" style="margin:0; padding:0;">

        <div class="col-md-6">

            <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'image')->fileInput(['maxlength' => true]) ?>

            <?php if(!$model->isNewRecord){?>
                <div class="form-group">
                    <img src="/uploads/<?= $model->image?>" style="height:200px; width:auto;">
                </div>
            <?php }?>

            <?php if($model->isNewRecord) echo $form->field($model, 'lang_id')->dropDownList(ArrayMaps::language()) ?>

        </div>

        <div class="col-md-6">

            <?= $form->field($model, 'code')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'author_id')->dropDownList(ArrayMaps::users()) ?>
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

            <?php if(!$model->isNewRecord) echo $form->field($model, 'lang_id')->dropDownList(ArrayMaps::language()) ?>

        </div>
    </div>
        <div class="row" style="margin:0; padding:0">

            <?= $form->field($model, 'preivew')->textarea(['maxlength' => true]) ?>


            <?= $form->field($model, 'detail')->widget(\dosamigos\tinymce\TinyMce::className(), [
                'options' => ['rows' => 10],
                'language' => 'ru',

                'clientOptions' => [
                    'plugins' => [
                        'image',
                        "advlist autolink lists link charmap print preview anchor",
                        "searchreplace visualblocks code fullscreen",
                        "insertdatetime media table contextmenu paste"
                    ],
                    'relative_urls'=>false,
                    'image_advtab' => true,
                    'images_upload_url'=> Yii::$app->urlManager->createUrl(['admin/photo/upload']),
                    'file_picker_types'=>'file image media',
                    'file_browser_callback_types'=>'file image media',
                    'content_css'=> [
                    '//fonts.googleapis.com/css?family=Roboto',
                    '//www.tinymce.com/css/codepen.min.css'],

                    'toolbar' => "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link  image | print preview media | file | forecolor backcolor emoticons",
                    'external_filemanager_path'=>'/backend/filemanager/filemanager/',
                    'filemanager_title'=>'File manager',
                    "external_plugins"=>[
                        'filemanager'=>'/backend/filemanager/filemanager/plugin.min.js'
                    ],

                ]
            ]); ?>


            <?= $form->field($model, 'tags')->textInput(['maxlength' => true])->label('Tags (Teglar vergul (,) bilan ajratilgan holda yoziladi)') ?>

        </div>

        <?php //$form->field($model, 'sort')->textInput() ?>

        <?= $form->field($model, 'show_counter')->textInput(['type'=>'number','value'=>0]) ?>

        <?php  //$form->field($model, 'slider')->textInput() ?>

        <?php //$form->field($model, 'vote')->textInput() ?>



        <div class="form-group">
            <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
        </div>
    <?php ActiveForm::end(); ?>

</div>
