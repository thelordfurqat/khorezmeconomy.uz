<?php

namespace app\models;

use Yii;
use yii\web\UploadedFile;

/**
 * This is the model class for table "user".
 *
 * @property integer $id
 * @property integer $role_id
 * @property string $username
 * @property string $password
 * @property string $email
 * @property string $name
 * @property string $image
 * @property string $phone
 * @property string $country
 * @property string $region
 * @property string $district
 * @property string $address
 * @property string $created
 * @property string $updated
 * @property integer $status
 * @property integer $active
 */
class User extends \yii\db\ActiveRecord implements \yii\web\IdentityInterface
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'user';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['role_id', 'email','name'], 'required'],
            [['username', 'password'], 'required', 'on'=>'insert'],
            [['role_id', 'status', 'active'], 'integer'],
            [['created', 'updated','image'], 'safe'],
            [['username', 'email', 'image','country', 'region', 'district', 'address'], 'string', 'max' => 255],
            [['password'], 'string', 'max' => 500],
            [['phone'], 'string', 'max' => 20],
            ['email','email'],
            [['username'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'role_id' => 'Guruh',
            'name' => 'FIO',
            'image' => 'Rasm',
            'username' => 'Login',
            'password' => 'Parol',
            'email' => 'Email',
            'phone' => 'Telefon',
            'country' => 'Davlat',
            'region' => 'Viloyat',
            'district' => 'Tuman',
            'address' => 'Manzil',
            'created' => 'Yaratildi',
            'updated' => 'O\'zgartirildi',
            'status' => 'Status',
            'active' => 'Active',
        ];
    }


    public function getRole(){
        return $this->hasOne(Role::className(),['id'=>'role_id']);
    }


    public function upload($old = null){
        if($this->image = UploadedFile::getInstance($this,'image')){
            $name = microtime(true).'.'.$this->image->extension;
            $this->image->saveAs(Yii::$app->basePath.'/web/profile/'.$name);
            $this->image = $name;
            return true;
        }else{
            if($old != null){
                $this->image = $old;
                return true;
            }else{
                $this->image = "default.png";
                return true;
            }

        }
    }

    public function encrypt(){
        $this->password = Yii::$app->getSecurity()->generatePasswordHash($this->password);
        return true;
    }



    /**
     * @inheritdoc
     */
    public static function findIdentity($id)
    {
        return static::findOne($id);
    }

    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        return null;
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        return static::findOne(['username'=>$username]);
    }

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @inheritdoc
     */
    public function getAuthKey()
    {
        return $this->password;
    }

    /**
     * @inheritdoc
     */
    public function validateAuthKey($authKey)
    {
        return $this->password === $authKey;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return Yii::$app->getSecurity()->validatePassword($password,$this->password);
    }

}
