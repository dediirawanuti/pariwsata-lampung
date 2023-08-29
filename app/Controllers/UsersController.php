<?php

namespace App\Controllers;

use App\Controllers\BaseController;

use App\Models\UsersModel;
use Hermawan\DataTables\DataTable;

class UsersController extends BaseController
{

    protected $usersModel;
    protected $validation;
    protected $db;

    public function __construct()
    {
        $this->usersModel = new UsersModel();
        $this->validation =  \Config\Services::validation();
        $this->db      = \Config\Database::connect();
    }

    public function index()
    {
        $data = [
            'title' => 'Manajemen Users',
            'active' => 'users',
            'js' => 'users.js',
        ];

        return view('admin/users/index', $data);
    }

    public function datatables()
    {
        if ($this->request->isAjax()) {
            $builder = $this->db->table('users')
                ->select('id, nama, hak_akses, lasted_login, status, foto')
                ->orderBy('id', 'desc');

            return DataTable::of($builder)
                ->addNumbering('no')
                ->add('lasted_login', function ($row) {
                    if ($row->lasted_login == null) {
                        $last = '<span class="badge rounded-pill bg-label-dark">Belum Pernah Login</span>';
                    } else {
                        $last = '<span class="badge rounded-pill bg-label-info">' . convertTanggal(date('Y-m-d', strtotime($row->lasted_login))) . ' ' . date('H:i:s', strtotime($row->lasted_login)) . '</span>';
                    }
                    return $last;
                })
                ->add('status', function ($row) {
                    if ($row->status == 'aktif') {
                        $label_color = 'success';
                        $label = 'Aktif';
                    } else {
                        $label_color = 'danger';
                        $label = 'Tidak Aktif';
                    }
                    return '<span class="badge rounded-pill bg-' . $label_color . '">' . $label . '</span>';
                })
                ->add('hak_akses', function ($row) {
                    if ($row->hak_akses == 'admin') {
                        $color = 'primary';
                        $label = 'Admin';
                    } else {
                        $color = 'info';
                        $label = $row->hak_akses;
                    }
                    return '<span class="badge rounded-pill bg-' . $color . '">' . $label . '</span>';
                })
                ->add('option', function ($row) {
                    return "<div class=\"dropdown text-center\">
                            <button type=\"button\" class=\"btn p-0 dropdown-toggle hide-arrow\" data-bs-toggle=\"dropdown\">
                              <i class=\"bx bx-dots-vertical-rounded\"></i>
                            </button>
                            <div class=\"dropdown-menu\">
                              <a class=\"dropdown-item\" href=\"javascript:void(0);\" onclick=\"detail('" . encrypt_url($row->id) . "')\"><i class=\"bx bx-show-alt me-1\"></i> Detail</a>
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
                'message' => view('admin/users/form_add')
            ];
            echo json_encode($msg);
        }
    }

    public function store()
    {
        if ($this->request->isAJAX()) {
            $validationRules = [
                'nama' => [
                    'rules' => 'required|regex_match[/^[a-zA-Z\s]+$/]',
                    'errors' => [
                        'required' => 'Nama harus diisi',
                        'regex_match' => 'Nama hanya boleh mengandung huruf dan spasi',
                    ],
                ],
                'username' => [
                    'rules' => 'required|regex_match[/^[A-Za-z0-9_.]+$/]|is_unique[users.username]',
                    'errors' => [
                        'required' => 'Username harus diisi',
                        'regex_match' => 'Username hanya boleh terdiri dari huruf, angka, garis bawah (_), dan titik (.)',
                        'is_unique' => 'Username sudah digunakan',
                    ],
                ],
                'email' => [
                    'rules' => 'required|is_unique[users.email]|valid_email',
                    'errors' => [
                        'required' => 'Email harus diisi',
                        'is_unique' => 'Email sudah digunakan',
                        'valid_email' => 'Email tidak valid',
                    ],
                ],
                'password' => [
                    'rules' => 'required|min_length[8]|regex_match[/^(?=.*[A-Z]).+$/]',
                    'errors' => [
                        'required' => 'Password harus diisi',
                        'min_length' => 'Password harus memiliki minimal 8 karakter',
                        'regex_match' => 'Password harus terdiri dari minimal 8 Kombinasi karakter dan huruf kapital',
                    ],
                ],
                'ulangi_password' => [
                    'rules' => 'required|matches[password]',
                    'errors' => [
                        'required' => 'Ulangi password harus diisi',
                        'matches' => 'Password tidak sama',
                    ],
                ],
                'hak_akses' => [
                    'rules' => 'required',
                    'errors' => [
                        'required' => 'Hak Akses harus diisi',
                    ],
                ],
                'status' => [
                    'rules' => 'required',
                    'errors' => [
                        'required' => 'Status harus diisi',
                    ],
                ],
                'foto' => [
                    'rules' => 'mime_in[foto,image/png,image/jpg,image/jpeg,image/gif]|is_image[foto]',
                    'errors' => [
                        'mime_in' => 'File Ekstensi harus berupa PNG/JPG/JPEG/GIF',
                        'is_image' => 'File yang diunggah bukan gambar',
                    ],
                ],
            ];

            $validasi = $this->validate($validationRules);

            if (!$validasi) {
                $msg = [
                    'error' => [
                        'nama' => $this->validation->getError('nama'),
                        'username' => $this->validation->getError('username'),
                        'email' => $this->validation->getError('email'),
                        'password' => $this->validation->getError('password'),
                        'ulangi_password' => $this->validation->getError('ulangi_password'),
                        'hak_akses' => $this->validation->getError('hak_akses'),
                        'status' => $this->validation->getError('status'),
                        'foto' => $this->validation->getError('foto'),
                    ],
                ];
            } else {
                // Lakukan operasi upload foto jika ada file
                if ($this->request->getFile('foto')->isValid()) {
                    $allowedExtensions = ['jpg', 'jpeg', 'png'];
                    $allowedMimeTypes = ['image/jpeg', 'image/png', 'image/jpg'];
                    $fileExt = $this->request->getFile('foto')->getClientExtension();
                    $fileMimeType = mime_content_type($this->request->getFile('foto')->getTempName());

                    // Check if the file extension and MIME type are valid
                    if (!in_array($fileExt, $allowedExtensions) || !in_array($fileMimeType, $allowedMimeTypes) || $fileMimeType === 'application/pdf') {
                        $msg = [
                            'error' => [
                                'foto' => 'File harus berupa JPG/JPEG/PNG',
                            ],
                        ];
                        echo json_encode($msg);
                        return;
                    }

                    // Additional check to validate the file content
                    $imageInfo = @getimagesize($this->request->getFile('foto')->getTempName());
                    if (!$imageInfo) {
                        $msg = [
                            'error' => [
                                'foto' => 'File harus berupa gambar',
                            ],
                        ];
                        echo json_encode($msg);
                        return;
                    }

                    $foto = $this->request->getFile('foto');
                    $filename = $foto->getRandomName();

                    $foto->move('writable/images/profile', $filename);
                } else {
                    $filename = 'no-image.jpg';
                }

                $data = [
                    'nama' => $this->request->getVar('nama'),
                    'username' => $this->request->getVar('username'),
                    'email' => $this->request->getVar('email'),
                    'password' => password_hash($this->request->getVar('password'), PASSWORD_BCRYPT),
                    'hak_akses' => $this->request->getVar('hak_akses'),
                    'status' => $this->request->getVar('status'),
                    'foto' => $filename,
                    'created_at' => date('Y-m-d H:i:s'),
                ];
                $this->usersModel->insert($data);

                $msg = [
                    'message' =>  'Data berhasil ditambahkan',
                ];
            }
            // }

            echo json_encode($msg);
        }
    }


    public function edit()
    {
        if ($this->request->isAjax()) {
            $id = decrypt_url($this->request->getVar('id'));
            $users = $this->usersModel->find($id);
            $data = [
                'users' => $users,
            ];

            $msg = [
                'message' => view('admin/users/form_edit', $data),
            ];

            echo json_encode($msg);
        }
    }

    // public function update()
    // {
    //     if ($this->request->isAJAX()) {
    //         $id = decrypt_url($this->request->getVar('id'));
    //         $old_data = $this->usersModel->find($id);

    //         if (count($old_data) > 0 && $old_data['username'] == $this->request->getVar('username')) {
    //             $rules_username = 'required';
    //         } else {
    //             $rules_username = 'required|is_unique[users.username]|regex_match[/^[A-Za-z0-9_.]+$/]';
    //         }

    //         if (count($old_data) > 0 && $old_data['email'] == $this->request->getVar('email')) {
    //             $rules_email = 'required|valid_email';
    //         } else {
    //             $rules_email = 'required|is_unique[users.email]|valid_email';
    //         }

    //         $validasi = $this->validate([
    //             'nama' => [
    //                 'rules' => 'required|regex_match[/^[a-zA-Z\s]+$/]',
    //                 'errors' => [
    //                     'required' => 'Nama harus diisi',
    //                     'regex_match' => 'Nama hanya boleh mengandung huruf dan spasi',
    //                 ],
    //             ],
    //             'username' => [
    //                 'rules' => $rules_username,
    //                 'errors' => [
    //                     'required' => 'Username harus di isi',
    //                     'is_unique' => 'Username sudah digunakan',
    //                     'regex_match' => 'Username hanya boleh terdiri dari huruf, angka, garis bawah (_), dan titik (.)',
    //                 ],
    //             ],
    //             'email' => [
    //                 'rules' => $rules_email,
    //                 'errors' => [
    //                     'required' => 'Email harus di isi',
    //                     'is_unique' => 'Email sudah digunakan',
    //                     'valid_email' => 'Email tidak valid',
    //                 ],
    //             ],
    //             'password' => [
    //                 'rules' => 'required|min_length[8]|regex_match[/^(?=.*[A-Z]).+$/]',
    //                 'errors' => [
    //                     'required' => 'Password harus diisi',
    //                     'min_length' => 'Password minimal harus terdiri dari 8 karakter',
    //                     'regex_match' => 'Password harus terdiri dari minimal 8 karakter dan memiliki setidaknya satu huruf kapital',
    //                 ],
    //             ],
    //             'ulangi_password' => [
    //                 'rules' => 'matches[password]',
    //                 'errors' => [
    //                     'matches' => 'Password tidak sama',
    //                 ],
    //             ],
    //             'hak_akses' => [
    //                 'rules' => 'required',
    //                 'errors' => [
    //                     'required' => 'Hak Akses harus di isi',
    //                 ],
    //             ],
    //             'status' => [
    //                 'rules' => 'required',
    //                 'errors' => [
    //                     'required' => 'Status harus di isi',
    //                 ],
    //             ],
    //             'foto' => [
    //                 'rules' => 'permit_empty|uploaded[foto]|ext_in[foto,jpg,jpeg,png]|is_image[foto]|max_size[foto,2096]',
    //                 'errors' => [
    //                     'uploaded' => 'Foto harus diunggah',
    //                     'ext_in' => 'File Ekstensi harus berupa JPG/JPEG/PNG',
    //                     'is_image' => 'File yang diunggah bukan gambar',
    //                     'max_size' => 'Ukuran file maksimal 2 MB',
    //                 ],
    //             ],
    //         ]);

    //         if (!$validasi) {
    //             $msg = [
    //                 'error' => [
    //                     'nama' => $this->validation->getError('nama'),
    //                     'username' => $this->validation->getError('username'),
    //                     'email' => $this->validation->getError('email'),
    //                     'hak_akses' => $this->validation->getError('hak_akses'),
    //                     'status' => $this->validation->getError('status'),
    //                     'password' => $this->validation->getError('password'),
    //                     'ulangi_password' => $this->validation->getError('ulangi_password'),
    //                     'foto' => $this->validation->getError('foto'),
    //                 ],
    //             ];
    //         } else {
    //             // Lakukan pembaruan foto hanya jika ada file foto yang diunggah
    //             if ($this->request->getFile('foto')->isValid()) {
    //                 // Upload foto baru
    //                 $foto = $this->request->getFile('foto');
    //                 $filename = $foto->getRandomName();
    //                 $foto->move('writable/images/profile', $filename);

    //                 // Tambahkan ke data yang akan diperbarui
    //                 $data['foto'] = $filename;

    //                 // Hapus foto lama jika bukan foto default
    //                 if ($old_data['foto'] !== 'no-image.jpg') {
    //                     @unlink('writable/images/profile/' . $old_data['foto']);
    //                 }
    //             } else {
    //                 $filename = $old_data['foto'];
    //             }

    //             $data = [
    //                 'nama' => $this->request->getVar('nama'),
    //                 'username' => $this->request->getVar('username'),
    //                 'email' => $this->request->getVar('email'),
    //                 'hak_akses' => $this->request->getVar('hak_akses'),
    //                 'status' => $this->request->getVar('status'),
    //                 'updated_at' => date('Y-m-d H:i:s'),
    //             ];

    //             // Jika password diisi, tambahkan ke data yang akan diupdate
    //             if (!empty($this->request->getVar('password'))) {
    //                 $data['password'] = password_hash($this->request->getVar('password'), PASSWORD_BCRYPT);
    //             }

    //             $this->usersModel->update($id, $data);

    //             $msg = [
    //                 'message' => 'Data berhasil di simpan',
    //             ];
    //         }

    //         echo json_encode($msg);
    //     }
    // }

    public function update()
    {
        if ($this->request->isAJAX()) {
            $id = decrypt_url($this->request->getVar('id'));
            $old_data = $this->usersModel->find($id);

            if (count($old_data) > 0 && $old_data['username'] == $this->request->getVar('username')) {
                $rules_username = 'required';
            } else {
                $rules_username = 'required|is_unique[users.username]|regex_match[/^[A-Za-z0-9_.]+$/]';
            }

            if (count($old_data) > 0 && $old_data['email'] == $this->request->getVar('email')) {
                $rules_email = 'required|valid_email';
            } else {
                $rules_email = 'required|is_unique[users.email]|valid_email';
            }

            // Validasi file foto hanya jika ada file yang diunggah
            if ($this->request->getFile('foto')->isValid()) {
                $allowedExtensions = ['jpg', 'jpeg', 'png'];
                $allowedMimeTypes = ['image/jpeg', 'image/png', 'image/jpg'];
                $fileExt = $this->request->getFile('foto')->getClientExtension();
                $fileMimeType = $this->request->getFile('foto')->getClientMimeType();

                // Check if the file extension and MIME type are valid
                if (!in_array($fileExt, $allowedExtensions) || !in_array($fileMimeType, $allowedMimeTypes)) {
                    $msg = [
                        'error' => [
                            'foto' => 'File harus berupa JPG/JPEG/PNG',
                        ],
                    ];
                    echo json_encode($msg);
                    return;
                }

                // Additional check to validate the file content
                $imageInfo = @getimagesize($this->request->getFile('foto')->getTempName());
                if (!$imageInfo) {
                    $msg = [
                        'error' => [
                            'foto' => 'File harus berupa gambar',
                        ],
                    ];
                    echo json_encode($msg);
                    return;
                }

                // Upload foto baru
                $foto = $this->request->getFile('foto');
                $filename = $foto->getRandomName();
                $foto->move('writable/images/profile', $filename);

                // Hapus foto lama jika bukan foto default
                if ($old_data['foto'] !== 'no-image.jpg') {
                    @unlink('writable/images/profile/' . $old_data['foto']);
                }
            } else {
                $filename = $old_data['foto'];
            }

            $validasi = $this->validate([
                'nama' => [
                    'rules' => 'required|regex_match[/^[a-zA-Z\s]+$/]',
                    'errors' => [
                        'required' => 'Nama harus diisi',
                        'regex_match' => 'Nama hanya boleh mengandung huruf dan spasi',
                    ],
                ],
                'username' => [
                    'rules' => $rules_username,
                    'errors' => [
                        'required' => 'Username harus di isi',
                        'is_unique' => 'Username sudah digunakan',
                        'regex_match' => 'Username hanya boleh terdiri dari huruf, angka, garis bawah (_), dan titik (.)',
                    ],
                ],
                'email' => [
                    'rules' => $rules_email,
                    'errors' => [
                        'required' => 'Email harus di isi',
                        'is_unique' => 'Email sudah digunakan',
                        'valid_email' => 'Email tidak valid',
                    ],
                ],
                'password' => [
                    'rules' => 'required|min_length[8]|regex_match[/^(?=.*[A-Z]).+$/]',
                    'errors' => [
                        'required' => 'Password harus diisi',
                        'min_length' => 'Password minimal harus terdiri dari 8 karakter',
                        'regex_match' => 'Password harus terdiri dari minimal 8 karakter dan memiliki setidaknya satu huruf kapital',
                    ],
                ],
                'ulangi_password' => [
                    'rules' => 'matches[password]',
                    'errors' => [
                        'matches' => 'Password tidak sama',
                    ],
                ],
                'hak_akses' => [
                    'rules' => 'required',
                    'errors' => [
                        'required' => 'Hak Akses harus di isi',
                    ],
                ],
                'status' => [
                    'rules' => 'required',
                    'errors' => [
                        'required' => 'Status harus di isi',
                    ],
                ],
            ]);

            if (!$validasi) {
                $msg = [
                    'error' => [
                        'nama' => $this->validation->getError('nama'),
                        'username' => $this->validation->getError('username'),
                        'email' => $this->validation->getError('email'),
                        'hak_akses' => $this->validation->getError('hak_akses'),
                        'status' => $this->validation->getError('status'),
                        'password' => $this->validation->getError('password'),
                        'ulangi_password' => $this->validation->getError('ulangi_password'),
                        'foto' => $this->validation->getError('foto'),
                    ],
                ];
            } else {
                $data = [
                    'nama' => $this->request->getVar('nama'),
                    'username' => $this->request->getVar('username'),
                    'email' => $this->request->getVar('email'),
                    'hak_akses' => $this->request->getVar('hak_akses'),
                    'status' => $this->request->getVar('status'),
                    'updated_at' => date('Y-m-d H:i:s'),
                    'foto' => $filename, // Gunakan filename baru untuk data yang akan diperbarui
                ];

                // Jika password diisi, tambahkan ke data yang akan diupdate
                if (!empty($this->request->getVar('password'))) {
                    $data['password'] = password_hash($this->request->getVar('password'), PASSWORD_BCRYPT);
                }

                $this->usersModel->update($id, $data);

                $msg = [
                    'message' => 'Data berhasil disimpan',
                ];
            }

            echo json_encode($msg);
        }
    }

    public function detail()
    {
        if ($this->request->isAjax()) {
            $id = decrypt_url($this->request->getVar('id'));
            $data = [
                'users' => $this->usersModel->find($id)
            ];

            $msg = [
                'message' => view('admin/users/form_detail', $data),
            ];

            echo json_encode($msg);
        }
    }

    public function change_password()
    {
        if ($this->request->isAjax()) {
            $validasi = $this->validate([
                'password_lama' => [
                    'rules' => 'required|min_length[8]',
                    'errors' => [
                        'required' => 'Password lama harus di isi',
                        'min_length' => 'Password harus di isi minimal 8 karakter',
                    ]
                ],
                'password' => [
                    'rules' => 'required|min_length[8]|differs[password_lama]|regex_match[/^(?=.*[A-Z]).+$/]',
                    'errors' => [
                        'required' => 'Password harus di isi',
                        'min_length' => 'Password harus di isi minimal 8 karakter',
                        'differs' => 'Password harus berbeda dengan password lama',
                        'regex_match' => 'Password harus memiliki setidaknya satu huruf kapital'
                    ]
                ],
                'ulangi_password' => [
                    'rules' => 'required|min_length[8]|matches[password]',
                    'errors' => [
                        'required' => 'Ulangi password harus di isi',
                        'min_length' => 'Password harus di isi minimal 8 karakter',
                        'matches' => 'Password tidak sama'
                    ]
                ]
            ]);

            if (!$validasi) {
                $msg = [
                    'error' => [
                        'password_lama' => $this->validation->getError('password_lama'),
                        'password' => $this->validation->getError('password'),
                        'ulangi_password' => $this->validation->getError('ulangi_password'),
                    ]
                ];
            } else {
                $id = decrypt_url($this->request->getVar('id'));
                $password_lama = $this->request->getVar('password_lama');
                $data = $this->usersModel->find($id);
                $cek_password = password_verify($password_lama, $data['password']);

                if (!$cek_password) {
                    $msg = [
                        'error' => [
                            'password_lama' => 'Password lama tidak sesuai',
                        ]
                    ];
                } else {
                    $changed_password = password_hash($this->request->getVar('password'), PASSWORD_DEFAULT);

                    $data = [
                        'password' => $changed_password
                    ];

                    $this->usersModel->update($id, $data);

                    $msg = [
                        'message' => 'Password berhasil di ubah!'
                    ];
                }
            }
            echo json_encode($msg);
        }
    }

    public function change_profile()
    {
        if ($this->request->isAJAX()) {
            $id = decrypt_url($this->request->getVar('id'));
            $old_data = $this->usersModel->find($id);
            if (count($old_data) > 0 && $old_data['username'] == $this->request->getVar('username')) {
                $rules_username = 'required';
            } else {
                $rules_username = 'required|is_unique[users.username]|regex_match[/^[A-Za-z0-9_.]+$/]';
            }
            if (count($old_data) > 0 && $old_data['email'] == $this->request->getVar('email')) {
                $rules_email = 'required|valid_email';
            } else {
                $rules_email = 'required|is_unique[users.email]|valid_email';
            }

            $validasi = $this->validate([
                'nama' => [
                    'rules' => 'required|regex_match[/^[a-zA-Z\s]+$/]',
                    'errors' => [
                        'required' => 'Nama harus di isi',
                        'regex_match' => 'Nama hanya boleh mengandung huruf dan spasi',
                    ]
                ],
                'username' => [
                    'rules' => $rules_username,
                    'errors' => [
                        'required' => 'Username harus di isi',
                        'is_unique' => 'Username sudah digunakan',
                        'regex_match' => 'Username hanya boleh terdiri dari huruf, angka, garis bawah (_), dan titik (.)',
                    ]
                ],
                'email' => [
                    'rules' => $rules_email,
                    'errors' => [
                        'required' => 'email harus di isi',
                        'is_unique' => 'Email sudah digunakan',
                        'valid_email' => 'Email tidak valid',
                    ]
                ],

            ]);

            if (!$validasi) {
                $msg = [
                    'error' => [
                        'nama' => $this->validation->getError('nama'),
                        'username' => $this->validation->getError('username'),
                        'email' => $this->validation->getError('email'),
                    ]
                ];
            } else {
                $data = [
                    'nama' => $this->request->getVar('nama'),
                    'username' => $this->request->getVar('username'),
                    'email' => $this->request->getVar('email'),
                    'updated_at' => date('Y-m-d H:i:s'),
                ];
                $this->usersModel->update($id, $data);


                $msg = [
                    'message' =>  'Data berhasil di simpan',
                ];
            }

            echo json_encode($msg);
        }
    }

    public function change_foto()
    {
        if ($this->request->isAJAX()) {
            $id_user = decrypt_url($this->request->getVar('id'));
            $user = $this->usersModel->find($id_user);

            $validasi = $this->validate([
                'foto' => [
                    'rules' => 'mime_in[foto,image/png,image/jpg,image/jpeg,image/gif]|is_image[foto]',
                    'errors' => [
                        'mime_in' => 'File Ekstensi harus berupa PNG/JPG/JPEG/GIF',
                        'is_image' => 'File yang diunggah bukan gambar',
                    ],
                ],
            ]);

            if (!$validasi) {
                $msg = [
                    'error' => [
                        'foto' => $this->validation->getError('foto'),
                    ]
                ];
            } else {
                if ($this->request->getFile('foto')->isValid()) {
                    $allowedExtensions = ['jpg', 'jpeg', 'png'];
                    $allowedMimeTypes = ['image/jpeg', 'image/png', 'image/jpg'];
                    $fileExt = $this->request->getFile('foto')->getClientExtension();
                    $fileMimeType = $this->request->getFile('foto')->getClientMimeType();

                    // Check if the file extension and MIME type are valid
                    if (!in_array($fileExt, $allowedExtensions) || !in_array($fileMimeType, $allowedMimeTypes)) {
                        $msg = [
                            'error' => [
                                'foto' => 'File harus berupa JPG/JPEG/PNG',
                            ],
                        ];
                        echo json_encode($msg);
                        return;
                    }

                    // Additional check to validate the file content
                    $imageInfo = @getimagesize($this->request->getFile('foto')->getTempName());
                    if (!$imageInfo) {
                        $msg = [
                            'error' => [
                                'foto' => 'File harus berupa gambar',
                            ],
                        ];
                        echo json_encode($msg);
                        return;
                    }

                    // Upload foto baru
                    $foto = $this->request->getFile('foto');
                    $filename = $foto->getRandomName();
                    if ($user['foto'] != 'no-image.jpg') {
                        @unlink('writable/images/profile/' . $user['foto']);
                    }

                    $foto->move('writable/images/profile', $filename);
                } else {
                    $filename = $user['foto'];
                }

                $data = [
                    'foto' => $filename
                ];

                $this->usersModel->update($id_user, $data);
                if ($this->usersModel->affectedRows()) {
                    $msg = [
                        'status' =>  'success',
                        'message' =>  'Data berhasil di simpan',
                    ];
                } else {
                    $msg = [
                        'status' =>  'error',
                        'message' =>  'Data gagal di simpan',
                    ];
                }
            }

            echo json_encode($msg);
        }
    }

    public function delete()
    {
        if ($this->request->isAJAX()) {
            $id = decrypt_url($this->request->getVar('id'));
            $old_data = $this->usersModel->find($id);
            if ($old_data['foto'] != 'default.png') {
                @unlink('writable/images/profile/' . $old_data['foto']);
            }
            $this->usersModel->delete($id);

            $msg = [
                'message' => 'Data berhasil dihapus!',
            ];
            echo json_encode($msg);
        }
    }
}
