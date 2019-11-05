<?php

namespace app\modules\admin\controllers;

use GuzzleHttp\Psr7\UploadedFile;
use Yii;
use yii\data\Pagination;
use yii\filters\AccessControl;
use yii\helpers\FileHelper;
use yii\helpers\Json;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * AlbomController implements the CRUD actions for BAlbom model.
 */
class PhotoController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }
    public function beforeAction($action)
    {
        if ($action->id == 'upload') {
            $this->enableCsrfValidation = false;
        }

        return parent::beforeAction($action);
    }
    /**
     * Lists all BAlbom models.
     * @return mixed
     */

    public function actionUpload(){


        /*******************************************************
         * Only these origins will be allowed to upload images *
         ******************************************************/
//        $accepted_origins = array("http://localhost", "http://192.168.1.1", "http://example.com");

        /*********************************************
         * Change this line to set the upload folder *
         *********************************************/
        $imageFolder = Yii::$app->basePath."/web/uploads/image/";

        reset ($_FILES);
        $temp = current($_FILES);
        if (is_uploaded_file($temp['tmp_name'])){

            /*
              If your script needs to receive cookies, set images_upload_credentials : true in
              the configuration and enable the following two headers.
            */
            // header('Access-Control-Allow-Credentials: true');
            // header('P3P: CP="There is no P3P policy."');

            // Sanitize input
            if (preg_match("/([^\w\s\d\-_~,;:\[\]\(\).])|([\.]{2,})/", $temp['name'])) {
                header("HTTP/1.1 400 Invalid file name.");
                return;
            }

            // Verify extension
            if (!in_array(strtolower(pathinfo($temp['name'], PATHINFO_EXTENSION)), array("gif", "jpg", "png"))) {
                header("HTTP/1.1 400 Invalid extension.");
                return;
            }

            // Accept upload if there was no origin, or if it is an accepted origin
            $temp = explode(".", $_FILES["file"]["name"]);
            $newfilename = round(microtime(true)) . '.' . end($temp);
            move_uploaded_file($_FILES["file"]["tmp_name"], $imageFolder . $newfilename);

            // Respond to the successful upload with JSON.
            // Use a location key to specify the path to the saved image resource.
            // { location : '/your/uploaded/image/file'}
            echo json_encode(array('location' => '/uploads/image/' . $newfilename));
        } else {
            // Notify editor that the upload failed
            header("HTTP/1.1 500 Server Error");
        }
        exit;

    }


    public function actionImageUpload($CKEditor=null,$CKEditorFuncNum=null,$langCode=null){



        $res = "";
        $target_dir = Yii::$app->basePath."/web/uploads/image/";
        $file_name = uniqid(time(), true).'.'.strtolower(pathinfo($_FILES['upload']['name'],PATHINFO_EXTENSION));
        $target_file = $target_dir . $file_name;

        $uploadOk = 1;
        $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

// Check if file already exists
        if (file_exists($target_file)) {
            $res =  "Sorry, file already exists.";
            $uploadOk = 0;
        }
// Check file size
        if ($_FILES["upload"]["size"] > 40000) {
            $res .=  "Sorry, your file is too large.";
            $uploadOk = 0;
        }
// Allow certain file formats
        if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
            && $imageFileType != "gif" ) {
            $res .=  "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
            $uploadOk = 0;
        }
// Check if $uploadOk is set to 0 by an error
        if ($uploadOk == 0) {
            $res .=  "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
        } else {
            if (move_uploaded_file($_FILES["upload"]["tmp_name"], $target_file)) {
                $res =  '/uploads/image/'.$file_name;
            } else {
                $res .=  "Sorry, there was an error uploading your file.";
            }
        }


        echo "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction($CKEditorFuncNum, '{$res}');</script>";
    }



}
