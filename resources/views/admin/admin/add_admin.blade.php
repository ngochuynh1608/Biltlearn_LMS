<div class="eForm-layouts">
    <form method="POST" enctype="multipart/form-data" class="d-block ajaxForm" action="{{ route('admin.create') }}">
        @csrf 
        <div class="form-row">
            <div class="fpb-7">
                <label for="name" class="eForm-label">{{ get_phrase('Name') }}</label>
                <input type="text" class="form-control eForm-control" id="name" name = "name" required>
            </div>

            <div class="fpb-7">
                <label for="email" class="eForm-label">{{ get_phrase('Email') }}</label>
                <input type="email" class="form-control eForm-control" id="email" name = "email" required>
            </div>

            <div class="fpb-7">
                <label for="password" class="eForm-label">{{ get_phrase('Password') }}</label>
                <input type="password" class="form-control eForm-control" id="password" name = "password" required>
            </div>

            <div class="row fmb-14 justify-content-between align-items-center">
                <label for="workunit_id" class="col-sm-2 col-eForm-label">{{ get_phrase('Công ty') }}</label>
                <div class="col-md-10">
                    <select name="workunit_id" id = "workunit_id_on_routine_creation" class="form-select eForm-select eChoice-multiple-with-remove"  required>
                        <option value="">{{ get_phrase('Lựa chọn công ty') }}</option>
                        <?php foreach($data['workunits'] as $workunit): ?>
                            <option value="{{ $workunit['name'] }}">{{ $workunit['name'] }}</option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>

            <div class="row fmb-14 justify-content-between align-items-center">
                <label for="khoi" class="col-sm-2 col-eForm-label">{{ get_phrase('Khối') }}</label>
                <div class="col-sm-10 col-md-9 col-lg-10">
                    <input type="text" class="form-control eForm-control" id="khoi" name="khoi">
                </div>
            </div>

            <div class="row fmb-14 justify-content-between align-items-center">
                <label for="department_id" class="col-sm-2 col-eForm-label">{{ get_phrase('Bộ phận') }}</label>
                <div class="col-md-10">
                    <select name="department_id" id = "department_id_on_routine_creation" class="form-select eForm-select eChoice-multiple-with-remove"  required>
                        <option value="">{{ get_phrase('Lựa chọn phòng ban') }}</option>
                        <?php foreach($data['departments'] as $department): ?>
                            <option value="{{ $department['name'] }}">{{ $department['name'] }}</option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>

        <div class="row fmb-14 justify-content-between align-items-center">
            <label for="title" class="col-sm-2 col-eForm-label">{{ get_phrase('Chức danh') }}</label>
            <div class="col-sm-10 col-md-9 col-lg-10">
                <input type="text" class="form-control eForm-control" id="title" name="title">
            </div>
        </div>

        <div class="row fmb-14 justify-content-between align-items-center">
            <label for="level_id" class="col-sm-2 col-eForm-label">{{ get_phrase('Level') }}</label>
            <div class="col-md-10">
                <input type="text" class="form-control eForm-control" id="level" name="level">
            </div>
        </div>


            <div class="fpb-7">
                <label for="phone" class="eForm-label">{{ get_phrase('Số điện thoại') }}</label>
                <input type="text" class="form-control eForm-control" id="phone" name = "phone" required>
            </div>

            <div class="fpb-7">
              <label for="formFile" class="eForm-label"
                >{{ get_phrase('Ảnh') }}</label
              >
              <input
                class="form-control eForm-control-file"
                id="photo" name="photo" accept="image/*"
                type="file"
              />
            </div>

            <div class="fpb-7 pt-2">
                <button class="btn-form" type="submit">{{ get_phrase('Tạo mới') }}</button>
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