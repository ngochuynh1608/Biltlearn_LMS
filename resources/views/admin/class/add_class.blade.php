<div class="eoff-form">
    <form method="POST" enctype="multipart/form-data" class="d-block ajaxForm" action="{{ route('admin.create.class') }}">
        @csrf 
        <div class="form-row">
            <div class="fpb-7">
                <label for="code" class="eForm-label">{{ get_phrase('Mã lớp') }}</label>
                <input type="text" class="form-control eForm-control" id="code" name="code" required>
            </div>
            <div class="fpb-7">
                <label for="name" class="eForm-label">{{ get_phrase('Tên lớp học') }}</label>
                <input type="text" class="form-control eForm-control" id="name" name="name" required>
            </div>
            <div class="fpb-7">
                <label for="subject" class="eForm-label">{{ get_phrase('Khóa học') }}</label>
                <select name="subject_id" id = "subject_on_class_creation" class="form-select eForm-select eChoice-multiple-with-remove"  required>
                    <option value="">{{ get_phrase('Chọn khóa học') }}</option>
                    <?php foreach($subjects as $subject): ?>
                        <option value="{{ $subject['id'] }}">{{ $subject->name }}</option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="fpb-7">
                <label for="date" class="eForm-label">{{ get_phrase('Thời gian bắt đầu') }}</label>
                <input type="text" class="form-control eForm-control inputDate" id="date" name = "start_date" value="{{ date('d/m/Y') }}">
            </div>
            <div class="fpb-7">
                <label for="date" class="eForm-label">{{ get_phrase('Thời gian kết thúc') }}</label>
                <input type="text" class="form-control eForm-control inputDate" id="date" name = "end_date" value="{{ date('d/m/Y') }}">
            </div>
            <div class="fpb-7">
                <label for="class_room" class="eForm-label">{{ get_phrase('Địa điểm') }}</label>
                <select name="class_room_id" id = "class_room_on_class_creation" class="form-select eForm-select eChoice-multiple-with-remove">
                    <option value="">{{ get_phrase('Lựa chọn địa điểm') }}</option>
                    <?php foreach($class_rooms as $class_room): ?>
                        <option value="{{ $class_room['id'] }}">{{ $class_room->name }}</option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="fpb-7">
                <label for="time_hours" class="eForm-label">{{ get_phrase('Thời lượng (số giờ học)') }}</label>
                <input type="text" class="form-control eForm-control" id="time_hours" name = "time_hours" value="">
            </div>
            <div class="fpb-7">
                <label for="work_unit" class="eForm-label">{{ get_phrase('Đối tượng') }}</label>
                <select name="work_unit_id" id = "workunit_on_class_creation" class="form-select eForm-select eChoice-multiple-with-remove" >
                    <option value="">{{ get_phrase('Chọn đơn vị') }}</option>
                    <?php foreach($work_units as $work_unit): ?>
                        <option value="{{ $work_unit['id'] }}">{{ $work_unit->name }}</option>
                    <?php endforeach; ?>
                </select>
                <hr/>
            </div>
            <div class="fpb-7">
                <label for="teacher" class="eForm-label">{{ get_phrase('Giảng viên') }}</label>
                <select name="teacher_id" id = "teacher_on_class_creation" class="form-select eForm-select eChoice-multiple-with-remove" >
                    <option value="">{{ get_phrase('Lựa chọn giảng viên') }}</option>
                    <?php foreach($teachers as $teacher): ?>
                        <option value="{{ $teacher['id'] }}">{{ $teacher->name }}</option>
                    <?php endforeach; ?>
                </select>
            </div>
        </div>
            <div class="fpb-7 pt-2">
                <button class="btn-form" type="submit">{{ get_phrase('Tạo lớp') }}</button>
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
          minYear: 2014,
          maxYear: parseInt(moment().format("YYYY"), 10),
          locale: {
            format: 'DD/MM/YYYY'
            },
        },
        function (start, end, label) {
          var years = moment().diff(start, "years");
        }
      );
    });

</script>

