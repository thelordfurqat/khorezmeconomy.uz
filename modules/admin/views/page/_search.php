<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\search\PageSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="page-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?php // $form->field($model, 'id') ?>

    <?= $form->field($model, 'name') ?>

    <?php // $form->field($model, 'code') ?>

    <?php // $form->field($model, 'image') ?>

    <?= $form->field($model, 'preivew') ?>

    <?php  echo $form->field($model, 'detail') ?>

    <?php // echo $form->field($model, 'sort') ?>

    <?php // echo $form->field($model, 'show_counter') ?>

    <?php // echo $form->field($model, 'slider') ?>

    <?php // echo $form->field($model, 'vote') ?>

    <?php // echo $form->field($model, 'tags') ?>

    <?php  echo $form->field($model, 'author_id')->dropDownList(\app\components\ArrayMaps::Authors()) ?>

    <?php // echo $form->field($model, 'modify_by') ?>

    <?php  // echo $form->field($model, 'lang_id') ?>

    <?php // echo $form->field($model, 'created') ?>

    <?php // echo $form->field($model, 'updated') ?>

    <?php  echo $form->field($model, 'status')->dropDownList([1=>"Aktiv", 0=>'Deaktiv']) ?>

    <?php // echo $form->field($model, 'active') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
