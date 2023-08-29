<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use Hermawan\DataTables\DataTable;
use App\Models\CategoryModel;

class KategoriController extends BaseController
{

    protected $category, $validation, $db;

    public function __construct()
    {
        $this->category = new CategoryModel();
        $this->validation = \Config\Services::validation();
        $this->db = \Config\Database::connect();
    }

    public function index()
    {
        $data = [
            'title' => 'Kategori Wisata',
            'active' => 'kategori',
            'js' => 'kategori.js'
        ];

        return view('admin/kategori/index', $data);
    }

    public function datatables()
    {
        if ($this->request->isAJAX()) {
            $builder = $this->db->table('category')
                ->select('id, nama, keterangan')
                ->orderBy('id', 'desc');

            return DataTable::of($builder)
                ->addNumbering('no')
                ->add('option', function ($row) {
                    return "<div class=\"dropdown text-center\">
                            <button type=\"button\" class=\"btn p-0 dropdown-toggle hide-arrow\" data-bs-toggle=\"dropdown\">
                              <i class=\"bx bx-dots-vertical-rounded\"></i>
                            </button>
                            <div class=\"dropdown-menu\">
                              <a class=\"dropdown-item\" href=\"javascript:void(0);\" onclick=\"edit('" . encrypt_url($row->id) . "')\"><i class=\"bx bx-edit-alt me-1\"></i> Edit</a>
                              <a class=\"dropdown-item\" href=\"javascript:void(0);\" onclick=\"hapus('" . encrypt_url($row->id) . "')\"><i class=\"bx bx-trash me-1\"></i> Delete</a>
                            </div>
                          </div>";
                })
                ->toJson(true);
        }
    }

    public function add()
    {
        if ($this->request->isAJAX()) {
            $msg = [
                'message' => view('admin/kategori/form_add')
            ];

            return $this->response->setJSON($msg);
        }
    }

    public function check_duplicate()
    {
        if ($this->request->isAJAX()) {
            $nama = $this->request->getPost('nama');

            $isDuplicate = $this->category->where('nama', $nama)->countAllResults() > 0;

            $response = [
                'duplicate' => $isDuplicate
            ];

            return $this->response->setJSON($response);
        }
    }

    public function store()
    {
        if ($this->request->isAJAX()) {
            $validationRules = [
                'nama' => [
                    'rules' => 'required|is_unique[category.nama]|regex_match[/^[a-zA-Z\s]+$/]',
                    'errors' => [
                        'required' => 'Nama harus diisi',
                        'is_unique' => 'Nama sudah ada, silakan masukkan nama lain',
                        'regex_match' => 'Nama hanya boleh mengandung huruf dan spasi'
                    ]
                ]
            ];

            $validatedData = $this->validate($validationRules);

            if (!$validatedData) {
                $msg = [
                    'error' => $this->validator->getErrors()
                ];
            } else {
                $nama = $this->request->getPost('nama', FILTER_SANITIZE_STRING);
                $keterangan = $this->request->getPost('keterangan', FILTER_SANITIZE_STRING);

                if (preg_match('/[\'"&]/', $nama) || preg_match('/[\'"&]/', $keterangan)) {
                    // Terdapat karakter khusus yang tidak diperbolehkan
                    $msg = [
                        'error' => 'Input tidak valid'
                    ];
                    return $this->response->setJSON($msg);
                }

                $data = [
                    'nama' => $nama,
                    'keterangan' => $keterangan
                ];

                $this->db->table('category')->insert($data);

                $msg = [
                    'message' => 'Data berhasil ditambahkan'
                ];
            }

            return $this->response->setJSON($msg);
        }
    }

    public function edit()
    {
        if ($this->request->isAJAX()) {
            $id = decrypt_url($this->request->getVar('id'));

            $data = [
                'kategori' => $this->category->find($id)
            ];

            $msg = [
                'message' => view('admin/kategori/form_edit', $data)
            ];

            return $this->response->setJSON($msg);
        }
    }

    public function update()
    {
        if ($this->request->isAJAX()) {
            $id = decrypt_url($this->request->getPost('id_edit', FILTER_SANITIZE_STRING));
            $validationRules = [
                'nama_edit' => [
                    'rules' => "required|is_unique[category.nama,id,$id]|regex_match[/^[a-zA-Z\s]+$/]",
                    'errors' => [
                        'required' => 'Nama harus diisi',
                        'is_unique' => 'Nama sudah ada, silakan masukkan nama lain',
                        'regex_match' => 'Nama hanya boleh mengandung huruf dan spasi'
                    ]
                ]
            ];

            $validatedData = $this->validate($validationRules);

            if (!$validatedData) {
                $msg = [
                    'error' => $this->validator->getErrors()
                ];
            } else {
                $nama = $this->request->getPost('nama_edit', FILTER_SANITIZE_STRING);
                $keterangan = $this->request->getPost('keterangan_edit', FILTER_SANITIZE_STRING);

                if (preg_match('/[^a-zA-Z\s]/', $nama)) {
                    // Terdapat karakter khusus yang tidak diperbolehkan pada Nama
                    $msg = [
                        'error' => 'Input tidak valid'
                    ];
                    return $this->response->setJSON($msg);
                }

                $data = [
                    'nama' => $nama,
                    'keterangan' => $keterangan
                ];

                $this->db->table('category')->where('id', $id)->update($data);

                $msg = [
                    'message' => 'Data berhasil diperbarui'
                ];
            }

            return $this->response->setJSON($msg);
        }
    }

    public function delete()
    {
        if ($this->request->isAJAX()) {
            $id = decrypt_url($this->request->getVar('id'));

            $this->category->delete($id);

            $msg = [
                'message' => 'Data berhasil dihapus!'
            ];

            return $this->response->setJSON($msg);
        }
    }
}
