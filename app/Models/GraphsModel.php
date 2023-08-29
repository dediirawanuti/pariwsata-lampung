<?php

namespace App\Models;

use CodeIgniter\Model;

class GraphsModel extends Model
{
    protected $table            = 'graphs';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $allowedFields    = ['nama', 'scope', 'lat', 'lng', 'maps_id', 'tujuan', 'no'];
}
