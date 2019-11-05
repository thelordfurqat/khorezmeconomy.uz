<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Page */

$this->title = 'Sahifa qo\'shish';
$this->params['breadcrumbs'][] = ['label' => 'Admin', 'url' => ['/admin']];
$this->params['breadcrumbs'][] = ['label' => 'Sahifalar', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="wrapper border-bottom white-bg mptop">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
