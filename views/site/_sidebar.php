
<div class="col-xs-6 col-md-4 sidebar" id="sidebar">
    <div class="sidebar-title for-tablet">Sidebar</div>

    <aside >
        <h1 class="aside-title">Оммабоб <a href="<?= Yii::$app->urlManager->createUrl(['site/news'])?>" class="all">Барчасини кўриш <i class="ion-ios-arrow-right"></i></a></h1>
        <div class="aside-body">
            <?php foreach(\app\models\News::find()->orderBy(['created'=>SORT_DESC])->limit(7)->all() as $item):?>
                <article class="article-mini">
                    <div class="inner">
                        <figure>
                            <a href="<?= Yii::$app->urlManager->createUrl(['site/view','code'=>$item->code])?>">
                                <img src="/uploads/<?= $item->image?>" alt="">
                            </a>
                        </figure>
                        <div class="padding">
                            <h1><a href="<?= Yii::$app->urlManager->createUrl(['site/view','code'=>$item->code])?>"><?= $item->name?></a></h1>
                        </div>
                    </div>
                </article>
            <?php endforeach;?>

        </div>
    </aside>
    <aside>
        <h1 class="aside-title">Фойдали саҳифалар</h1>
        <div class="aside-body" style="padding:5px 0">
            <a class="btn btn-primary" style="width:100%;" href="<?= Yii::$app->urlManager->createUrl(['site/page','code'=>'normativ-hujjatlar'])?>"><span class="fa fa-newspaper-o"></span> Норматив ҳужжатлар</a>
        </div>

        <div class="aside-body" style="padding:5px 0">
            <a class="btn btn-primary" style="width:100%;" href="<?= Yii::$app->urlManager->createUrl(['site/page','code'=>'fuqorolar-murojaatlari'])?>"><span class="fa fa-user"></span> Фуқоролар мурожаатлари</a>
        </div>

        <div class="aside-body" style="padding:5px 0">
            <a class="btn btn-primary" style="width:100%;" href="<?= Yii::$app->urlManager->createUrl(['site/contact'])?>"><span class="fa fa-envelope"></span> Хабар қолдириш</a>
        </div>

        <div class="aside-body" style="padding:5px 0">
            <a class="btn btn-primary" style="width:100%;" href="<?= Yii::$app->urlManager->createUrl(['site/page','code'=>'online-maslahat'])?>"><span class="fa fa-history"></span> Онлайн маслаҳат</a>
        </div>

    </aside>


    <aside>
        <ul class="nav nav-tabs nav-justified" role="tablist">
            <li class="active">
                <a href="#recomended" aria-controls="recomended" role="tab" data-toggle="tab">
                    <i class="ion-android-star-outline"></i> Фойдали ҳаволалар
                </a>
            </li>

        </ul>
        <div class="tab-content">

            <div class="tab-pane active" id="recomended">

                <article class="article-mini">
                    <div class="inner">
                        <figure>
                            <a href="http://pm.gov.uz">
                                <img src="/uploads/default.jpg" style="width: 70px; height:auto" alt="Sample Article">
                            </a>
                        </figure>
                        <div class="padding">
                            <h1><a href="http://pm.gov.uz">Ўзбекистон Республикаси Президенти вертуал қабулхонаси</a></h1>
                        </div>
                    </div>
                </article>

                <article class="article-mini">
                    <div class="inner">
                        <a href="http://my.gov.uz/">
                            <img src="http://uzdon.uz/img/block/4/555.jpg" alt="" style="width:300px; height: auto;">
                        </a>
                    </div>
                </article>

                <article class="article-mini">
                    <div class="inner">
                        <a href="http://strategy.gov.uz/uz">
                            <img src="http://uzdon.uz/img/block/11/strategiya.jpg" alt="" style="width:300px; height: auto;">
                        </a>
                    </div>
                </article>
                <article class="article-mini">
                    <div class="inner">
                        <a href="http://uzdon.uz/uz/content/egovernment/years/">
                            <img src="http://uzdon.uz/img/banner/photo/000000000001.jpg" alt="" style="width:300px; height: auto;">
                        </a>
                    </div>
                </article>

                <article class="article-mini">
                    <div class="inner">
                        <a href="http://agrofin.uz/">
                            <img src="http://uzdon.uz/img/block/4/agrofin.jpg" alt="" style="width:300px; height: auto;">
                        </a>
                    </div>
                </article>

                <article class="article-mini">
                    <div class="inner">
                        <figure>
                            <a href="https://openinfo.uz">
                                <img src="https://openinfo.uz/static/main/img/logo.png" style="width: 70px; height:auto" alt="Sample Article">
                            </a>
                        </figure>
                        <div class="padding">
                            <h1><a href="https://openinfo.uz">Корпоратив ахборот  ягона портали</a></h1>
                        </div>
                    </div>
                </article>

            </div>

        </div>
    </aside>


    <aside>
        <h1 class="aside-title">Сўровнома</h1>
        <div class="aside-body">
            <?= $this->render('/site/_vote')?>
        </div>
    </aside>

    <aside>
        <h1 class="aside-title">Банк курси</h1>
        <div class="aside-body">
            <a href="http://cbu.uz/" target="_blank" title="Центральный банк Республики Узбекистан">
                <img src="http://cbu.uz/uzc/informer/?r_choose=USD_EUR_RUB" alt="" style="width:100%; height:auto; padding:20px; padding-top:0px;">
            </a>
        </div>
    </aside>


</div>


