<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\MapsModel;
use App\Models\GraphsModel;
use App\Models\UsersModel;


class DashboardController extends BaseController
{

    protected $maps, $users;

    public function __construct()
    {
        $this->maps = new MapsModel();
        // $this->graphs = new GraphsModel();
        $this->users = new UsersModel();
    }

    public function index()
    {
        $data = [
            'title' => 'Dashboard',
            'active' => 'dashboard',
            'countMaps' => $this->maps->countAllResults(),
            // 'countGraphs' => $this->graphs->countAllResults(),
            'countUsers' => $this->users->where('hak_akses', 'user')->countAllResults(),
        ];

        return view('admin/dashboard', $data);
    }

    public function encrypt_url()
    {
        $code = $this->request->getVar('kode');
        echo json_encode(encrypt_url($code));
    }

    public function decrypt_url()
    {
        $code = $this->request->getVar('kode');
        echo json_encode(decrypt_url($code));
    }
}
