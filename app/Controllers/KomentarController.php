<?php

namespace App\Controllers;

use App\Controllers\BaseController;

use App\Models\KomentarModel;
use Hermawan\DataTables\DataTable;

class KomentarController extends BaseController
{

    protected $komentarModel;
    protected $validation;
    protected $db;

    public function __construct()
    {
        $this->komentarModel    = new KomentarModel();
        $this->validation       = \Config\Services::validation();
        $this->db               = \Config\Database::connect();
    }

    public function index()
    {
        $data = [
            'title' => 'Manajemen Komentar',
            'active' => 'komentar',
            'js' => 'komentar.js',
        ];

        return view('admin/komentar/index', $data);
    }

    public function datatables()
    {
        if ($this->request->isAjax()) {
            $builder = $this->db->table('komentar')
                ->select('komentar.id, nama, title, body, komentar.status')
                ->join('users', 'users.id=komentar.user_id')
                ->join('maps', 'maps.id=komentar.maps_id')
                ->orderBy('id', 'desc');

            return DataTable::of($builder)
                ->addNumbering('no')
                ->add('status', function ($row) {
                    if ($row->status == 'pending') {
                        $label_color = 'warning';
                        $label = 'Pending';
                    } else if ($row->status == 'approve') {
                        $label_color = 'success';
                        $label = 'Approved';
                    } else {
                        $label_color = 'danger';
                        $label = 'Rejected';
                    }
                    return '<span class="badge rounded-pill bg-' . $label_color . '">' . $label . '</span>';
                })
                ->add('option', function ($row) {
                    return "<div class=\"dropdown text-center\">
                            <button type=\"button\" class=\"btn p-0 dropdown-toggle hide-arrow\" data-bs-toggle=\"dropdown\">
                              <i class=\"bx bx-dots-vertical-rounded\"></i>
                            </button>
                            <div class=\"dropdown-menu\">
                              <a class=\"dropdown-item\" href=\"javascript:void(0);\" onclick=\"detail('" . encrypt_url($row->id) . "')\"><i class=\"bx bx-show-alt me-1\"></i> Detail</a>
                              <a class=\"dropdown-item\" href=\"javascript:void(0);\" onclick=\"approve('" . encrypt_url($row->id) . "')\"><i class=\"bx bx-check me-1\"></i> Approve</a>
                              <a class=\"dropdown-item\" href=\"javascript:void(0);\" onclick=\"reject('" . encrypt_url($row->id) . "')\"><i class=\"bx bx-x me-1\"></i> Reject</a>
                              <a class=\"dropdown-item\" href=\"javascript:void(0);\" onclick=\"hapus('" . encrypt_url($row->id) . "')\"><i class=\"bx bx-trash me-1\"></i> Delete</a>
                            </div>
                          </div>";
                })
                ->toJson(true);
        }
    }

    public function store()
    {
        if ($this->request->isAJAX()) {
            $validasi = $this->validate([
                'body' => [
                    'rules' => 'required',
                    'errors' => [
                        'required' => 'Komentar harus di isi'
                    ]
                ],

            ]);

            if (!$validasi) {
                $msg = [
                    'error' => [
                        'body' => $this->validation->getError('body'),
                    ]
                ];
            } else {
                $user_id    = decrypt_url(session()->get('id'));
                $maps_id    = decrypt_url($this->request->getVar('maps_id'));
                $body       = $this->request->getVar('body');
                $created_at = date('Y-m-d H:i:s');

                $data = [
                    'user_id' => $user_id,
                    'maps_id' => $maps_id,
                    'body' => $body,
                    'status' => 'pending',
                    'created_at' => $created_at,
                ];
                $this->komentarModel->insert($data);

                $msg = [
                    'message' =>  'Komentar berhasil di tambah',
                ];
            }

            echo json_encode($msg);
        }
    }

    public function detail()
    {
        if ($this->request->isAjax()) {
            $dec_id = decrypt_url($this->request->getVar('id'));
            $data = [
                'komentar' => $this->komentarModel
                    ->select('komentar.id, nama, title, body, komentar.status')
                    ->join('users', 'users.id=komentar.user_id')
                    ->join('maps', 'maps.id=komentar.maps_id')
                    ->where('komentar.id', $dec_id)
                    ->first(),
            ];

            $msg = [
                'message' => view('admin/komentar/form_detail', $data),
            ];

            echo json_encode($msg);
        }
    }

    public function approve()
    {
        if ($this->request->isAJAX()) {
            $id = decrypt_url($this->request->getVar('id'));
            $this->komentarModel->update($id, ['status' => 'approve']);

            $msg = [
                'message' => 'Komentar berhasil di approve!',
            ];
            echo json_encode($msg);
        }
    }

    public function reject()
    {
        if ($this->request->isAJAX()) {
            $id = decrypt_url($this->request->getVar('id'));
            $this->komentarModel->update($id, ['status' => 'reject']);

            $msg = [
                'message' => 'Komentar berhasil di reject!',
            ];
            echo json_encode($msg);
        }
    }

    public function delete()
    {
        if ($this->request->isAJAX()) {
            $id = decrypt_url($this->request->getVar('id'));
            $this->komentarModel->delete($id);

            $msg = [
                'message' => 'Data berhasil dihapus!',
            ];
            echo json_encode($msg);
        }
    }
}
