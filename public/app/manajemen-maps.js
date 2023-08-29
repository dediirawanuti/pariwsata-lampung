$(document).ready(function () {
  loadData();
});

loadData = () => {
  $("#datatables").DataTable({
    processing: true,
    serverSide: true,
    bDestroy: true,
    responsive: true,
    ajax: {
      url: site_url + "admin/maps/datatables",
      type: "POST",
    },
    order: [],
    columns: [
      {
        data: "no",
        orderable: false,
      },
      {
        data: "title",
      },
      {
        data: "nama",
      },
      {
        data: "cover",
        render: function (data) {
          return (
            "<img src=" +
            site_url +
            "writable/images/maps/" +
            data +
            ' class="mx-auto d-block" alt="cover" id="cover" style="width: 150px; height: 150px; !important">'
          );
        },
      },
      {
        data: "status",
      },
      {
        data: "option",
        orderable: false,
      },
    ],
  });
};

add = () => {
  $.ajax({
    url: site_url + "admin/maps/add",
    type: "POST",
    dataType: "JSON",
    success: function (response) {
      $(".view_modal").html(response.message);
      let myModal = new bootstrap.Modal($("#modal_add"), {
        keyboard: false,
      });
      myModal.show();
    },
  });
};

readURLLogo = (input) => {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $("#foto_show").attr("src", e.target.result);
    };

    reader.readAsDataURL(input.files[0]);
  }
};

$(document).on("change", "#foto", function (e) {
  readURLLogo(this);
});

store = () => {
  const form = $("#form_add")[0];
  const data = new FormData(form);

  $.ajax({
    url: site_url + "admin/maps/store",
    type: "POST",
    data: data,
    dataType: "JSON",
    processData: false,
    contentType: false,
    cache: false,
    beforeSend: function () {
      $(".btn-simpan").html(
        '<div class="spinner-border spinner-border-sm text-danger" role="status"><span class="visually-hidden">Loading...</span></div> Loading...'
      );
      $(".btn-cancel").hide(100);
      $(".btn-simpan").attr("disabled", true);
    },
    complete: function () {
      $(".btn-simpan").removeAttr("disabled");
      $(".btn-cancel").show(100);
      $(".btn-simpan").html("Tambah User");
    },
    success: function (response) {
      if (response.error) {
        if (response.error.title) {
          $("#title").addClass("is-invalid");
          $("#error_title").html(response.error.title);
        } else {
          $("#title").removeClass("is-invalid");
          $("#error_title").html("");
        }

        if (response.error.alamat) {
          $("#alamat").addClass("is-invalid");
          $("#error_alamat").html(response.error.alamat);
        } else {
          $("#alamat").removeClass("is-invalid");
          $("#error_alamat").html("");
        }

        if (response.error.cover) {
          $("#foto").addClass("is-invalid");
          $("#error_cover").html(response.error.cover);
          $("#current_cover").attr("src", $("#current_cover").data("default"));
        } else {
          $("#foto").removeClass("is-invalid");
          $("#error_cover").html("");
        }
      } else {
        $("#modal_add").modal("hide");
        Swal.fire({
          title: "Berhasil!",
          text: response.message,
          icon: "success",
          showConfirmButton: false,
          timer: 2100,
        });
        setTimeout(() => {
          location.href = site_url + "admin/maps/manajemen-maps";
        }, 1000);
      }
    },
    error: function (xhr, ajaxOptions, thrownerror) {
      $("#modal_add").modal("hide");
      Swal.fire({
        title: "Maaf data gagal di muat!",
        html: `Silahkan Cek kembali Kode Error: <strong>${
          xhr.status + "\n"
        }</strong> `,
        icon: "error",
        showConfirmButton: false,
        timer: 2100,
      });
    },
  });
};

// store = () => {
//   const form = $("#form_add")[0];
//   const data = new FormData(form);

//   const fileInput = $("#foto");
//   const file = fileInput[0].files[0];
//   const allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;
//   const maxSize = 2 * 1024 * 1024; // 2MB

//   if (file) {
//     // Memeriksa jenis file
//     if (!allowedExtensions.exec(file.name)) {
//       fileInput.addClass("is-invalid");
//       $("#error_cover").html("Format file yang diizinkan: JPG, JPEG, PNG");
//       return;
//     }

//     // Memeriksa ukuran file
//     if (file.size > maxSize) {
//       fileInput.addClass("is-invalid");
//       $("#error_cover").html("Ukuran file maksimal adalah 2MB");
//       return;
//     }

//     // Memeriksa apakah file adalah gambar
//     const reader = new FileReader();
//     reader.onload = function (event) {
//       const img = new Image();
//       img.src = event.target.result;
//       img.onload = function () {
//         if (this.width === 0 || this.height === 0) {
//           fileInput.addClass("is-invalid");
//           $("#error_cover").html("File yang diunggah bukan gambar");
//           $("#foto_show").attr(
//             "src",
//             "<?= base_url('writable/images/maps/no-image.jpg'); ?>"
//           );
//           return;
//         } else {
//           // Submit the form data via AJAX
//           submitFormData(data);
//         }
//       };
//       reader.readAsDataURL(file);
//     };
//   } else {
//     // Submit the form data via AJAX
//     submitFormData(data);
//   }
// };

// submitFormData = (formData) => {
//   $.ajax({
//     url: site_url + "admin/maps/store",
//     type: "POST",
//     data: formData,
//     dataType: "JSON",
//     processData: false,
//     contentType: false,
//     cache: false,
//     beforeSend: function () {
//       $(".btn-simpan").html(
//         '<div class="spinner-border spinner-border-sm text-danger" role="status"><span class="visually-hidden">Loading...</span></div> Loading...'
//       );
//       $(".btn-cencel").hide(100);
//       $(".btn-simpan").attr("disabled", true);
//     },
//     complete: function () {
//       $(".btn-simpan").removeAttr("disabled");
//       $(".btn-cencel").show(100);
//       $(".btn-simpan").html("Tambah User");
//     },
//     error: function (xhr, ajaxOptions, thrownerror) {
//       alert(xhr.status + "\n" + xhr.responseText + "\n" + thrownerror);
//     },
//     success: function (response) {
//       if (response.error) {
//         if (response.error.title) {
//           $("#title").addClass("is-invalid");
//           $("#error_title").html(response.error.title);
//         } else {
//           $("#title").removeClass("is-invalid");
//           $("#error_title").html("");
//         }

//         if (response.error.cover) {
//           $("#cover").addClass("is-invalid");
//           $("#error_cover").html(response.error.cover);
//           $("#current_cover").attr("src", $("#current_cover").data("default"));
//         } else {
//           $("#cover").removeClass("is-invalid");
//           $("#error_cover").html("");
//         }
//       } else {
//         $("#modal_add").modal("hide");
//         Swal.fire({
//           title: "Berhasil!",
//           text: response.message,
//           icon: "success",
//           showConfirmButton: false,
//           timer: 2100,
//         });
//         setTimeout(() => {
//           location.href = site_url + "admin/maps/manajemen-maps";
//         }, 1000);
//       }
//     },
//     error: function (xhr, ajaxOptions, thrownerror) {
//       $("#modal_add").modal("hide");
//       Swal.fire({
//         title: "Maaf data gagal di muat!",
//         html: `Silahkan Cek kembali Kode Error: <strong>${
//           xhr.status + "\n"
//         }</strong> `,
//         icon: "error",
//         showConfirmButton: false,
//         timer: 2100,
//       });
//     },
//   });
// };

submitFormData = (formData) => {
  $.ajax({
    url: site_url + "admin/maps/store",
    type: "POST",
    data: formData,
    dataType: "JSON",
    processData: false,
    contentType: false,
    cache: false,
    beforeSend: function () {
      // Mengatur state tombol dan pesan loading
      $(".btn-simpan").html(
        '<div class="spinner-border spinner-border-sm text-danger" role="status"><span class="visually-hidden">Loading...</span></div> Loading...'
      );
      $(".btn-cancel").hide(100);
      $(".btn-simpan").attr("disabled", true);
    },
    complete: function () {
      // Mengembalikan state tombol setelah request selesai
      $(".btn-simpan").removeAttr("disabled");
      $(".btn-cancel").show(100);
      $(".btn-simpan").html("Tambah User");
    },
    success: function (response) {
      if (response.error) {
        // Menampilkan pesan error jika terdapat error pada respons
        if (response.error.title) {
          $("#title").addClass("is-invalid");
          $("#error_title").html(response.error.title);
        } else {
          $("#title").removeClass("is-invalid");
          $("#error_title").html("");
        }

        if (response.error.alamat) {
          $("#alamat").addClass("is-invalid");
          $("#error_alamat").html(response.error.alamat);
        } else {
          $("#alamat").removeClass("is-invalid");
          $("#error_alamat").html("");
        }

        if (response.error.cover) {
          $("#cover").addClass("is-invalid");
          $("#error_cover").html(response.error.cover);
          $("#current_foto").attr("src", $("#current_foto").data("default"));
        } else {
          $("#cover").removeClass("is-invalid");
          $("#error_cover").html("");
        }
      } else {
        // Tampilkan pesan sukses
        Swal.fire({
          title: "Berhasil!",
          text: response.message,
          icon: "success",
          showConfirmButton: false,
          timer: 2100,
        });

        // Redirect atau lakukan aksi lain setelah sukses
        setTimeout(() => {
          location.href = site_url + "admin/maps/manajemen-maps";
        }, 1000);
      }
    },
    error: function (xhr, ajaxOptions, thrownerror) {
      // Menampilkan pesan error jika terjadi error pada AJAX request
      Swal.fire({
        title: "Maaf, data gagal di muat!",
        html: `Silahkan Cek kembali Kode Error: <strong>${xhr.status}</strong>`,
        icon: "error",
        showConfirmButton: false,
        timer: 2100,
      });
    },
  });
};

update = () => {
  const form = $("#form_edit")[0];
  const data = new FormData(form);

  $.ajax({
    url: site_url + "admin/maps/update",
    method: "POST",
    data: data,
    dataType: "JSON",
    processData: false,
    contentType: false,
    cache: false,
    beforeSend: function () {
      $(".btn-simpan").html(
        '<div class="spinner-border spinner-border-sm text-danger" role="status"><span class="visually-hidden">Loading...</span></div> Loading...'
      );
      $(".btn-cencel").hide(100);
      $(".btn-simpan").attr("disabled", true);
    },
    success: function (response) {
      if (response.error) {
        if (response.error.title) {
          $("#title").addClass("is-invalid");
          $("#error_title").html(response.error.title);
        } else {
          $("#title").removeClass("is-invalid");
          $("#error_title").html("");
        }

        if (response.error.alamat) {
          $("#alamat").addClass("is-invalid");
          $("#error_alamat").html(response.error.alamat);
        } else {
          $("#alamat").removeClass("is-invalid");
          $("#error_alamat").html("");
        }

        if (response.error.cover) {
          $("#foto").addClass("is-invalid");
          $("#error_cover").html(response.error.cover);
        } else {
          $("#foto").removeClass("is-invalid");
          $("#error_cover").html("");
        }
      } else {
        Swal.fire({
          title: "Berhasil!",
          text: response.message,
          icon: "success",
          showConfirmButton: false,
          timer: 2100,
        }).then(() => {
          // Pengalihan halaman
          location.href = site_url + "admin/maps/manajemen-maps";
        });
      }
    },
    complete: function () {
      $(".btn-simpan").removeAttr("disabled");
      $(".btn-cencel").show(100);
      $(".btn-simpan").html("Tambah User");
    },
    error: function (xhr, ajaxOptions, thrownerror) {
      alert(xhr.status + "\n" + xhr.responseText + "\n" + thrownerror);
    },
  });
};

hapus = (id) => {
  Swal.fire({
    title: "Apakah anda yakin?",
    text: "Proses ini akan menghapus data secara permanent!",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Ya, hapus!",
  }).then((result) => {
    if (result.isConfirmed) {
      let csrf = $('meta[name="csrf-token"]').attr("content");
      $.ajax({
        url: site_url + "admin/maps/delete",
        data: {
          id: id,
          _method: "DELETE",
          _token: csrf,
        },
        type: "POST",
        dataType: "JSON",
        success: function (response) {
          Swal.fire({
            title: "Berhasil!",
            text: response.message,
            icon: "success",
            showConfirmButton: false,
            timer: 2100,
          });
          loadData();
        },
        error: function (jqXHR, textStatus, errorThrown) {
          Swal.fire({
            title: "Maaf data gagal di hapus!",
            html: `Silahkan Cek kembali Kode Error: <strong>${
              jqXHR.status + "\n"
            }</strong> `,
            icon: "error",
            showConfirmButton: false,
            timer: 2100,
          });
        },
      });
    }
  });
};
