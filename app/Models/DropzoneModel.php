<?php

namespace App\Models;

use CodeIgniter\Model;

class DropzoneModel extends Model
{

    protected $table = 'galery';
    protected $primaryKey = 'id';
    protected $useAutoIncrement = true;
	protected $allowedFields = ['id', 'maps_id', 'filename', 'tipe', 'created_at'];
}
