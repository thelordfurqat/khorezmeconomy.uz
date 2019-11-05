<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Category */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="category-form">

    <?php $form = ActiveForm::begin(['action'=>$model->isNewRecord ? Yii::$app->urlManager->createUrl(['/admin/category/create']) : Yii::$app->urlManager->createUrl(['/admin/category/update','id'=>$model->id])]); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'code')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'icon')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'lang_id')->dropDownList(\app\components\ArrayMaps::language()) ?>

    <?= $form->field($model, 'parent_id')->dropDownList(\app\components\ArrayMaps::category(1,null, 1),[
            'class'=>'select2-list form-control'
    ]) ?>

    <?php

    echo $form->field($model, 'page_id')->dropDownList(\app\components\ArrayMaps::pages(1,true),[
        'class'=>'select2-list form-control'
    ]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Saqlash' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
