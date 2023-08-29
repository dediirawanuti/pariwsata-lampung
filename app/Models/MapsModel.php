<?php

namespace App\Models;

use CodeIgniter\Model;

class MapsModel extends Model
{
    protected $table            = 'maps';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $allowedFields    = ['title', 'category_id', 'lat', 'lng', 'desc', 'gmaps', 'alamat', 'cover', 'status'];
}
