
<div class="row">
    <div class="col-md-12 col-sm-6 col-xs-12">




        <div class="main-events side-block">
            <?= $this->render('_vote')?>
        </div><!-- .main-events -->



    </div>
    <div class="col-md-12 col-sm-6 col-xs-12">




        <div class="main-faq side-block">
            <h2><a href="#">Оммабоб мақолалар</a></h2>

            <div class="side-block-items">
                    <ul style="padding-left:0">
                        <?php $model = \app\models\News::find()->orderBy(['show_counter'=>SORT_DESC])->limit(10)->all();
                        foreach ($model as $item) {?>
                            <li style="border-bottom:dotted 1px #000; margin-bottom:10px;"><a href="<?= Yii::$app->urlManager->createUrl(['site/view','code'=>$item->code])?>"><?= $item->name?></a></li>

                        <?php }
                        ?>
                    </ul>
            </div><!-- .items -->
        </div><!-- .side-block -->


    </div>
</div>

<div class="row">
    <div class="col-md-12 col-sm-6 col-xs-12">



        <div class="main-video side-block">
            <div class="item">
                <a href="http://cbu.uz/" target="_blank" title="Центральный банк Республики Узбекистан">
                    <img src="http://cbu.uz/uzc/informer/?r_choose=USD_EUR_RUB" alt="" width="255" height="170">
                </a>
                <hr>
                <div class="clearfix"></div>
            </div><!-- .item -->
            <div class="item">

                <img src="/image/davlat-dasturi.png" alt="*" width="100%">

                <div class="clearfix"></div>
            </div>

        </div><!-- .side-block -->


    </div>

</div>
