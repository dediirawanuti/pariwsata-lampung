<?php

namespace App\Controllers;

use App\Models\CategoryModel;
use App\Models\MapsModel;
use App\Models\UsersModel;
use App\Models\KomentarModel;
use App\Models\GraphsModel;

class HomeController extends BaseController
{
    protected $categoryModel;
    protected $mapsModel;
    protected $userModel;
    protected $komentarModel;
    protected $pager;
    protected $db;

    public function __construct()
    {
        $this->categoryModel        = new CategoryModel();
        $this->mapsModel            = new MapsModel();
        // $this->graphs               = new GraphsModel();
        $this->userModel            = new UsersModel();
        $this->komentarModel        = new KomentarModel();
        $this->pager                = \Config\Services::pager();
        $this->db                   = \Config\Database::connect();
    }

    public function index()
    {
        $data = [
            'active'    => 'beranda',
            'kategori'  => $this->categoryModel->select('id, nama')->findAll(),
            'wisata'    => $this->mapsModel->where('status', 'publish')->where('category_id', 8)->paginate(9),
            'pager'     => $this->mapsModel->pager,
        ];
        return view('frontend/index', $data);
    }

    public function collabs()
    {
        $data = [
            'active' => 'Collabs & Partner',
            'title' => 'Collabs & Partner'
        ];
        return view('frontend/collabs', $data);
    }

    public function show($id)
    {
        $dec_id = decrypt_url($id);
        $this->getPengunjung($dec_id);
        $map = $this->mapsModel->select('maps.id, maps.title, maps.cover, maps.lat, maps.lng, graphs.id as graphs_id, graphs.lat as graphs_lat, graphs.lng as graphs_lng, graphs.maps_id, graphs.nama, graphs.no')
            ->join('graphs', 'maps.id = graphs.maps_id')
            ->where('maps.id', $dec_id)
            ->where('graphs.maps_id', $dec_id)
            ->findAll();

        $data = [
            'maps'          => $this->mapsModel->find($dec_id),
            'graphs'        => $map,
            'komentar'      => $this->komentarModel
                ->select('komentar.id, users.nama, users.foto, komentar.maps_id, komentar.body, komentar.created_at')
                ->join('users', 'users.id=komentar.user_id')
                ->where('komentar.status', 'approve')
                ->where('komentar.maps_id', $dec_id)
                ->findAll(),
            'kategori'      => $this->categoryModel->select('id, nama')->findAll(),
            'cover'    => 'coverBiasa',
        ];

        // Mendapatkan kategori ID dari data maps
        $kategoriId = $data['maps']['category_id'];

        // Memeriksa jika kategori ID adalah 8, maka menggunakan cover 360
        if ($kategoriId == 8) {
            $data['cover'] = 'cover360';
        }

        return view('frontend/show', $data);
    }

    public function kategori_show()
    {
        $data = [
            'active' => 'Destinasi',
            'maps'      => $this->mapsModel->select()->where('maps.status', 'publish')->paginate(9),
            'pager' => $this->mapsModel->pager,
            'kategori'      => $this->categoryModel->select('id, nama')->findAll(),
        ];

        return view('frontend/destinasi', $data);
    }

    public function kategori($id)
    {
        $dec_id = decrypt_url($id);
        $data = [
            'dropdown'      => 'kategori',
            'active'        => $dec_id,
            'maps'          => $this->mapsModel
                ->select('maps.id, maps.title, maps.lat, maps.lng, maps.desc, maps.alamat, maps.cover, maps.created_at, category.nama')
                ->join('category', 'category.id=maps.category_id')
                ->where('category_id', $dec_id)
                ->where('maps.status', 'publish')
                ->paginate(9),
            'pager'         => $this->mapsModel->pager,
            'kategori'      => $this->categoryModel->select('id, nama')->findAll(),
        ];

        return view('frontend/destinasi', $data);
    }

    // public function maps()
    // {
    //     $data   = [
    //         'active'        => 'eksplore',
    //         'kategori'      => $this->categoryModel->select('id, nama')->findAll(),
    //         'maps'          => $this->mapsModel->findAll(),
    //         'js'            => 'graphs.js'
    //     ];
    //     return view('frontend/maps', $data);
    // }

    public function tentang()
    {
        $data   = [
            'title'         => 'Tentang',
            'active'        => 'tentang',
            'kategori'      => $this->categoryModel->select('id, nama')->findAll()
        ];
        return view('frontend/tentang', $data);
    }

    public function profile()
    {
        $data   = [
            'kategori'      => $this->categoryModel->select('id, nama')->findAll(),
            'profile'       => $this->userModel->find(decrypt_url(session()->get('id')))
        ];
        return view('frontend/profile', $data);
    }

    // public function search()
    // {
    //     $search = $this->request->getVar('search');
    //     $data = [
    //         'active'        => 'search',
    //         'kategori'      => $this->categoryModel->select('id, nama')->findAll(),
    //         'search'        => $this->mapsModel
    //             ->select('maps.id, maps.title, maps.lat, maps.lng, maps.desc, maps.alamat, maps.cover, maps.created_at, category.nama')
    //             ->join('category', 'category.id=maps.category_id')
    //             ->where('status', 'publish')
    //             ->like('title', $search)
    //             ->orLike('nama', $search)
    //             ->paginate(9),
    //         'pager'         => $this->mapsModel->pager,
    //     ];
    //     return view('frontend/search', $data);
    // }

    public function rating()
    {
        if ($this->request->isAjax()) {
            $maps_id = decrypt_url($this->request->getVar('maps_id'));
            $rating = $this->request->getVar('rating');

            if (session()->get('logged_in')) {
                $user_id = decrypt_url(session()->get('id'));
                $set_rating = $this->setRating($user_id, $maps_id, $rating);
                if ($set_rating == true) {
                    $msg = [
                        'status' => 'success',
                        'message' => 'Terima kasih atas penilaian anda!'
                    ];
                } else {
                    $msg = [
                        'status' => 'error',
                        'message' => 'Mohon maaf kesalahan server!'
                    ];
                }
            } else {
                $msg = [
                    'status' => 'invalid_login',
                    'message' => 'Anda belum login!'
                ];
            }

            echo json_encode($msg);
        }
    }

    private function setRating($user_id, $maps_id, $rating)
    {
        $check_rating = $this->db->table('rating')
            ->select('rating')
            ->where('maps_id', $maps_id)
            ->where('users_id', $user_id)
            ->countAllResults();

        if ($check_rating > 0) {
            $data = [
                'maps_id' => $maps_id,
                'rating' => $rating,
                'updated_at' => date('Y-m-d H:i:s')
            ];
            $this->db->table('rating')
                ->update($data, ['users_id' => $user_id, 'maps_id' => $maps_id]);

            if ($this->db->affectedRows() > 0) {
                return true;
            } else {
                return false;
            }
        } else {
            $data = [
                'maps_id' => $maps_id,
                'users_id' => $user_id,
                'rating' => $rating,
                'created_at' => date('Y-m-d H:i:s')
            ];
            $this->db->table('rating')->insert($data);

            if ($this->db->affectedRows() > 0) {
                return true;
            } else {
                return false;
            }
        }
    }

    private function getPengunjung($maps_id)
    {
        $agent = $this->request->getUserAgent();
        $session_id = session()->session_id;

        $check_session_id_on_day = $this->db->table('pengunjung')
            ->select('maps_id')
            ->where('maps_id', $maps_id)
            ->where('session_id', $session_id)
            ->where('created_at', date('Y-m-d'))
            ->get()->getResultArray();
        if (count($check_session_id_on_day) <= 0) {
            $data = [
                'ip_address' => $this->request->getIPAddress(),
                'device' => $agent->getPlatform(),
                'maps_id' => $maps_id,
                'session_id' => $session_id,
                'created_at' => date('Y-m-d')
            ];

            $this->db->table('pengunjung')->insert($data);
        }
    }
}
