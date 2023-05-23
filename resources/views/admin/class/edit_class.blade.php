<div class="eoff-form">
    <form method="POST" enctype="multipart/form-data" class="d-block ajaxForm" action="{{ route('admin.class.update', ['id' => $class->id]) }}">
         @csrf 
         <div class="form-row">
            <div class="fpb-7">
                <label for="code" class="eForm-label">{{ get_phrase('Code') }}</label>
                <input type="text" class="form-control eForm-control" id="code" name="code" value="{{$class->code}}" required>
            </div>
            <div class="fpb-7">
                <label for="name" class="eForm-label">{{ get_phrase('Name') }}</label>
                <input type="text" class="form-control eForm-control" id="name" name="name" value="{{$class->name}}" required>
            </div>
            <div class="fpb-7">
                <label for="subject" class="eForm-label">{{ get_phrase('Subject') }}</label>
                <select name="subject_id" id = "subject_on_class_creation" class="form-select eForm-select eChoice-multiple-with-remove"  required>
                    <option value="">{{ get_phrase('Select subject') }}</option>
                    <?php foreach($subjects as $subject): ?>
                        <option {{ $class->subject_id == $subject->id ?  'selected':'' }} value="{{ $subject['id'] }}">{{ $subject->name }}</option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="fpb-7">
                <label for="date" class="eForm-label">{{ get_phrase('Thời gian bắt đầu') }}</label>
                <input type="text" class="form-control eForm-control inputDate" id="date" name = "start_date" value="{{ date('d/m/y', $class->start_date) }}">
            </div>
            <div class="fpb-7">
                <label for="date" class="eForm-label">{{ get_phrase('Thời gian kết thúc') }}</label>
                <input type="text" class="form-control eForm-control inputDate" id="date" name = "end_date" value="{{ date('d/m/y', $class->end_date) }}">
            </div>
            <div class="fpb-7">
                <label for="class_room" class="eForm-label">{{ get_phrase('Địa điểm') }}</label>
                <select name="class_room_id" id = "class_room_on_class_creation" class="form-select eForm-select eChoice-multiple-with-remove">
                    <option value="">{{ get_phrase('Select subject') }}</option>
                    <?php foreach($class_rooms as $class_room): ?>
                        <option {{ $class->class_room_id == $class_room->id ?  'selected':'' }} value="{{ $class_room['id'] }}">{{ $class_room->name }}</option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="fpb-7">
                <label for="time_hours" class="eForm-label">{{ get_phrase('Thời lượng (số giờ học)') }}</label>
                <input type="text" class="form-control eForm-control" id="time_hours" name = "time_hours" value="{{$class->time_hours}}">
            </div>
            <div class="fpb-7">
                <label for="department" class="eForm-label">{{ get_phrase('Đối tượng') }}</label>
                <select name="department_id" id = "department_on_class_creation" class="form-select eForm-select eChoice-multiple-with-remove" >
                    <option value="">{{ get_phrase('Lựa chọn đối tượng đào tạo') }}</option>
                    <?php foreach($departments as $department): ?>
                        <option {{ $class->department_id == $department->id ?  'selected':'' }} value="{{ $department['id'] }}">{{ $department->name }}</option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="fpb-7">
                <label for="teacher" class="eForm-label">{{ get_phrase('Giảng viên') }}</label>
                <select name="teacher_id" id = "teacher_on_class_creation" class="form-select eForm-select eChoice-multiple-with-remove" >
                    <option value="">{{ get_phrase('Lựa chọn giảng viên') }}</option>
                    <?php foreach($teachers as $teacher): ?>
                        <option {{ $class->teacher_id == $teacher->id ?  'selected':'' }} value="{{ $teacher['id'] }}">{{ $teacher->name }}</option>
                    <?php endforeach; ?>
                </select>
            </div>
        </div>
            <div class="fpb-7 pt-2">
                <button class="btn-form" type="submit">{{ get_phrase('Update class') }}</button>
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
          minYear: 2000,
          maxYear: parseInt(moment().format("YYYY"), 10),
          locale: {
            format: 'DD-MM-YYYY'
            },
        },
        function (start, end, label) {
          var years = moment().diff(start, "years");
        }
      );
    });

</script>