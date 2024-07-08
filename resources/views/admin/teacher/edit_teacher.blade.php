<div class="eForm-layouts">
    <form method="POST" enctype="multipart/form-data" class="d-block ajaxForm" action="{{ route('admin.teacher.update', ['id' => $user->id]) }}">
         @csrf 
        <div class="form-row">

            <div class="fpb-7">
                <label for="name" class="eForm-label">{{ get_phrase('Tên') }}</label>
                <input type="text" class="form-control eForm-control" value="{{ $user->name }}" id="name" name = "name" required>
            </div>

            <div class="fpb-7">
                <label for="email" class="eForm-label">{{ get_phrase('Email') }}</label>
                <input type="email" class="form-control  eForm-control" value="{{ $user->email }}" id="email" name = "email" required>
            </div>
            <?php 
            $info = json_decode($user->user_information);
            ?>

            <div class="fpb-7">
                <label for="title" class="eForm-label">{{ get_phrase('Chức danh') }}</label>
                <input type="text" class="form-control eForm-control" value="{{ $user->title }}" id="title" name = "title" required>
            </div>

            <div class="fpb-7">
                <label for="department_id" class="eForm-label">{{ get_phrase("Bộ phận") }}</label>
                <select name="department_id" id="department_id" class="form-select eForm-select eChoice-multiple-with-remove" required>
                    <option value="">{{ get_phrase("Phòng ban") }}</option>
                    @foreach($departments as $department)
                        <option value="{{ $department->id }}" {{ $department['id'] == $user->department_id ?  'selected':'' }}>{{ $department->name }}</option>
                    @endforeach
                </select>
            </div>



            <div class="fpb-7">
                <label for="phone" class="eForm-label">{{ get_phrase('Số điện thoại') }}</label>
                <input type="text" class="form-control  eForm-control" value="{{ $info->phone }}" id="phone" name = "phone" required>
            </div>


            <div class="fpb-7">
              <label for="formFile" class="eForm-label"
                >{{ get_phrase('Photo') }}</label
              >
              <input
                class="form-control eForm-control-file"
                id="photo" name="photo" accept="image/*"
                type="file"
              />
            </div>

            <div class="form-group mt-2 col-md-12">
                <button class="btn-form" type="submit">{{ get_phrase('Update') }}</button>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    "use strict";
    $(document).ready(function () {
      $(".eChoice-multiple-with-remove").select2();
    });

    $(function () {
      $('.inputDate').daterangepicker(
        {
          singleDatePicker: true,
          showDropdowns: true,
          minYear: 1901,
          maxYear: parseInt(moment().format("YYYY"), 10),
        },
        function (start, end, label) {
          var years = moment().diff(start, "years");
        }
      );
    });
</script>