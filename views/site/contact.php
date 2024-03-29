<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\ContactForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;

$this->title = $sitetitle;
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-contact">

    <section class="home">
        <div class="container">
            <div class="row">

                <div class="bx_breadcrumbs">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-fix" style="display: inline-block;">
                            <a href="<?= Yii::$app->urlManager->createUrl(['site/index'])?>" title="Bosh sahifa">Бош сахифа</a>
                        </li>
                        <li class="breadcrumb-fix" style="display: inline-block;">
                            <a href="" title="Bosh sahifa">Хабар қолдириш</a>
                        </li>
                    </ul>
                </div>

                <div class="col-md-8 col-sm-12 col-xs-12 page-content">


                <div class="line top">
                    <div><?= $this->title?></div>
                </div>

                <div class="news-list">

    <?php if (Yii::$app->session->hasFlash('contactFormSubmitted')): ?>

        <div class="alert alert-success">
            Thank you for contacting us. We will respond to you as soon as possible.
        </div>

        <p>
            Note that if you turn on the Yii debugger, you should be able
            to view the mail message on the mail panel of the debugger.
            <?php if (Yii::$app->mailer->useFileTransport): ?>
                Because the application is in development mode, the email is not sent but saved as
                a file under <code><?= Yii::getAlias(Yii::$app->mailer->fileTransportPath) ?></code>.
                Please configure the <code>useFileTransport</code> property of the <code>mail</code>
                application component to be false to enable email sending.
            <?php endif; ?>
        </p>

    <?php else: ?>

        <p>
            If you have business inquiries or other questions, please fill out the following form to contact us.
            Thank you.
        </p>

        <div class="row">
            <div class="col-lg-12">

                <?php $form = ActiveForm::begin(['id' => 'contact-form']); ?>

                    <?= $form->field($model, 'name')->textInput(['autofocus' => true]) ?>

                    <?= $form->field($model, 'email') ?>

                    <?= $form->field($model, 'subject') ?>

                    <?= $form->field($model, 'body')->textarea(['rows' => 6]) ?>

                    <?= $form->field($model, 'verifyCode')->widget(Captcha::className(), [
                        'template' => '<div class="row"><div class="col-lg-3">{image}</div><div class="col-lg-6">{input}</div></div>',
                    ]) ?>

                    <div class="form-group">
                        <?= Html::submitButton('Жўнатиш', ['class' => 'btn btn-primary', 'name' => 'contact-button']) ?>
                    </div>

                <?php ActiveForm::end(); ?>

            </div>
        </div>

    <?php endif; ?>

                </div>


            </div>

            <?= $this->render('_sidebar')?>

        </div>
</div>
</section>

</div>
