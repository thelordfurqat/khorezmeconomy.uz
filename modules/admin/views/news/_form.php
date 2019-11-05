<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\News */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="news-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="row" >

        <div class="col-md-6">

            <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'image')->fileInput(['maxlength' => true]) ?>

            <?php if(!$model->isNewRecord){?>
                <div class="form-group">
                    <img src="/uploads/<?= $model->image?>" style="height:200px; width:auto;">
                </div>
            <?php }?>

            <?php if($model->isNewRecord){
                echo $form->field($model, 'lang_id')->dropDownList(\app\components\ArrayMaps::language());

                echo $form->field($model, 'cat_id')->dropDownList(\app\components\ArrayMaps::category(1,true));
            }?>


        </div>

        <div class="col-md-6">
            <?= $form->field($model, 'code')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'author_id')->dropDownList(\app\components\ArrayMaps::users()) ?>
            <?php
            echo $form->field($model, 'created')->widget(\kartik\datetime\DateTimePicker::className(),[
                'name' => 'dp_1',
                'type' => \kartik\datetime\DateTimePicker::TYPE_INPUT,
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

            <?php if(!$model->isNewRecord){
                echo $form->field($model, 'lang_id')->dropDownList(\app\components\ArrayMaps::language());
                echo $form->field($model, 'cat_id')->dropDownList(\app\components\ArrayMaps::category($model->lang_id,true));
            }?>
        </div>
    
    </div>
    


    <?= $form->field($model, 'preview')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'detail')->widget(\dosamigos\tinymce\TinyMce::className(), [
        'options' => ['rows' => 10],
        'language' => 'ru',

        'clientOptions' => [
            'plugins' => [
                'image',
                "advlist autolink lists link charmap print preview anchor",
                "searchreplace visualblocks code fullscreen",
                "insertdatetime media table contextmenu paste",
		//'print preview fullpage powerpaste searchreplace autolink directionality advcode visualblocks visualchars fullscreen image link media codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists textcolor wordcount tinymcespellchecker a11ychecker imagetools mediaembed  linkchecker contextmenu colorpicker ',
				'advcode',
            ],
            'relative_urls'=>false,
            'image_advtab' => true,
            'images_upload_url'=> Yii::$app->urlManager->createUrl(['admin/photo/upload']),
            'file_picker_types'=>'file image media',
            'file_browser_callback_types'=>'file image media',
            'content_css'=> [
                '//fonts.googleapis.com/css?family=Roboto',
                '//www.tinymce.com/css/codepen.min.css'],

            'toolbar' => "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link  image | print preview media | file | forecolor backcolor emoticons | code",
            'external_filemanager_path'=>'/backend/filemanager/filemanager/',
            'filemanager_title'=>'File manager',
            "external_plugins"=>[
                'filemanager'=>'/backend/filemanager/filemanager/plugin.min.js'
            ],

        ]
    ]); ?>


    <?= $form->field($model, 'tags')->textInput() ?>


    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Saqlash' : 'Saqlash', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<?php

$url = Yii::$app->urlManager->createUrl(['admin/category/lang']);

$this->registerJs("
$('#news-lang_id').change(function(){
    $.get('{$url}?id='+$('#news-lang_id').val()+'&st=1').done(function(data){
        $('#news-cat_id').empty();
        $('#news-cat_id').append(data);
    })
})


");

?>



