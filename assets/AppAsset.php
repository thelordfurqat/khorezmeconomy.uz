<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\assets;

use yii\web\AssetBundle;

/**
 * Main application asset bundle.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'scripts/bootstrap/bootstrap.min.css',
        'scripts/ionicons/css/ionicons.min.css',
        'scripts/toast/jquery.toast.min.css',
        'scripts/owlcarousel/dist/assets/owl.carousel.min.css',
        'scripts/owlcarousel/dist/assets/owl.theme.default.min.css',
        'scripts/magnific-popup/dist/magnific-popup.css',
        'scripts/sweetalert/dist/sweetalert.css',
        'css/style.css',
        'css/skins/blue.css',
//        'css/demo.css',
        'css/font-awesome.css',
        'js/gspeech/gspeech.css',
        'css/common.css',
        'css/design-2.css',
//        'css/style-1.css',
    ];
    public $js = [
        'js/jquery.js',
        'js/jquery.migrate.js',
        'scripts/bootstrap/bootstrap.min.js',
        'scripts/jquery-number/jquery.number.min.js',
        'scripts/owlcarousel/dist/owl.carousel.min.js',
        'scripts/magnific-popup/dist/jquery.magnific-popup.min.js',
//        'scripts/easescroll/jquery.easeScroll.js',
        'scripts/sweetalert/dist/sweetalert.min.js',
        'scripts/toast/jquery.toast.min.js',
//        'js/demo.js',
        'js/e-magz.js',
        'js/gspeech/gspeech.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];

}
