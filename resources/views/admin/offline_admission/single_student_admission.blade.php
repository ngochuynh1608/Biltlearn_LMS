<div class="eForm-layouts">
    <form method="POST" enctype="multipart/form-data" class="d-block ajaxForm" action="{{ route('admin.offline_admission.create') }}">
        @csrf 

        <div class="row fmb-14 justify-content-between align-items-center">
            <label for="code"
                class="col-sm-2 col-eForm-label">{{ get_phrase('Mã nhân viên') }}</label>
            <div class="col-sm-10 col-md-9 col-lg-10">
                <input type="code" class="form-control eForm-control" id="code" name="code" required>
            </div>
        </div>

        <div class="row fmb-14 justify-content-between align-items-center">
            <label for="name" class="col-sm-2 col-eForm-label">{{ get_phrase('Tên đầy đủ') }}</label>
            <div class="col-sm-10 col-md-9 col-lg-10">
                <input type="text" class="form-control eForm-control" id="name" name="name" required>
            </div>
        </div>

        <div class="row fmb-14 justify-content-between align-items-center">
            <label for="email"
                class="col-sm-2 col-eForm-label">{{ get_phrase('Email') }}</label>
            <div class="col-sm-10 col-md-9 col-lg-10">
                <input type="email" class="form-control eForm-control" id="email" name="email" required>
            </div>
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

        <div class="row fmb-14 justify-content-between align-items-center">
            <label for="birthdatepicker" class="col-sm-2 col-eForm-label">{{ get_phrase('Bắt đầu làm việc') }}<span class="required"></span></label>
            <div class="col-md-10">
                <input type="text" class="form-control eForm-control" id="eInputDate" name="eDefaultDateRange" value="{{ date('m/d/Y') }}" />
            </div>
        </div>

        <div class="row fmb-14 justify-content-between align-items-center">
            <label for="phone" class="col-sm-2 col-eForm-label">{{ get_phrase('Số điện thoại') }}</label>
            <div class="col-md-10">
                <input type="text" id="phone" name="phone" class="form-control eForm-control">
            </div>
        </div>

        <div class="row fmb-14 justify-content-between align-items-center">
            <label for="photo" class="col-sm-2 col-eForm-label">{{ get_phrase('Ảnh đại diện') }}</label>
            <div class="col-md-10">
                <input class="form-control eForm-control-file" type="file" id="photo" name="photo" accept="image/*">
            </div>
        </div>

        <div class="row">
            <div class="col-sm-10 offset-sm-2">
                <button type="submit" class="btn-form">{{ get_phrase('Thêm học viên') }}</button>
            </div>
        </div>
    </form>
</div>


<script type="text/javascript">

    "use strict";

    $(document).ready(function () {
      $(".eChoice-multiple-users").select2({
        multiple: true,
      });
    });

</script>