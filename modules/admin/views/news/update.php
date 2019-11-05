<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\News */

$this->title = 'Yangilash: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Admin', 'url' => ['/admin']];
$this->params['breadcrumbs'][] = ['label' => 'Yangiliklar', 'url' => ['index']];
$this->params['breadcrumbs'][] = $model->name;
?>
<div class="wrapper border-bottom white-bg mptop">


    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
