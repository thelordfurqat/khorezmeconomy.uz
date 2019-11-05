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
class BAppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'backend/css/bootstrap.min.css',
        'backend/font-awesome/css/font-awesome.css',
        'backend/css/plugins/toastr/toastr.min.css',
        'backend/js/plugins/gritter/jquery.gritter.css',
        'backend/css/animate.css',
        'backend/css/plugins/select2/select2.css',
        'backend/css/style.css',
    ];
    public $js = [
        'backend/js/bootstrap.min.js',
        'backend/js/plugins/metisMenu/jquery.metisMenu.js',
        'backend/js/plugins/slimscroll/jquery.slimscroll.min.js',
        // Float
        'backend/js/plugins/flot/jquery.flot.js',
        'backend/js/plugins/flot/jquery.flot.tooltip.min.js',
        'backend/js/plugins/flot/jquery.flot.spline.js',
        'backend/js/plugins/flot/jquery.flot.resize.js',
        'backend/js/plugins/flot/jquery.flot.pie.js',
        'backend/js/plugins/peity/jquery.peity.min.js',
        'backend/js/demo/peity-demo.js',
        'backend/js/inspinia.js',
        'backend/js/plugins/pace/pace.min.js',
        'backend/js/plugins/jquery-ui/jquery-ui.min.js',
        'backend/js/plugins/gritter/jquery.gritter.min.js',
        'backend/js/plugins/sparkline/jquery.sparkline.min.js',
        'backend/js/demo/sparkline-demo.js',
        'backend/js/plugins/chartJs/Chart.min.js',
        'backend/js/plugins/toastr/toastr.min.js',
        'backend/js/plugins/select2/select2.min.js',
        'backend/js/demo/DemoFormComponents.js',

    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
