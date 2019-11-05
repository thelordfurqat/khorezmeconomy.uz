<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search\NewsSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="news-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?php //$form->field($model, 'id') ?>

    <?= $form->field($model, 'code') ?>

    <?= $form->field($model, 'name') ?>

    <?php //$form->field($model, 'image') ?>

    <?= $form->field($model, 'lang_id')->dropDownList(\app\components\ArrayMaps::language()) ?>
    <?= $form->field($model, 'cat_id')->dropDownList(\app\components\ArrayMaps::category(1,true)) ?>

    <?php echo $form->field($model, 'preview') ?>

    <?php // echo $form->field($model, 'detail') ?>

    <?php // echo $form->field($model, 'sort') ?>

    <?php // echo $form->field($model, 'show_counter') ?>

    <?php // echo $form->field($model, 'slider') ?>

    <?php // echo $form->field($model, 'vote') ?>

    <?php // echo $form->field($model, 'tags') ?>

    <?php // echo $form->field($model, 'author_id') ?>

    <?php // echo $form->field($model, 'modify_by') ?>

    <?php // echo $form->field($model, 'updated') ?>

    <?php // echo $form->field($model, 'created') ?>

    <?php  echo $form->field($model, 'status')->dropDownList([1=>'Aktiv',0=>'Deaktiv']) ?>

    <?php // echo $form->field($model, 'active') ?>

    <div class="form-group">
        <?= Html::submitButton('Qidirish', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Tozalash', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
