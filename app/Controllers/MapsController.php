<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\MapsModel;
use App\Models\CategoryModel;
use CodeIgniter\Validation\Rules;
use App\Models\DropzoneModel;
use Hermawan\DataTables\DataTable;

class MapsController extends BaseController
{

    protected $maps, $validation, $db;

    public function __construct()
    {
        $this->maps = new MapsModel();
        $this->kategori = new CategoryModel();
        // $this->graphs = new GraphsModel();
        // $this->dropzoneModel = new DropzoneModel();
        $this->validation = \Config\Services::validation();
        $this->db = \Config\Database::connect();
    }

    public function index()
    {

        $map = $this->db->table('maps')
            ->select('maps.id, title, category.nama, lat, lng, gmaps, desc, alamat, cover, status')
            ->join('category', 'maps.category_id = category.id')
            ->get()
            ->getResultArray();

        $data = [
            'title' => 'Maps Wisata',
            'active' => 'maps',
            'map' => $map,
            'js' => 'maps.js'
        ];

        return view('admin/maps/index', $data);
    }

    public function manajemenMaps()
    {
        $data = [
            'title' => 'Manajemen Maps',
            'active' => 'manajemen maps',
            'js' => 'manajemen-maps.js'
        ];

        return view('admin/maps/manajemen', $data);
    }

    public function datatables()
    {
        if ($this->request->isAJAX()) {
            $builder = $this->db->table('maps')
                ->select('maps.id, title, category.nama, lat, lng, desc, alamat, gmaps, cover, status')
                ->join('category', 'maps.category_id = category.id')
                ->orderBy('maps.id', 'desc');

            return DataTable::of($builder)
                ->addNumbering('no')
                ->add('status', function ($row) {
                    if ($row->status == 'publish') {
                        $color = 'success';
                        $label = 'Publish';
                    } else {
                        $color = 'secondary';
                        $label = 'Draft';
                    }
                    return '<span class="badge rounded-pill bg-' . $color . '">' . $label . '</span>';
                })
                ->add('option', function ($row) {
                    return "<div class=\"dropdown text-center\">
                            <button type=\"button\" class=\"btn p-0 dropdown-toggle hide-arrow\" data-bs-toggle=\"dropdown\">
                              <i class=\"bx bx-dots-vertical-rounded\"></i>
                            </button>
                            <div class=\"dropdown-menu\">
                              <a class=\"dropdown-item\" href=\"detail-maps/" . encrypt_url($row->id) . "\"><i class=\"bx bx-show-alt me-1\"></i> Detail</a>
                              <a class=\"dropdown-item\" href=\"edit/" . encrypt_url($row->id) . "\"><i class=\"bx bx-edit-alt me-1\"></i> Edit</a>
                              <a class=\"dropdown-item\" href=\"javascript:void(0);\" onclick=\"hapus('" . encrypt_url($row->id) . "')\"><i class=\"bx bx-trash me-1\"></i> Delete</a>
                            </div>
                          </div>";
                })
                ->toJson(true);
        }
    }

    public function detail($id)
    {
        $id = decrypt_url($id);

        $map = $this->db->table('maps')
            ->select('maps.id, title, category.nama, lat, lng, desc, gmaps, alamat, cover, status')
            ->join('category', 'maps.category_id = category.id')
            ->where('maps.id', $id)
            ->get()
            ->getResultArray();

        $data = [
            'title' => 'Detail Maps',
            'active' => 'manajemen maps',
            'map' => $map
        ];

        return view('admin/maps/detail', $data);
    }

    public function add()
    {
        $data = [
            'title' => 'Tambah Maps',
            'active' => 'manajemen maps',
            'kategori' => $this->kategori->findAll(),
            'js' => 'manajemen-maps.js'
        ];

        return view('admin/maps/form_add', $data);
    }

    public function store()
    {
        if ($this->request->isAJAX()) {
            $validationRules = [
                'title' => [
                    'rules' => "required|regex_match[/^[a-zA-Z\s_]+$/]|is_unique[maps.title]",
                    'errors' => [
                        'required' => 'Title harus diisi',
                        'regex_match' => 'Title hanya boleh mengandung huruf, spasi, dan underscore',
                        'is_unique' => 'Title sudah ada, silakan masukkan title lain'
                    ]
                ],
                'cover' => [
                    'rules' => 'mime_in[cover,image/png,image/jpg,image/jpeg]|is_image[cover]',
                    'errors' => [
                        'mime_in' => 'File harus berupa PNG/JPG/JPEG',
                        'is_image' => 'File yang diunggah bukan gambar',
                    ]
                ],
                'alamat' => [
                    'rules' => "required|regex_match[/^[a-zA-Z\s_]+$/]",
                    'errors' => [
                        'required' => 'Alamat harus diisi',
                        'regex_match' => 'Alamat hanya boleh mengandung huruf, spasi dan underscore'
                    ]
                ],
            ];

            $validatedData = $this->validate($validationRules);

            if (!$validatedData) {
                $msg = $this->validator->getErrors();
            } else {
                $file = $this->request->getFile('cover');

                // Periksa apakah file cover telah diunggah
                if ($file->isValid() && !$file->hasMoved() && $file->getClientMimeType() && $file->getClientMimeType()) {
                    $allowedExtensions = ['jpg', 'jpeg', 'png'];
                    $fileExt = $file->getClientExtension();

                    if (!in_array($fileExt, $allowedExtensions)) {
                        $msg = [
                            'error' => [
                                'cover' => 'File harus berupa JPG/JPEG/PNG',
                            ],
                        ];
                        echo json_encode($msg);
                        return;
                    }

                    $imageInfo = @getimagesize($this->request->getFile('cover')->getTempName());
                    if (!$imageInfo) {
                        $msg = [
                            'error' => [
                                'cover' => 'File harus berupa gambar',
                            ],
                        ];
                        echo json_encode($msg);
                        return;
                    }

                    $cover = $file->getRandomName();
                    $file->move('writable/images/maps', $cover);
                } else {
                    $cover = 'no-image.jpg';
                }


                $this->maps->save([
                    'title' => $this->request->getVar('title'),
                    'category_id' => $this->request->getVar('kategori'),
                    'gmaps' => $this->request->getVar('gmaps'),
                    'desc' => $_POST['desc'],
                    'alamat' => $this->request->getVar('alamat'),
                    'cover' => $cover,
                    'status' => $this->request->getVar('status'),
                ]);

                $msg = [
                    'message' => 'Berhasil tambah data maps!'
                ];

                return $this->response->setJSON($msg);
            }
        }
    }



    // public function store()
    // {
    //     if ($this->request->isAJAX()) {
    //         $validationRules = [
    //             'title' => [
    //                 'rules' => "required|regex_match[/^[a-zA-Z\s_]+$/]|is_unique[maps.title]",
    //                 'errors' => [
    //                     'required' => 'Title harus diisi',
    //                     'regex_match' => 'Title hanya boleh mengandung huruf, spasi, dan underscore',
    //                     'is_unique' => 'Title sudah ada, silakan masukkan title lain'
    //                 ]
    //             ],
    //             'cover' => [
    //                 'rules' => 'mime_in[cover,image/png,image/jpg,image/jpeg,image/gif]|is_image[cover]',
    //                 'errors' => [
    //                     'mime_in' => 'File Ekstensi harus berupa PNG/JPG/JPEG',
    //                     'is_image' => 'File yang diunggah bukan gambar',
    //                 ]
    //             ],
    //             'alamat' => [
    //                 'rules' => "required|regex_match[/^[a-zA-Z\s_]+$/]",
    //                 'errors' => [
    //                     'required' => 'Alamat harus diisi',
    //                     'regex_match' => 'Alamat hanya boleh mengandung huruf, spasi dan underscore'
    //                 ]
    //             ],
    //         ];

    //         $validatedData = $this->validate($validationRules);

    //         if (!$validatedData) {
    //             $msg = [
    //                 'error' => $this->validator->getErrors(),
    //             ];
    //             echo json_encode($msg);
    //             return;
    //         } else {
    //             $file = $this->request->getFile('cover');

    //             if ($file->isValid() && !$file->hasMoved() && $file->getClientMimeType() && $file->getClientMimeType()) {
    //                 $allowedExtensions = ['jpg', 'jpeg', 'png'];
    //                 $fileExt = $file->getClientExtension();

    //                 if (!in_array($fileExt, $allowedExtensions)) {
    //                     $msg = [
    //                         'error' => [
    //                             'cover' => 'File harus berupa JPG/JPEG/PNG',
    //                         ],
    //                     ];
    //                     echo json_encode($msg);
    //                     return;
    //                 }

    //                 $imageInfo = @getimagesize($this->request->getFile('foto')->getTempName());
    //                 if (!$imageInfo) {
    //                     $msg = [
    //                         'error' => [
    //                             'foto' => 'File harus berupa gambar',
    //                         ],
    //                     ];
    //                     echo json_encode($msg);
    //                     return;
    //                 }

    //                 $cover = $file->getRandomName();
    //                 $file->move('writable/images/maps', $cover);
    //             } else {
    //                 $cover = 'no-image.jpg';
    //             }


    //             $this->maps->save([
    //                 'title' => $this->request->getVar('title'),
    //                 'category_id' => $this->request->getVar('kategori'),
    //                 'gmaps' => $this->request->getVar('gmaps'),
    //                 'desc' => $_POST['desc'],
    //                 'alamat' => $this->request->getVar('alamat'),
    //                 'cover' => $cover,
    //                 'status' => $this->request->getVar('status'),
    //             ]);

    //             $msg = [
    //                 'message' => 'Berhasil tambah data maps!'
    //             ];

    //             return $this->response->setJSON($msg);
    //         }
    //     }
    // }

    public function edit($id)
    {
        $id = decrypt_url($id);

        $data = [
            'title' => 'Edit Maps',
            'active' => 'manajemen maps',
            'map' => $this->maps->find($id),
            // 'galery' => $this->dropzoneModel->where('maps_id', $id)->findAll(),
            'kategori' => $this->kategori->findAll(),
            'js' => 'manajemen-maps.js'
        ];

        return view('admin/maps/form_edit', $data);
    }

    // public function update()
    // {
    //     if ($this->request->isAJAX()) {

    //         $id = $this->request->getVar('id');

    //         $newCover = $this->request->getFile('foto');
    //         $oldCover = $this->maps->find($id);

    //         if (!file_exists($newCover)) {
    //             $cover = $oldCover['cover'];
    //         } else {
    //             @unlink('writable/images/maps/' . $oldCover['cover']);
    //             $name = $newCover->getRandomName();
    //             $newCover->move('writable/images/maps', $name);
    //             $cover = $name;
    //         }

    //         $this->maps->update($id, [
    //             'title' => $this->request->getVar('title'),
    //             'category_id' => $this->request->getVar('kategori'),
    //             'gmaps' => $this->request->getVar('gmaps'),
    //             'desc' => $_POST['desc'],
    //             'alamat' => $this->request->getVar('alamat'),
    //             'cover' => $cover,
    //             'status' => $this->request->getVar('status')
    //         ]);

    //         $msg = [
    //             'message' => 'Berhasil update maps !'
    //         ];

    //         return $this->response->setJSON($msg);
    //     }
    // }

    public function update()
    {
        if ($this->request->isAJAX()) {
            $id = $this->request->getVar('id');
            $validationRules = [
                'title' => [
                    'rules' => "required|regex_match[/^[a-zA-Z\s_]+$/]|is_unique[maps.title,id,$id]",
                    'errors' => [
                        'required' => 'Title harus diisi',
                        'regex_match' => 'Title hanya boleh mengandung huruf, spasi, dan underscore',
                        'is_unique' => 'Title sudah ada, silakan masukkan title lain'
                    ]
                ],
                'cover' => [
                    'rules' => 'mime_in[foto,image/png,image/jpg,image/jpeg,image/gif]|is_image[foto]',
                    'errors' => [
                        'mime_in' => 'File Ekstensi harus berupa PNG/JPG/JPEG/GIF',
                        'is_image' => 'File yang diunggah bukan gambar',
                    ]
                ],
                'alamat' => [
                    'rules' => "regex_match[/^[a-zA-Z\s_]+$/]",
                    'errors' => [
                        'regex_match' => 'Alamat hanya boleh mengandung huruf, spaci dan underscore'
                    ]
                ],
            ];

            $validatedData = $this->validate($validationRules);

            if (!$validatedData) {
                $msg = [
                    'error' => $this->validator->getErrors()
                ];
            } else {
                $old_data = $this->maps->find($id);

                if ($this->request->getFile('cover') && $this->request->getFile('cover')->isValid()) {
                    $allowedExtensions = ['jpg', 'jpeg', 'png'];
                    $allowedMimeTypes = ['image/jpeg', 'image/jpg', 'image/png'];
                    $fileExt = $this->request->getFile('cover')->getClientExtension();
                    $fileMimeType = $this->request->getFile('cover')->getClientMimeType();

                    if (!in_array($fileExt, $allowedExtensions) || !in_array($fileMimeType, $allowedMimeTypes)) {
                        $msg = [
                            'error' => [
                                'cover' => 'File harus berupa JPG/JPEG/PNG'
                            ],
                        ];
                        echo json_encode($msg);
                        return;
                    }

                    $imageInfo = @getimagesize($this->request->getFile('cover')->getTempName());
                    if (!$imageInfo) {
                        $msg = [
                            'error' => [
                                'cover' => 'File harus berupa gambar',
                            ],
                        ];
                        echo json_encode($msg);
                        return;
                    }

                    $cover = $this->request->getFile('cover');
                    $filename = $cover->getRandomName();
                    $cover->move('writable/images/maps', $filename);

                    if ($old_data['cover'] !== 'no-image.jpg') {
                        @unlink('writable/images/maps/' . $old_data['cover']);
                    }
                } else {
                    $filename = $old_data['cover'];
                }

                $this->maps->update($id, [
                    'title' => $this->request->getVar('title'),
                    'category_id' => $this->request->getVar('kategori'),
                    'gmaps' => $this->request->getVar('gmaps'),
                    'desc' => $_POST['desc'],
                    'alamat' => $this->request->getVar('alamat'),
                    'cover' => $filename,
                    'status' => $this->request->getVar('status')
                ]);

                $msg = [
                    'message' => 'Berhasil update maps!'
                ];
            }
            echo json_encode($msg);
        }
    }


    public function delete()
    {
        if ($this->request->isAJAX()) {
            $id = decrypt_url($this->request->getVar('id'));

            $cover = $this->maps->find($id);

            $this->maps->delete($id);
            // $this->graphs->where('maps_id', $id)->delete();

            if ($cover['cover'] !== "no-image.jpg") {
                @unlink('writable/images/maps/' . $cover['cover']);
            }

            $msg = [
                'message' => 'Berhasil menghapus data !'
            ];

            return $this->response->setJSON($msg);
        }
    }
}
