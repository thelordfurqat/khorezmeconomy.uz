<?php $this->title = $sitetitle?>

<?php if(Yii::$app->controller->action->id=='sitemap'){
    echo \app\components\BreadcrumbsGenerator::generate(['code'=>'sitemap', 'type'=>'sitemap']);
}else{
    echo \app\components\BreadcrumbsGenerator::generate(['code'=>$code, 'type'=>'news']);
}?>



    <div id="primary" class="content-area vmagazine-lite-content">


        <div class="sitemap" style="padding:50px 0">

            <?php
            /**
             * Created by PhpStorm.
             * User: Dilmurod
             * Date: 27.01.2019
             * Time: 21:23
             */

            echo \app\components\MenuBuilder1::generate('map');




            ?>
            <br>
            <ul>
                <li><a href="<?= Yii::$app->urlManager->createUrl(['site/contact'])?>">Боғланиш</a></li>
                <li><a href="<?= Yii::$app->urlManager->createUrl(['site/sitemap'])?>">Сайт харитаси</a></li>
            </ul>
        </div>



    </div><!-- #primary -->



<style>
    .sitemap>ul{
        list-style: none;
        display: inline-block;
    }
    .sitemap>ul>li{
        /*display: inline-block;*/
    }
    .sitemap>ul>li>ul{
        display: block;
    }
</style>