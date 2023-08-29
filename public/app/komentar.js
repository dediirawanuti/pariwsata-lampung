$(document).ready(function () {
  loadData();
});

function loadData() {
  $("#datatables").DataTable({
    processing: true,
    serverSide: true,
    bDestroy: true,
    responsive: true,
    ajax: {
      url: site_url + "admin/komentar/datatables",
      type: "post",
    },
    order: [],
    columns: [
      {
        data: "no",
        orderable: false,
      },
      {
        data: "nama",
      },
      {
        data: "title",
      },
      {
        data: "body",
        render: function (data) {
          return data.substring(0, 100) + '...';
        }
      },
      {
        data: "status",
      },
      {
        data: "option",
        orderable: false,
      },
    ],
    columnDefs: [
      {
        targets: [3, 4],
        className: "align-middle",
      },
      {
        targets: [0],
        className: "align-middle text-center",
      },
      {
        targets: [1, 2, 5],
        className: "align-middle",
      },
    ],
    order: [[1, "desc"]],
    drawCallback: function (settings) {
      $('[data-toggle="tooltip"]').tooltip();
    },
  });
}

function store() {
  const form = $("#form_add")[0];
  const data = new FormData(form);
  $.ajax({
    type: "post",
    url: site_url + "admin/komentar/store",
    data: data,
    enctype: "multipart/form-data",
    processData: false,
    contentType: false,
    cache: false,
    dataType: "json",
    beforeSend: function () {
      $(".btn-simpan").html(
        '<div class="spinner-border spinner-border-sm text-danger" role="status"><span class="visually-hidden">Loading...</span></div> Loading...'
      );
      $(".btn-cencel").hide(100);
      $(".btn-simpan").attr("disabled", true);
    },
    complete: function () {
      $(".btn-simpan").removeAttr("disabled");
      $(".btn-cencel").show(100);
      $(".btn-simpan").html("Tambah User");
    },
    error: function (xhr, ajaxOptions, thrownerror) {
      alert(xhr.status + "\n" + xhr.responseText + "\n" + thrownerror);
    },
    success: function (response) {
      if (response.error) {
        if (response.error.nama) {
          $("#nama").addClass("is-invalid");
          $("#error_nama").html(response.error.nama);
        } else {
          $("#nama").removeClass("is-invalid");
          $("#error_nama").html("");
        }
        if (response.error.username) {
          $("#username").addClass("is-invalid");
          $("#error_username").html(response.error.username);
        } else {
          $("#username").removeClass("is-invalid");
          $("#error_username").html("");
        }
        if (response.error.email) {
          $("#email").addClass("is-invalid");
          $("#error_email").html(response.error.email);
        } else {
          $("#email").removeClass("is-invalid");
          $("#error_email").html("");
        }
        if (response.error.password) {
          $("#password").addClass("is-invalid");
          $("#error_password").html(response.error.password);
        } else {
          $("#password").removeClass("is-invalid");
          $("#error_password").html("");
        }
        if (response.error.ulangi_password) {
          $("#ulangi_password").addClass("is-invalid");
          $("#error_ulangi_password").html(response.error.ulangi_password);
        } else {
          $("#ulangi_password").removeClass("is-invalid");
          $("#error_ulangi_password").html("");
        }
        if (response.error.hak_akses) {
          $("#hak_akses").addClass("is-invalid");
          $("#error_hak_akses").html(response.error.hak_akses);
        } else {
          $("#hak_akses").removeClass("is-invalid");
          $("#error_hak_akses").html("");
        }
        if (response.error.status) {
          $(".status").addClass("is-invalid");
          $(".error_status").html(response.error.status);
        } else {
          $(".status").removeClass("is-invalid");
          $(".error_status").html("");
        }
        if (response.error.foto) {
          $("#foto").addClass("is-invalid");
          $("#error_foto").html(response.error.foto);
        } else {
          $("#foto").removeClass("is-invalid");
          $("#error_foto").html("");
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
        loadData();
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
}

function detail(id) {
  $.ajax({
    type: "post",
    url: site_url + "admin/komentar/detail",
    data: {
      id: id,
    },
    dataType: "json",
    success: function (response) {
      $(".view_modal").html(response.message);
      let myModal = new bootstrap.Modal(
        document.getElementById("modal_detail"),
        {
          keyboard: false,
        }
      );
      myModal.show();
    },
    error: function (xhr, ajaxOptions, thrownerror) {
      Swal.fire({
        title: "Maaf gagal load data!",
        html: `Silahkan Cek kembali Kode Error: <strong>${
          xhr.status + "\n"
        }</strong> `,
        icon: "error",
        showConfirmButton: false,
        timer: 3100,
      });
    },
  });
}

function approve(id) {
  Swal.fire({
    title: "Apakah anda yakin?",
    text: "Proses ini akan menyetujui komentar dan akan di tampilkan di sisi user!",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Ya, Approve!",
  }).then((result) => {
    if (result.isConfirmed) {
      $.ajax({
        type: "post",
        url: site_url + "admin/komentar/approve",
        data: {
          id: id,
        },
        dataType: "json",
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
        error: function (xhr, ajaxOptions, thrownerror) {
          Swal.fire({
            title: "Maaf gagal load data!",
            html: `Silahkan Cek kembali Kode Error: <strong>${
              xhr.status + "\n"
            }</strong> `,
            icon: "error",
            showConfirmButton: false,
            timer: 3100,
          });
        },
      });
    }
  });
}

function reject(id) {
  Swal.fire({
    title: "Apakah anda yakin?",
    text: "Proses ini akan menolak komentar yang telah diberikan oleh user!",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Ya, Reject!",
  }).then((result) => {
    if (result.isConfirmed) {
      $.ajax({
        type: "post",
        url: site_url + "admin/komentar/reject",
        data: {
          id: id,
        },
        dataType: "json",
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
        error: function (xhr, ajaxOptions, thrownerror) {
          Swal.fire({
            title: "Maaf gagal load data!",
            html: `Silahkan Cek kembali Kode Error: <strong>${
              xhr.status + "\n"
            }</strong> `,
            icon: "error",
            showConfirmButton: false,
            timer: 3100,
          });
        },
      });
    }
  });
}

function hapus(id) {
  Swal.fire({
    title: "Apakah anda yakin?",
    text: "Proses ini akan menghapus komentar secara permanent!",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Ya, hapus!",
  }).then((result) => {
    if (result.isConfirmed) {
      let csrf = $('meta[name="csrf-token"]').attr("content");
      $.ajax({
        url: site_url + "admin/komentar/delete",
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
}
