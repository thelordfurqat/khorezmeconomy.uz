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

<header class="site-header site-header-1" style="font-size: 14px;">
    <!-- Top bar start -->
    <div class="top-bar" style="font-size: 14px;">
        <div class="container" style="font-size: 14px;">
            <div class="row" style="font-size: 14px;">
                <div class="col-lg-8 lang-and-social-buttons">

                            <a href="https://president.uz/" style="font-size: 14px;">O'zbekiston Respublikasi Prezidenti   </a>
                    <span>      |   </span>
                            <a href="https://gov.uz/" style="font-size: 14px;">   O'zbekiston Respublikasi Hukumati</a>

                </div>
                <div class="col-lg-4 lang-and-social-buttons pull-right" style="font-size: 14px;">
                        <form id="w0" class="top-search-form" action="/uz/site/search" method="GET" style="font-size: 14px;">                                        <input type="text" name="query" placeholder="Izlash..." required="required" style="font-size: 14px;">
                            <button type="submit" class="btn btn-primary" style="font-size: 16px;"><i class="fa fa-search" aria-hidden="true" style="font-size: 13px;"></i></button>
                        </form>                                    <div class="social-div" style="font-size: 14px;">
                            <a href="https://pm.gov.uz/" style="font-size: 14px;"><i class="fa fa-envelope" aria-hidden="true" style="font-size: 21px;"></i></a>
                            <a href="/uz/site/sitemap" style="font-size: 14px;"><i class="fa fa-sitemap" aria-hidden="true" style="font-size: 21px;"></i></a>
                            <a href="/uz/site/rss" style="font-size: 14px;"><i class="fa fa-rss" aria-hidden="true" style="font-size: 21px;"></i></a>
                            <a href="/uz/node/377" style="font-size: 14px;"><i class="fa fa-phone" aria-hidden="true" style="font-size: 21px;"></i></a>
                            <a href="#" class="eye" id="eye" style="font-size: 14px;"><i class="fa fa-eye" aria-hidden="true" style="font-size: 22px;"></i></a>
                        </div>

                </div>
            </div>
        </div>
    </div>
    <!-- Top bar end -->
    <!--  Special abilities -->
    <div class="special-abilities" style="font-size: 16px;">
        <div class="row" style="font-size: 16px;">
            <a href="javascript:void(0)" id="increase" style="font-size: 16px;">A+</a>
            <a href="javascript:void(0)" id="reset" style="font-size: 16px;">A</a>
            <a href="javascript:void(0)" id="decrease" style="font-size: 16px;">A-</a>
        </div>
        <div class="row" style="font-size: 16px;">
            <a href="javascript:void(0)" id="grayscale" style="font-size: 16px;"><img src="/files/images/contrast.png" style="font-size: 16px;"></a>
            <a href="javascript:void(0)" id="blackscale" style="font-size: 16px;"><img src="/files/images/contrast-black.png" style="font-size: 16px;"> </a>
        </div>
    </div>
    <!--  End Special abilities -->
    <!-- Main bar start -->
    <div class="main-bar" style="font-size: 14px;">
        <div class="container" style="font-size: 14px;">
            <div class="row" style="font-size: 14px;">
                <div class="col-lg-12">
                    <!-- Logo start -->
                    <a href="/uz" class="site-logo" style="font-size: 14px;">
                        <div class="row">
                            <div class="col-lg-2">
                                <div class="logo-img" style="font-size: 14px;">
                                    <img src="<?=Yii::$app->homeUrl?>gerb.png">
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <p  style="font-size: 28px; font-family: 'Open Sans, sans-serif'">Хоразм вилояти <br style="font-size: 22px;"> Иқтисодиёт ва саноат<br> <span>  бош бошқармаси</span></p>
                            </div>
                            <div class="col-lg-6">
                                <div class="contacts-and-button" style="font-size: 14px;">
                                    <!-- Contacts start -->
                                    <div class="header-contacts" style="font-size: 14px;">
                                        <div class="row">
                                            <div class="col-lg-4 header-contacts-item hidden-sm hidden-xs" style="font-size: 14px;">
                                                <div class="title" style="font-size: 12.5px;">
                                                    <i class="fa fa-envelope" aria-hidden="true" style="font-size: 12.5px;"></i> Elektron pochta</div>
                                                <div class="content" style="font-size: 16px;">info@mineconomy.uz</div>
                                            </div>
                                            <div class="col-lg-3 header-contacts-item" style="font-size: 14px;">
                                                <div class="title" style="font-size: 12.5px;">
                                                    <i class="fa fa-phone" aria-hidden="true" style="font-size: 12.5px;"></i> Ishonch telefoni</div>
                                                <div class="content" style="font-size: 16px;">1171</div>
                                            </div>
                                            <div class="col-lg-3 header-contacts-item social-networks-div" style="font-size: 14px;">
                                                <span class="social-networks-title" style="font-size: 14px;"></span>
                                                <a href="https://www.facebook.com/mineconomy.uz" style="font-size: 14px;"> <img src="/sites/all/themes/mineconomy/images/icons/facebook.jpg" style="font-size: 14px;"></a>
                                                <a href="http://davra.uz/pages/page/d7f5d7c1-7641-4a4c-ac6a-578dba4bb3ff" style="font-size: 14px;"> <img src="/sites/all/themes/mineconomy/images/icons/davra.png" style="font-size: 14px;"></a>
                                                <a href="https://www.youtube.com/channel/UCYib8rCrsF7z2MmTPbnwjgg" style="font-size: 14px;"> <img src="/sites/all/themes/mineconomy/images/icons/youtube.jpg" style="font-size: 14px;"></a>
                                                <a href="https://t.me/MineconomyUz" style="font-size: 14px;"> <img src="/sites/all/themes/mineconomy/images/icons/telegram.jpg" style="font-size: 14px;"></a>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- Contacts end -->
                                    <!-- Button start -->
                                    <!-- Button end -->
                                </div>
                            </div>

                        </div>

                        </div>
                    </a>
                    <!-- Logo end -->
                </div>
            </div>
        </div>
    </div>
    <!-- Main bar end -->
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
