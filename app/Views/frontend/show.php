<?= $this->extend('frontend/master') ?>
<?= $this->section('content'); ?>

<div class="flex flex-col mx-4 md:mx-24 my-4 md:my-20">
     <div class="h-full min-w-auto ">
          <?php if ($cover == 'cover360') : ?>
               <div class="flex justify-center items-center rounded-md bg-cover bg-center" style=" position: relative; min-height: 540px; background-image: url('<?= base_url('writable/images/maps/' . $maps['cover']) ?>');">
                    <div class="col-hero-inside-wrapper">
                         <a class="flex justify-center items-center" href=<?= base_url('/storage/destinasi/' . $maps['title'] . '/index.html'); ?> target="__blank">
                              <img class="img-play" src="<?= base_url("/assets/frontend/images/360-play-vt.png"); ?>" alt="play 360" />
                         </a>
                    </div>
               </div>
          <?php else : ?>
               <div class="flex justify-center items-center rounded-md bg-cover bg-center" style=" position: relative; min-height: 540px; background-image: url('<?= base_url('writable/images/maps/' . $maps['cover']) ?>');">
               </div>
          <?php endif; ?>
          <div class="flex justify-center items-center my-4 shadow-sm p-3 dark:shadow-sm shadow-gray-200 rounded-md">
               <h1 class="text-center text-2xl font-extrabold dark:text-gray-200"><?= ucwords($maps['title']); ?></h1>
          </div>
          <?php if (session()->get('logged_in')) : ?>
               <div class="flex items-center">
                    <div class="ml-2 flex flex-wrap items-center">
                         <input id="input-rating" data-maps_id="<?= encrypt_url($maps['id']); ?>" value="<?= number_format(get_rating($maps['id'])->rating, 1); ?>" type="text" step="0.1" min="0" max="5" class="hidden" data-size="sm" />
                         <span class="bg-blue-100 text-blue-800 text-sm mr-2 px-2.5 py-0.5 rounded dark:bg-blue-200 dark:text-blue-800 ml-2"><label for="input-rating" class="">Rating : <?= number_format(get_rating($maps['id'])->rating, 1); ?></label></span>
                    </div>
               </div>
          <?php endif; ?>
          <div class="text-xl font-serif dark:text-white my-4 shadow-sm p-3 dark:shadow-sm shadow-gray-200 rounded-md">
               <p><?= ucfirst($maps['desc']); ?></p>
          </div>
          <div class="flex justify-center items-center my-4 p-2 shadow-sm dark:shadow-sm shadow-gray-200 rounded-md">
               <?= ucwords($maps['gmaps']); ?>
          </div>
          <div class="flex flex-col my-4 shadow-sm p-3 dark:shadow-sm shadow-gray-200 rounded-md">
               <h1 class="text-center text-2xl font-extrabold dark:text-gray-200 mb-4">Comment</h1>
          </div>
          <div class="flex flex-col">
               <h3 class="mb-4 dark:text-gray-200"><span class="bg-blue-100 text-blue-800 text-md mr-2 px-2.5 py-0.5 rounded dark:bg-blue-200 dark:text-blue-800 ml-2"><?= count($komentar); ?></span> Comments</h3>
               <?php if (count($komentar) > 0) : ?>
                    <?php foreach ($komentar as $k) : ?>
                         <div class="space-y-4">
                              <div class="flex flex-col sm:flex-row items-start space-y-4 sm:space-y-0 sm:space-x-4 rounded-md sm:w-[400px] bg-blue-100 p-4 mb-6">
                                   <img src="<?= base_url('writable/images/profile/' . $k['foto']); ?>" alt="Profile Image" class="w-12 h-12 rounded-full">
                                   <div class="flex flex-col">
                                        <span class="font-bold dark:text-gray-900"><?= $k['nama']; ?></span>
                                        <span class="text-gray-500 text-sm dark:text-gray-900"><?= convertTanggal(date('Y-m-d', strtotime($k['created_at'])), true); ?></span>
                                        <p class="my-4 dark:text-gray-900"><?= ucfirst($k['body']); ?></p>
                                   </div>
                              </div>
                         </div>
                    <?php endforeach; ?>
               <?php else : ?>
                    <div class="flex mb-4 dark:text-gray-200">
                         <p class="text-md">Belum ada komentar.</p>
                    </div>
               <?php endif; ?>
          </div>
          <div class="flex flex-col rounded-md shadow-md w-[600px] h-[275px] bg-blue-100 p-4">
               <h1 class="mx-2 mb-4
                font-bold text-xl text-black dark:text-gray-900">Tinggalkan komentar</h1>
               <?php if (session()->get('logged_in')) : ?>
                    <form method="post" action="<?= site_url('komentar'); ?>" onsubmit="komentar(this)">
                         <input type="hidden" name="maps_id" value="<?= encrypt_url($maps['id']); ?>">
                         <div class="grid grid-cols-1 gap-3">
                              <div>
                                   <textarea class="form-control bg-white border border-gray-300 rounded-md p-3 w-full" rows="5" placeholder="Comment" name="body"></textarea>
                              </div>
                              <div>
                                   <button class="btn-simpan bg-blue-500 hover:bg-blue-600 text-white font-semibold py-3 px-4 rounded-md w-full" type="submit">Leave Your Comment</button>
                              </div>
                         </div>
                    </form>
               <?php else : ?>
                    <div class="flex flex-col">
                         <p class="my-8">Login untuk memberikan komentar di wisata ini.</p><br>
                    </div>
                    <a href="<?= site_url('auth/login'); ?>" class="text-center text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2.5 text-center inline-flex items-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 mt-10 p-2">Login for New Journey!</a>
               <?php endif; ?>
          </div>
     </div>
</div>

<script>
     function komentar(form) {
          event.preventDefault();

          var formData = new FormData(form);

          $.ajax({
               url: '<?= site_url('komentar'); ?>',
               type: 'post',
               data: formData,
               dataType: 'json',
               contentType: false,
               processData: false,
               success: function(response) {
                    if (response.error) {
                         // Display validation errors
                         var errors = response.error;
                         for (var key in errors) {
                              $("#" + key + "_error").text(errors[key]).show();
                         }
                    } else {
                         // Display success message
                         Swal.fire({
                              title: "Success!",
                              text: response.message,
                              icon: "success",
                              showConfirmButton: false,
                              timer: 2000
                         }).then(() => {
                              // Refresh the page or perform any other actions
                              window.location.reload();
                         });
                    }

               },
               error: function(xhr, textStatus, errorThrown) {
                    // Display error message
                    Swal.fire({
                         title: "Error!",
                         text: "An error occurred. Please try again.",
                         icon: "error",
                         showConfirmButton: true
                    });
               }
          });
     }
     // Inisialisasi input rating menggunakan Kartik Rating
     $('#input-rating').rating({
          theme: 'krajee-svg',
          filledStar: '<span class="text-yellow-400"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="h-5 w-5"><path fill-rule="evenodd" d="M10 1L7 7H1l5 3.5L3 17l7-4.5L17 17l-2-6.5L19 7h-6l-3-6z" clip-rule="evenodd" /></svg></span>',
          emptyStar: '<span class="text-gray-400"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="h-5 w-5"><path fill-rule="evenodd" d="M10 1L7 7H1l5 3.5L3 17l7-4.5L17 17l-2-6.5L19 7h-6l-3-6z" clip-rule="evenodd" /></svg></span>',
          showClear: false,
          showCaption: false,
          size: 'sm',
          starCaptions: function(val) {
               return val;
          },
          starCaptionClasses: function(val) {
               return '';
          },
          clearCaptionClass: ''
     });

     // Rating change
     $('#input-rating').on('rating:change', function(event, value, caption) {
          $('#input-rating').val(value);

          var maps_id = $('#input-rating').data('maps_id');
          $.ajax({
               url: '<?= site_url('rating'); ?>',
               type: 'post',
               data: {
                    maps_id: maps_id,
                    rating: value
               },
               dataType: 'json',
               success: function(response) {
                    if (response.status == 'invalid_login') {
                         Swal.fire({
                              title: "Oppps!",
                              text: response.message,
                              icon: "error",
                              showConfirmButton: true,
                              showDenyButton: true,
                              allowOutsideClick: false,
                              allowEscapeKey: false,
                         }).then((result) => {
                              if (result.isConfirmed) {
                                   window.location.href = site_url + 'auth/login';
                              }
                         });
                    } else {
                         Swal.fire({
                              title: "Yeayy!",
                              text: response.message,
                              icon: "success",
                              showConfirmButton: false,
                              timer: 1100,
                         }).then(() => {
                              window.location.reload();
                         });
                    }
               }
          });
     });
</script>


<?= $this->endSection('content'); ?>