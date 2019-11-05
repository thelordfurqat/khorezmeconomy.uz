<?php

/* @var $this \yii\web\View */
/* @var $content string */

use app\widgets\Alert;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>

    <script>
        function printfunction() {
            $('body').css({display:'none'});
            var content = $('.page-content').clone();
            $('body').before(content);
            window.print();
            $('.page-content').first().remove();
            $('body').css({display:''});
        }
    </script>

    <style>
        .menu ul > li .dropdown-menu > li > a{
            width: 260px !important;
        }
        .dropdown-menu>li>a{
            white-space: normal !important;
        }
        .menu ul > li .dropdown-menu > li:hover > a:after{
            -webkit-transform: scale(86) !important;
            -moz-transform: scale(86) !important;
            -ms-transform: scale(86) !important;
            -o-transform: scale(86) !important;
            transform: scale(86) !important;
        }
    </style>

    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body class="skin-blue">
<?php $this->beginBody() ?>




<header class="primary">
    <nav class="menu">
        <div class="container" style="border-bottom: 1px solid #626262; position: relative;">
            <ul class="nav-list">
                <li><a href="#">Боғланиш</a></li>
                <li><a href="#">Сайт харитаси</a></li>
                <li><a href="#">Герб</a></li>
                <li><a href="#">Байроқ</a></li>
                <li><a href="#">Мадҳия</a></li>
            </ul>
        </div>
    </nav>
    <div class="firstbar" style="padding:0;">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <div class="brand">
                        <a href="<?= Yii::$app->urlManager->createUrl(['site/index'])?>" class="pull-left">
                            <img src="/logo.png" alt="XorazmDon logo" style="height:80px; width:auto">
                        </a>
                        <a href="<?= Yii::$app->urlManager->createUrl(['site/index'])?>" class="pull-right" style="font-size:2em">Хоразм дон маҳсулотлари<br> <span>Аксиядорлик жамияти</span></a>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <form class="search" action="<?=Yii::$app->urlManager->createUrl(['site/search'])?>" autocomplete="off" style="margin:0; padding: 40px 0;">
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" name="s" class="form-control" placeholder="Сайтдан қидириш">
                                <div class="input-group-btn">
                                    <button class="btn btn-primary"><i class="ion-search"></i></button>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>

            </div>
        </div>
    </div>


    <?= $this->render('_menu')?>



</header>

<style>
    section.home.first{
        padding-top:0 !important;
    }
</style>




<div class="container">

        <div class="headline">
            <div class="nav" id="headline-nav">
                <a class="left carousel-control" role="button" data-slide="prev">
                    <span class="ion-ios-arrow-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" role="button" data-slide="next">
                    <span class="ion-ios-arrow-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="owl-carousel owl-theme" id="headline">
                <?php foreach (\app\models\News::find()->limit(10)->orderBy(['created'=>SORT_DESC])->all() as $item): ?>
                    <div class="item">
                        <a href="<?= Yii::$app->urlManager->createUrl(['site/news','code'=>$item->code])?>">
                            <div class="badge"><?= $this->render('/site/_date',['date'=>$item->created])?></div>
                            <?= $item->name?>
                        </a>
                    </div>
                <?php endforeach;?>
            </div>
        </div>

    </div>






<?= $content ?>






<?= $this->render('_footer')?>


<!--[if lt IE 9]><script src="js/html5.js"></script><![endif]-->
<!--[if lt IE 9]><script src="js/respond.js"></script><![endif]-->

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
