<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Vote */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="vote-form">

    <?php $form = ActiveForm::begin([
            'action'=>$model->isNewRecord ? Yii::$app->urlManager->createUrl(['admin/vote/create']) : Yii::$app->urlManager->createUrl(['admin/vote/update'])
    ]); ?>

    <?= $form->field($model, 'question')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'answer')->textarea(['rows' => 6])->label("Javoblar (; nuqta vergul bilan ajratilgan holda bo\'lishi kerak')") ?>

    <?= $form->field($model, 'lang_id')->dropDownList(\app\components\ArrayMaps::language()) ?>

    <?php //= $form->field($model, 'author_id')->textInput() ?>

    <?= $form->field($model, 'page_id')->dropDownList(\app\components\ArrayMaps::pages(1,null,1)) ?>

    <?= $form->field($model, 'news_id')->dropDownList(\app\components\ArrayMaps::News(1,1)) ?>

    <?php //= $form->field($model, 'status')->textInput() ?>

    <?php //= $form->field($model, 'active')->textInput() ?>

    <?php //= $form->field($model, 'created')->textInput() ?>

    <?php //= $form->field($model, 'updated')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Saqlash' : 'Saqlash', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
