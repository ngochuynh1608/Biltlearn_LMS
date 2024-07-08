<?php 
use App\Models\Section;
use App\Models\Department;
?>
<div class="eoff-form">
    <form method="POST" enctype="multipart/form-data" class="d-block ajaxForm" action="{{ route('admin.student.update', ['id' => $user->id]) }}">
         @csrf 
        <div class="form-row">
            <div class="fpb-7">
                <label for="code" class="eForm-label">{{ get_phrase('Mã học viên') }}</label>
                <input type="text" class="form-control eForm-control" value="{{ $user->code }}" id="code" name = "code" required>
            </div>
            <div class="fpb-7">
                <label for="name" class="eForm-label">{{ get_phrase('Name') }}</label>
                <input type="text" class="form-control eForm-control" value="{{ $user->name }}" id="name" name = "name" required>
            </div>

            <div class="fpb-7">
                <label for="email" class="eForm-label">{{ get_phrase('Email') }}</label>
                <input type="email" class="form-control eForm-control" value="{{ $user->email }}" id="email" name = "email" required>
            </div>

            <div class="fpb-7">
                <label for="workunit_id" class="eForm-label">{{ get_phrase('Đơn vị') }}</label>
                <select name="workunit_id" id = "workunit_id_on_routine_creation" class="form-select eForm-select eChoice-multiple-with-remove"  required>
                    <option value="">{{ get_phrase('Lựa chọn đơn vị') }}</option>
                    <?php foreach($workunits as $workunit): ?>
                        <option {{ $user->workunit == $workunit->name ?  'selected':'' }}  value="{{ $workunit['name'] }}">{{ $workunit['name'] }}</option>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="fpb-7">
                <label for="department_id" class="eForm-label">{{ get_phrase('Phòng ban') }}</label>
                <select name="department_id" id = "department_id_on_routine_creation" class="form-select eForm-select eChoice-multiple-with-remove"  required>
                    <option value="">{{ get_phrase('Lựa chọn phòng ban') }}</option>
                    <?php foreach($departments as $department): ?>
                        <option {{ $user->department == $department->name ?  'selected':'' }} value="{{ $department['name'] }}">{{ $department['name'] }}</option>
                    <?php endforeach; ?>
                </select>
            </div>


            <?php 
            $info = json_decode($user->user_information);
            ?>


            <div class="fpb-7">
                <label for="phone" class="eForm-label">{{ get_phrase('Số điệnt thoại') }}</label>
                <input type="text" class="form-control eForm-control" value="{{ $info->phone }}" id="phone" name = "phone" placeholder="Provide student number">
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

            <div class="fpb-7 pt-2">
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

    function classWiseSection(classId) {
        let url = "{{ route('admin.class_wise_sections', ['id' => ":classId"]) }}";
        url = url.replace(":classId", classId);
        $.ajax({
            url: url,
            success: function(response){
                $('#section_id').html(response);
            }
        });
    }

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