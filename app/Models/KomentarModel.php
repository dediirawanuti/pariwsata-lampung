<?php

namespace App\Models;

use CodeIgniter\Model;

class KomentarModel extends Model
{

    protected $table = 'komentar';
    protected $primaryKey = 'id';
    protected $useAutoIncrement = true;
	protected $allowedFields = ['id', 'user_id', 'maps_id', 'body', 'status','created_at'];
}
