<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\User */

$this->title = 'Ma\'lumotni yangilash: ' . $model->name;

$this->params['breadcrumbs'][] = ['label' => 'Admin', 'url' => ['/admin']];
$this->params['breadcrumbs'][] = ['label' => 'Foydalanuvchilar', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'O\'zgartirish';
?>
<div class="wrapper border-bottom white-bg mptop">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
